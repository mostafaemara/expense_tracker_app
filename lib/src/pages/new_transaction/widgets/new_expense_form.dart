import 'package:expense_tracker_app/src/bloc/categories/categories_cubit.dart';
import 'package:expense_tracker_app/src/models/account.dart';
import 'package:expense_tracker_app/src/models/category.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/pages/new_transaction/widgets/description_form_field.dart';
import 'package:expense_tracker_app/src/widgets/select_account_type_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/balance_text_field.dart';
import 'account_form_field.dart';
import 'attachment_bottom_sheet.dart';
import 'category_form_field.dart';

class NewExpenseForm extends StatefulWidget {
  const NewExpenseForm({
    Key? key,
  }) : super(key: key);

  @override
  State<NewExpenseForm> createState() => _NewExpenseFormState();
}

class _NewExpenseFormState extends State<NewExpenseForm> {
  AccountType? _selectedAccountType;
  String? _selectedCategoryId;
  String? _selectedAccountId;
  final _formKey = GlobalKey<FormState>();
  final _balanceController = TextEditingController(text: "0.00");
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
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
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              children: [
                CategoryFormField(
                  onChanged: _handleSelectCategory,
                  selectedCategoryId: _selectedCategoryId,
                ),
                const SizedBox(
                  height: 16,
                ),
                DescriptionFormField(controller: _descriptionController),
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
                    label: Text(AppLocalizations.of(context)!.addAttachment),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SwitchListTile(
                  inactiveTrackColor: Theme.of(context).colorScheme.secondary,
                  activeColor: Theme.of(context).colorScheme.onPrimary,
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                  value: false,
                  onChanged: (_) {},
                  title: Text(AppLocalizations.of(context)!.repeat),
                  subtitle:
                      Text(AppLocalizations.of(context)!.repeatTransaction),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child:
                        Text(AppLocalizations.of(context)!.continueButtonTitle),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
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

  void _handleSelectCategory(String? categoryId) {
    if (categoryId == null) {
      return;
    }
    setState(() {
      _selectedCategoryId = categoryId;
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
}
