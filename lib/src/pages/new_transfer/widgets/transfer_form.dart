import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/application/new_transaction/newtransaction_cubit.dart';

import 'package:expense_tracker_app/src/application/new_transfer/new_tranfer_state.dart';
import 'package:expense_tracker_app/src/application/new_transfer/new_transfer_cubit.dart';
import 'package:expense_tracker_app/src/data/exceptions/transaction_exception.dart';
import 'package:expense_tracker_app/src/extenstions/number_helper.dart';
import 'package:expense_tracker_app/src/widgets/account_form_field.dart';
import 'package:expense_tracker_app/src/widgets/add_attachment_button.dart';
import 'package:expense_tracker_app/src/widgets/attachment_bottom_sheet.dart';
import 'package:expense_tracker_app/src/widgets/description_form_field.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/widgets/error_dialog.dart';
import 'package:expense_tracker_app/src/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widgets/balance_text_field.dart';

class TransferForm extends StatefulWidget {
  const TransferForm({
    Key? key,
  }) : super(key: key);

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  static final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController(text: "0.00");
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NewTransferCubit>();
    return BlocConsumer<NewTransferCubit, NewTransferState>(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: BalanceFormField(
                      controller: _balanceController,
                      title: AppLocalizations.of(context)!.balance,
                    ),
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
                        Row(
                          children: [
                            Expanded(
                              child: AccountFormField(
                                onChanged: bloc.selectAccount,
                                accounts: state.accounts,
                                selectedAccount: state.selectedAccount,
                              ),
                            ),
                            Image.asset(
                                "assets/images/colored_transaction.png"),
                            Expanded(
                              child: AccountFormField(
                                onChanged: bloc.selectTargetAccount,
                                accounts: state.targetAccounts,
                                selectedAccount: state.selectedTargetAccount,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        DescriptionFormField(
                            controller: _descriptionController),

                        const SizedBox(
                          height: 16,
                        ),
                        AddAttachmentButton(
                            onPressed: () => _showChooseAttachmentModal(
                                context, bloc.selectAttachment)),

                        //  RepeatSwitchButton(),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleSubmittion,
                            child: Text(AppLocalizations.of(context)!
                                .continueButtonTitle),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )
                ],
              )),
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
      BlocProvider.of<NewTransferCubit>(context)
          .addTransaction(_balanceController.text, _descriptionController.text);
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
