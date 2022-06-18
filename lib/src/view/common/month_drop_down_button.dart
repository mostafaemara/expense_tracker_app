import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthDropDownButton extends StatelessWidget {
  const MonthDropDownButton({Key? key, required this.value, this.onChanged})
      : super(key: key);
  final DateTime value;
  final void Function(DateTime?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.light60),
          borderRadius: BorderRadius.circular(40)),
      child: DropdownButton<DateTime>(
          value: value,
          isExpanded: true,
          underline: Container(),
          borderRadius: BorderRadius.circular(12),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: onChanged,
          items: List.generate(
              DateTime.monthsPerYear,
              (index) => DropdownMenuItem<DateTime>(
                    value: DateTime(DateTime.now().year, index, 1),
                    child: Text(DateFormat.MMM()
                        .format(DateTime(DateTime.now().year, index, 1))),
                  )).toList()),
    );
  }
}
