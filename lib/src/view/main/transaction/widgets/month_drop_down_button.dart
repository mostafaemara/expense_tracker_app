import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class MonthDropDownButton extends StatefulWidget {
  const MonthDropDownButton({Key? key}) : super(key: key);

  @override
  State<MonthDropDownButton> createState() => _MonthDropDownButtonState();
}

class _MonthDropDownButtonState extends State<MonthDropDownButton> {
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.light60),
          borderRadius: BorderRadius.circular(40)),
      child: DropdownButton<String>(
        value: dropdownValue,
        isExpanded: true,
        underline: Container(),
        borderRadius: BorderRadius.circular(12),
        icon: const Icon(Icons.arrow_drop_down_sharp),
        style: const TextStyle(color: Colors.deepPurple),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
