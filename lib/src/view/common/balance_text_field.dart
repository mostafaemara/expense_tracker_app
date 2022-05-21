import 'package:flutter/material.dart';

class BalanceFormField extends StatelessWidget {
  const BalanceFormField({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            style: theme.textTheme.headline2!
                .copyWith(color: theme.colorScheme.onPrimary),
            decoration: InputDecoration(
              hintStyle: theme.textTheme.headline2!
                  .copyWith(color: theme.colorScheme.onPrimary),
              prefixText: "\$",
              prefixStyle: theme.textTheme.headline2!
                  .copyWith(color: theme.colorScheme.onPrimary),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
