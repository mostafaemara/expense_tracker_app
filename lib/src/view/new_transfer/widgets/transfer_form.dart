import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_transfer/new_tranfer_state.dart';
import 'package:expense_tracker_app/src/bloc/new_transfer/new_transfer_cubit.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transfer_input.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../routes/app_router.dart';
import '../../common/account_form_field.dart';
import '../../common/add_attachment_button.dart';
import '../../common/balance_text_field.dart';

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
  String? _fromAcountId;
  String? _toAcountId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTransferCubit, NewTransferState>(
      builder: (context, state) => state.status == Status.loading
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
                                targetAccountId: _toAcountId,
                                onChanged: _onFromAccountIdChange,
                                accounts: state.accounts,
                                selectedAccount: _fromAcountId,
                              ),
                            ),
                            Image.asset(
                                "assets/images/colored_transaction.png"),
                            Expanded(
                              child: AccountFormField(
                                onChanged: _onToAccountIdChange,
                                accounts: state.accounts,
                                selectedAccount: _toAcountId,
                                targetAccountId: _fromAcountId,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        AddAttachmentButton(
                            onPressed: () => _showChooseAttachmentModal(
                                  context,
                                )),

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
        if (state.status == Status.success) {
          context.replaceRoute(const MainRoute());
        }
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
    );
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
      if (_fromAcountId != null && _toAcountId != null) {
        BlocProvider.of<NewTransferCubit>(context).addTransfer(TransferInput(
            fromAccountId: _fromAcountId!,
            toAccountId: _toAcountId!,
            amount: double.parse(_balanceController.text)));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Select Accounts")));
      }
    }
  }

  void _onToAccountIdChange(String? id) {
    setState(() {
      _toAcountId = id;
    });
  }

  void _onFromAccountIdChange(String? id) {
    setState(() {
      _fromAcountId = id;
    });
  }
}
