import 'package:expense_tracker_app/src/bloc/config/config_cubit.dart';

import 'package:expense_tracker_app/src/data/models/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'option_list_tile.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = context.watch<ConfigCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Languge"),
      ),
      body: Column(
          children: List.generate(
              Language.values.length,
              (index) => OptionListTile(
                  title: Language.values[index].title,
                  isSelected: config.state.language == Language.values[index],
                  onPressed: () {
                    config.selectlanguage(Language.values[index]);
                  }))),
    );
  }
}
