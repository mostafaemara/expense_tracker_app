import 'package:expense_tracker_app/src/bloc/config/config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountWithCurrency extends StatelessWidget {
  final double amount;
  const AmountWithCurrency({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currency = context.watch<ConfigCubit>().state.currency;

    return Text(
      "${currency.symbol}$amount",
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontWeight: FontWeight.w600),
    );
  }
}
