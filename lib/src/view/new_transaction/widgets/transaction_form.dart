import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';

import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';

import 'package:expense_tracker_app/src/routes/app_router.dart';

import 'package:image_picker/image_picker.dart';
import '../../../helpers/number_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/account_form_field.dart';
import '../../common/add_attachment_button.dart';
import '../../common/attachment_bottom_sheet.dart';
import '../../common/balance_text_field.dart';
import '../../common/description_form_field.dart';
import '../../common/error_dialog.dart';
import '../../common/loading_dialog.dart';
import '../../common/submit_button.dart';
import '../../common/title_form_field.dart';
import 'category_form_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  static final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController(text: "0.00");
  final _descriptionController = TextEditingController();
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewTransactionCubit>();
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TitleFormField(controller: _titleController),
                        const SizedBox(
                          height: 16,
                        ),
                        const CategoryFormField(),
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
                            onChanged: bloc.selectAccount,
                            selectedAccount: state.selectedAccount),
                        const SizedBox(
                          height: 16,
                        ),
                        AddAttachmentButton(
                            onPressed: () => _showChooseAttachmentModal(
                                context, bloc.selectAttachment)),

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

  void _showChooseAttachmentModal(
      BuildContext context, Function(ImageSource) selectAttachment) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) =>
          AttachmentBottomSheet(selectAttachment: selectAttachment),
    );
  }

  void _handleSubmittion() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<NewTransactionCubit>(context).addTransaction(
          _balanceController.text,
          _descriptionController.text,
          _titleController.text);
    }
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
