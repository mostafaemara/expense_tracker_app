import 'package:expense_tracker_app/src/data/models/frequency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FrequencyFormField extends StatelessWidget {
  const FrequencyFormField({
    Key? key,
    this.onChanged,
    this.selectedFrequency,
  }) : super(key: key);
  final Function(Frequency?)? onChanged;
  final Frequency? selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Frequency>(
      validator: (v) =>
          v == null ? AppLocalizations.of(context)?.accountRequired : null,
      onChanged: onChanged,
      hint: Text(AppLocalizations.of(context)!.frequency),
      value: selectedFrequency,
      items: List.generate(
          Frequency.values.length,
          (index) => DropdownMenuItem(
                child: Text(Frequency.values[index].toString()),
                value: Frequency.values[index],
              )),
    );
  }
}
