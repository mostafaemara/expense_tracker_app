import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class OptionListTile extends StatelessWidget {
  const OptionListTile(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title),
      trailing: isSelected
          ? Image.asset(
              "assets/images/success.png",
              color: AppColors.violet,
              width: 32,
              height: 32,
            )
          : null,
    );
  }
}
