import 'package:expense_tracker_app/src/bloc/config/config_cubit.dart';
import 'package:expense_tracker_app/src/data/models/currency.dart';

import 'package:expense_tracker_app/src/view/settings/option_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency"),
      ),
      body: Column(
          children: List.generate(
              Currency.values.length,
              (index) => OptionListTile(
                  title:
                      "${Currency.values[index].code}(${Currency.values[index].symbol})",
                  isSelected: config.state.currency == Currency.values[index],
                  onPressed: () {
                    config.selectCurrency(Currency.values[index]);
                  }))),
    );
  }
}
