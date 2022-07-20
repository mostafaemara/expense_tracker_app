import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';

import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/account_form_field.dart';
import '../../common/add_attachment_button.dart';
import '../../common/balance_text_field.dart';
import '../../common/description_form_field.dart';
import '../../common/submit_button.dart';
import '../../common/title_form_field.dart';
import 'category_form_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({
    Key? key,
    required this.transactionType,
  }) : super(key: key);
  final TransactionType transactionType;
  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  static final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _titleController = TextEditingController();
  String? _selectedAccountId;
  String? _selectedCategoryId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTransactionCubit, NewTransactionState>(
        builder: (context, state) => Form(
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TitleFormField(controller: _titleController),
                        const SizedBox(
                          height: 16,
                        ),
                        CategoryFormField(
                            categories: state.categories,
                            value: _selectedCategoryId,
                            onChanged: _onCategoryChange),
                        const SizedBox(
                          height: 16,
                        ),
                        DescriptionFormField(
                            controller: _descriptionController),
                        const SizedBox(
                          height: 16,
                        ),
                        AccountFormField(
                            accounts: state.accounts,
                            onChanged: _onAccountChange,
                            selectedAccount: _selectedAccountId),
                        const SizedBox(
                          height: 16,
                        ),
                        AddAttachmentButton(
                            onPressed: () => _showChooseAttachmentModal(
                                  context,
                                )),

                        //  RepeatSwitchButton(),
                        const SizedBox(
                          height: 24,
                        ),
                        SubmitButton(
                            isLoading: state.status == Status.loading,
                            onPressed: _handleSubmittion),
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
          if (state.status == Status.success) {
            context.replaceRoute(const MainRoute());
          }
          if (state.status == Status.error) {
            context.showSnackBar(state.error, backgroundColor: AppColors.red);
          }
        });
  }

  void _showChooseAttachmentModal(
    BuildContext context,
  ) {
    // showModalBottomSheet(
    //   context: context,
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(24),
    //       topRight: Radius.circular(24),
    //     ),
    //   ),
    //   builder: (context) =>
    //       AttachmentBottomSheet(selectAttachment: selectAttachment),
    // );
  }

  void _handleSubmittion() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<NewTransactionCubit>(context)
          .addTransaction(TransactionInput(
        accountId: _selectedAccountId!,
        amount: double.parse(_balanceController.text),
        categoryId: _selectedCategoryId!,
        description: _descriptionController.text,
        title: _titleController.text,
        type: widget.transactionType,
      ));
    }
  }

  void _onAccountChange(String? id) {
    setState(() {
      _selectedAccountId = id;
    });
  }

  void _onCategoryChange(String? id) {
    setState(() {
      _selectedCategoryId = id;
    });
  }
}
