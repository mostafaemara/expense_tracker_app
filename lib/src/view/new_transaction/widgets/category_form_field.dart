import 'package:expense_tracker_app/src/data/models/category.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryFormField extends StatelessWidget {
  const CategoryFormField(
      {Key? key, required this.categories, required this.onChanged, this.value})
      : super(key: key);

  final List<Category> categories;
  final void Function(String?) onChanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        validator: (value) => value == null
            ? AppLocalizations.of(context)!.categoryRequired
            : null,
        onChanged: onChanged,
        hint: Text(AppLocalizations.of(context)!.category),
        value: value,
        items: List.generate(
            categories.length,
            (index) => DropdownMenuItem(
                  child: Text(categories[index].title),
                  value: categories[index].id,
                )));
  }
}
