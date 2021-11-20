import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BalanceFormField extends StatelessWidget {
  const BalanceFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.balance,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          initialValue: "0.00",
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
    );
  }
}
