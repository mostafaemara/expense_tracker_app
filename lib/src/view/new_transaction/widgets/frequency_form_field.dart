import 'package:expense_tracker_app/src/data/models/frequency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountFormField extends StatelessWidget {
  const AccountFormField({
    Key? key,
    this.onChanged,
    this.selectedFrequency,
    required this.frequencies,
    this.targetAccountId,
  }) : super(key: key);
  final Function(Frequency?)? onChanged;
  final Frequency? selectedFrequency;
  final List<Frequency> frequencies;
  final String? targetAccountId;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Frequency>(
      validator: (v) =>
          v == null ? AppLocalizations.of(context)?.accountRequired : null,
      onChanged: onChanged,
      hint: Text(AppLocalizations.of(context)!.accountName),
      value: selectedFrequency,
      items: List.generate(
          frequencies.length,
          (index) => DropdownMenuItem(
                child: Text(frequencies[index].toString()),
                value: frequencies[index],
              )),
    );
  }
}
