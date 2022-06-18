import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
            fontSize: 18, color: AppColors.dark, fontWeight: FontWeight.w600),
      ),
    );
  }
}
