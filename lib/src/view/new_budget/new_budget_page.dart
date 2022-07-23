import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/new_budget/new_budget_cubit.dart';
import 'package:expense_tracker_app/src/bloc/new_budget/new_budget_state.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/data/models/budget.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/balance_text_field.dart';
import 'package:expense_tracker_app/src/view/common/submit_button.dart';
import 'package:expense_tracker_app/src/view/new_transaction/widgets/category_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewBudgetPage extends StatefulWidget {
  final Budget? budget;
  const NewBudgetPage({Key? key, this.budget}) : super(key: key);

  @override
  State<NewBudgetPage> createState() => _NewBudgetPageState();
}

class _NewBudgetPageState extends State<NewBudgetPage> {
  final _balanceController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  double percent = 50;
  String? _selectedCategory;
  bool reciveAlertSelected = true;
  @override
  void initState() {
    context.read<NewBudgetCubit>().init();
    if (widget.budget != null) {
      _balanceController.text = widget.budget!.amount.toString();
      _selectedCategory = widget.budget!.category.id;
      percent = widget.budget!.alertPercentage.toDouble();
      reciveAlertSelected = widget.budget!.alert;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: BlocConsumer<NewBudgetCubit, NewBudgetState>(
            builder: (context, state) => Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      BalanceFormField(
                        controller: _balanceController,
                        title: "How much do yo want to spend?",
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32))),
                        child: Column(children: [
                          if (widget.budget == null)
                            CategoryFormField(
                                value: _selectedCategory,
                                categories: state.categories,
                                onChanged: (s) {
                                  setState(() {
                                    _selectedCategory = s;
                                  });
                                }),
                          const SizedBox(
                            height: 16,
                          ),
                          SwitchListTile(
                            activeColor: Theme.of(context).colorScheme.primary,
                            value: reciveAlertSelected,
                            onChanged: (s) {
                              setState(() {
                                reciveAlertSelected = s;
                              });
                            },
                            subtitle: const Text(
                              "Receive alert when it reaches some point.",
                              style: TextStyle(
                                  fontSize: 13, color: AppColors.light20),
                            ),
                            title: const Text(
                              "Receive Alert",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SliderTheme(
                            data: const SliderThemeData(
                              valueIndicatorColor: AppColors.violet,
                              valueIndicatorShape:
                                  PaddleSliderValueIndicatorShape(),
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: Slider(
                              label: "$percent.%",
                              value: percent,
                              onChanged: (s) {
                                setState(() {
                                  percent = s.roundToDouble();
                                });
                              },
                              max: 100,
                              min: 10,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          SubmitButton(
                              onPressed: _handleSubmit,
                              isLoading: state.status == Status.loading),
                          const SizedBox(
                            height: 24,
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
            listener: (context, state) {
              if (state.status == Status.success) {
                AutoRouter.of(context).pop([true]);
              }
              if (state.status == Status.error) {
                context.showSnackBar(state.error,
                    backgroundColor: AppColors.red);
              }
            }));
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final cubit = context.read<NewBudgetCubit>();
      final input = BudgetInput(
          amount: double.parse(_balanceController.text),
          alertPercentage: percent.round(),
          categoryId: _selectedCategory!,
          alert: reciveAlertSelected);
      if (widget.budget != null) {
        cubit.updateBudget(input, widget.budget!.id);
      } else {
        cubit.addBudget(input);
      }
    }
  }
}
