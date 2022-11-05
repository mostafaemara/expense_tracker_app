import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/budgets/budgets_cubit.dart';
import 'package:expense_tracker_app/src/bloc/budgets/budgets_state.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/budget/widgets/budget_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/month_slider.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  void didChangeDependencies() {
    context.read<BudgetsCubit>().init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: BlocBuilder<BudgetsCubit, BudgetState>(
          builder: (context, state) => state.isLoading
              ? Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.surface,
                  child: const Center(child: CircularProgressIndicator()))
              : Column(
                  children: [
                    const SizedBox(
                      height: 83,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: MonthSlider(
                          initMonth: state.selectedMonth,
                          onChanged: context.read<BudgetsCubit>().selectMonth),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.light,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: Center(
                            child: state.budgets.isEmpty
                                ? const Text(
                                    "You don’t have a budget.Let’s make one so you in control.")
                                : ListView.builder(
                                    padding: const EdgeInsets.all(16),
                                    itemCount: state.budgets.length,
                                    itemBuilder: (context, index) =>
                                        BudgetListItem(
                                      onPressed: () async {
                                        final result =
                                            await AutoRouter.of(context).push(
                                                BudgetDetailsRoute(
                                                    budget:
                                                        state.budgets[index]));
                                        if (result != null) {
                                          context.read<BudgetsCubit>().init();
                                        }
                                      },
                                      budget: state.budgets[index],
                                    ),
                                  ),
                          )),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: 56,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final result = await AutoRouter.of(context)
                                        .push(NewBudgetRoute());
                                    if (result != null) {
                                      context.read<BudgetsCubit>().init();
                                    }
                                  },
                                  child: const Text("Create a Budget"))),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ))
                  ],
                ),
        ));
  }
}
