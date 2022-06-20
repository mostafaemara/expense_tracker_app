import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AmountWithCurrency extends StatelessWidget {
  final double amount;
  const AmountWithCurrency({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${AppLocalizations.of(context)!.currencySymbol}$amount",
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }
}
