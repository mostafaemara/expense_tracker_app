import 'package:flutter/material.dart';

class MonthSelectionButton extends StatelessWidget {
  const MonthSelectionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(),
        onPressed: () {},
        icon: const Icon(Icons.arrow_drop_down),
        label: const Text("Selected Month"));
  }
}
