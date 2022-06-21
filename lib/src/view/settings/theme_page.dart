import 'package:expense_tracker_app/src/bloc/config/config_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'option_list_tile.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Languge"),
      ),
      body: Column(
          children: List.generate(
              ThemeMode.values.length,
              (index) => OptionListTile(
                  title:
                      "${ThemeMode.values[index]}(${ThemeMode.values[index]})",
                  isSelected: config.state.themeMode == ThemeMode.values[index],
                  onPressed: () {
                    config.selectTheme(ThemeMode.values[index]);
                  }))),
    );
  }
}
