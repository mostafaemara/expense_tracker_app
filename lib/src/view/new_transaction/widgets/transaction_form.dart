import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_transaction/newtransaction_state.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/data/models/frequency.dart';

import 'package:expense_tracker_app/src/data/models/inputs/transaction_input.dart';
import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';

import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/account_form_field.dart';
import '../../common/add_attachment_button.dart';
import '../../common/attachment_bottom_sheet.dart';
import '../../common/balance_text_field.dart';
import '../../common/description_form_field.dart';
import '../../common/submit_button.dart';
import '../../common/title_form_field.dart';

import 'category_form_field.dart';
import 'frequency_form_field.dart';
import 'repeat_switch_button.dart';

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
  File? _selectedAttachment;
  bool _repeat = false;

  Frequency? _frequency;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewTransactionCubit, NewTransactionState>(
        builder: (context, state) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                            onDelete: () {
                              setState(() {
                                _selectedAttachment = null;
                              });
                            },
                            selectedAttachment: _selectedAttachment,
                            onPressed: () => _showChooseAttachmentModal(
                                  context,
                                )),
                        RepeatSwitchButton(
                            onChanged: (value) {
                              setState(() {
                                _repeat = value;
                              });
                            },
                            value: _repeat),
                        if (_repeat)
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: FrequencyFormField(
                                onChanged: (value) {
                                  setState(() {
                                    _frequency = value;
                                  });
                                },
                                selectedFrequency: _frequency),
                          ),
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
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) =>
          AttachmentBottomSheet(selectAttachment: _selectAttachment),
    );
  }

  void _selectAttachment(ImageSource source) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      setState(() {
        _selectedAttachment = File(file.path);
      });
    }
  }

  void _handleSubmittion() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<NewTransactionCubit>(context)
          .addTransaction(TransactionInput(
        attachment: _selectedAttachment,
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
