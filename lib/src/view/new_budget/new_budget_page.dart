import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/balance_text_field.dart';
import 'package:expense_tracker_app/src/view/common/submit_button.dart';
import 'package:expense_tracker_app/src/view/new_transaction/widgets/category_form_field.dart';
import 'package:flutter/material.dart';

class NewBudgetPage extends StatefulWidget {
  const NewBudgetPage({Key? key}) : super(key: key);

  @override
  State<NewBudgetPage> createState() => _NewBudgetPageState();
}

class _NewBudgetPageState extends State<NewBudgetPage> {
  final _balanceController = TextEditingController(text: "0.00");
  double percent = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        children: [
          const Spacer(),
          BalanceFormField(
            controller: _balanceController,
            title: "How much do yo want to spend?",
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(children: [
              CategoryFormField(categories: const [], onChanged: (s) {}),
              const SizedBox(
                height: 16,
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.primary,
                value: true,
                onChanged: (s) {},
                subtitle: const Text(
                  "Receive alert when it reaches some point.",
                  style: TextStyle(fontSize: 13, color: AppColors.light20),
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
                  valueIndicatorColor: Colors.red,
                  valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                  valueIndicatorTextStyle: TextStyle(color: Colors.red),
                  showValueIndicator: ShowValueIndicator.always,
                ),
                child: Slider(
                  value: percent,
                  onChanged: (s) {
                    setState(() {
                      percent = s;
                    });
                  },
                  max: 100,
                  min: 10,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SubmitButton(onPressed: () {}, isLoading: false),
              const SizedBox(
                height: 24,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
