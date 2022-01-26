import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';
import 'package:expense_tracker_app/src/bloc/submission_state.dart';
import 'package:expense_tracker_app/src/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/models/category.dart';

import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction_type.dart';
import 'package:expense_tracker_app/src/pages/new_transaction/widgets/description_form_field.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/widgets/error_dialog.dart';
import 'package:expense_tracker_app/src/widgets/loading_dialog.dart';
import 'package:expense_tracker_app/src/widgets/submit_button.dart';
import "../../../extenstions/number_helper.dart";

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/balance_text_field.dart';

import 'account_form_field.dart';
import 'attachment_bottom_sheet.dart';
import 'category_form_field.dart';

class InternalTransactionForm extends StatefulWidget {
  const InternalTransactionForm({
    Key? key,
  }) : super(key: key);

  @override
  State<InternalTransactionForm> createState() =>
      _InternalTransactionFormState();
}

class _InternalTransactionFormState extends State<InternalTransactionForm> {
  Category? _selectedCategory;
  String? _selectedAccountId;
  final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController(text: "0.00");
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTransactionCubit, NewTransactionState>(
      buildWhen: (previous, current) => previous.isInit != current.isInit,
      builder: (context, state) => !state.isInit
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  BalanceFormField(
                    controller: _balanceController,
                    title: AppLocalizations.of(context)!.howMuch,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32))),
                    child: Column(
                      children: [
                        CategoryFormField(
                          onChanged: _handleSelectCategory,
                          selectedCategory: _selectedCategory,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DescriptionFormField(
                            controller: _descriptionController),
                        const SizedBox(
                          height: 16,
                        ),
                        AccountFormField(
                          selectedAccountId: _selectedAccountId,
                          onChanged: _handleSelectAccount,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: TextButton.icon(
                            onPressed: () {
                              _showChooseAttachmentModal(context);
                            },
                            icon: Transform.rotate(
                              angle: 180,
                              child: const Icon(Icons.attach_file),
                            ),
                            label: Text(
                                AppLocalizations.of(context)!.addAttachment),
                          ),
                        ),

                        //  RepeatSwitchButton(),
                        const SizedBox(
                          height: 24,
                        ),
                        SubmitButton(onPressed: _handleSubmittion),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
      listener: (context, state) {
        state.submissionState.whenOrNull(
          submitting: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const LoadingDialog(),
          ),
          success: () => context.replaceRoute(const MainRoute()),
          failed: _handleFailure,
        );
      },
    );
  }

  void _handleFailure(TransactionException failure) {
    late String massege = failure.when(
        serverError: () => AppLocalizations.of(context)!.serverError,
        notEnoughBalance: (availbleBalance) =>
            "${AppLocalizations.of(context)!.accountBalanceNotEnough} ${availbleBalance.translate(context)}");
    _showErrorDialog(context, massege);
  }

  void _showChooseAttachmentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) => const AttachmentBottomSheet(),
    );
  }

  void _handleSelectCategory(Category? category) {
    if (category == null) {
      return;
    }
    setState(() {
      _selectedCategory = category;
    });
  }

  void _handleSelectAccount(String? accountId) {
    if (accountId == null) {
      return;
    }
    setState(() {
      _selectedAccountId = accountId;
    });
  }

  void _handleSubmittion() {
    if (_formKey.currentState!.validate() &&
        _selectedAccountId != null &&
        _selectedCategory != null) {
      final transactionInput = _createTransaction();

      BlocProvider.of<NewTransactionCubit>(context)
          .addTransaction(transactionInput);
    }
  }

  TransactionInput _createTransaction() {
    final transactionType = context.read<TransactionType>();

    return TransactionInput(
        accountId: _selectedAccountId!,
        attachment: "",
        amount: double.parse(_balanceController.text),
        category: _selectedCategory!,
        description: _descriptionController.text,
        type: transactionType);
  }

  void _showErrorDialog(BuildContext context, String failure) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        title: AppLocalizations.of(context)!.error,
        body: failure,
      ),
    );
  }
}
