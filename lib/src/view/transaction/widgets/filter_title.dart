import 'package:flutter/material.dart';

class FilterTitle extends StatelessWidget {
  final String title;
  const FilterTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
