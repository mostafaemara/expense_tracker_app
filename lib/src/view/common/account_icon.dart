import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AccountIcon extends StatelessWidget {
  const AccountIcon({
    Key? key,
    required this.iconPath,
  }) : super(key: key);

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Image.asset(
        iconPath,
        color: AppColors.violet,
        height: 32,
        width: 32,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.light40),
      width: 48,
      height: 48,
    );
  }
}
