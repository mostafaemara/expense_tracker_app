import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_account/new_account_cubit.dart';
import 'package:expense_tracker_app/src/bloc/old_sub_state/submission_state.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';

import 'package:expense_tracker_app/src/data/models/inputs/account_input.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/view/common/balance_text_field.dart';
import 'package:expense_tracker_app/src/view/common/error_dialog.dart';
import 'package:expense_tracker_app/src/view/common/loading_dialog.dart';
import 'package:expense_tracker_app/src/view/common/select_account_type_form_field.dart';
import 'package:expense_tracker_app/src/view/common/submit_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'account_name_form_field.dart';

class AddNewAccountForm extends StatefulWidget {
  const AddNewAccountForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewAccountForm> createState() => _AddNewAccountFormState();
}

class _AddNewAccountFormState extends State<AddNewAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController(text: "0.00");
  final _accountNameController = TextEditingController();

  AccountType? _selectedAccountType;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAccountCubit, SubmissionState>(
      builder: (context, state) => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            BalanceFormField(
              controller: _balanceController,
              title: AppLocalizations.of(context)!.balance,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  AccountNameFormField(
                    controller: _accountNameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SelectAccountTypeFormField(
                    selectedType: _selectedAccountType,
                    onChanged: _handleSelectAccount,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SubmitButton(
                    isLoading: state.maybeWhen(
                        submitting: () => true, orElse: () => false),
                    onPressed: _handleSubmittion,
                  ),
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
        state.whenOrNull(
          submitting: () => showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const LoadingDialog(),
          ),
          success: () => context.replaceRoute(const AccountAllSetRoute()),
          failed: (failure) => _showErrorDialog(
              context, AppLocalizations.of(context)!.serverError),
        );
      },
    );
  }

  void _handleSelectAccount(AccountType? type) {
    if (type == null) {
      return;
    }
    setState(() {
      _selectedAccountType = type;
    });
  }

  void _handleSubmittion() {
    if (_formKey.currentState!.validate() && _selectedAccountType != null) {
      final newAccount = AccountInput(
          balance: double.parse(_balanceController.text),
          title: _accountNameController.text,
          accountType: _selectedAccountType!);
      BlocProvider.of<NewAccountCubit>(context).addNewAccount(newAccount);
    }
  }

  void _showErrorDialog(BuildContext context, String failure) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        title: AppLocalizations.of(context)!.serverError,
        body: failure,
      ),
    );
  }
}
