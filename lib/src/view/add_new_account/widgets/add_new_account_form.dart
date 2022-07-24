import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_account/new_account_cubit.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';

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
  final bool isSetupAccount;
  final Account? account;
  const AddNewAccountForm({
    Key? key,
    this.account,
    required this.isSetupAccount,
  }) : super(key: key);

  @override
  State<AddNewAccountForm> createState() => _AddNewAccountFormState();
}

class _AddNewAccountFormState extends State<AddNewAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController();
  final _accountNameController = TextEditingController();

  AccountType? _selectedAccountType;
  @override
  void initState() {
    if (widget.account != null) {
      _accountNameController.text = widget.account!.title;
      _selectedAccountType = widget.account!.type;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewAccountCubit, SubmissionState>(
      builder: (context, state) => Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            if (widget.account == null)
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
                    isLoading: state.submissionStatus == Status.loading,
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
        switch (state.submissionStatus) {
          case Status.success:
            if (widget.isSetupAccount) {
              context.replaceRoute(const AccountAllSetRoute());
            } else {
              Navigator.of(context).pop();
              AutoRouter.of(context).pop(true);
            }

            break;
          case Status.error:
            _showErrorDialog(context, state.error);
            break;
          case Status.loading:
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const LoadingDialog(),
            );
            break;
          default:
            break;
        }
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
      if (widget.account != null) {
        BlocProvider.of<NewAccountCubit>(context).updateAccount(
            id: widget.account!.id,
            title: _accountNameController.text,
            type: _selectedAccountType!);
      }
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
        title: AppLocalizations.of(context)!.unownError,
        body: failure,
      ),
    );
  }
}
