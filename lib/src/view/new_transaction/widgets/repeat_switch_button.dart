import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RepeatSwitchButton extends StatelessWidget {
  const RepeatSwitchButton({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);
  final Function(bool value) onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      inactiveTrackColor: Theme.of(context).colorScheme.secondary,
      activeColor: Theme.of(context).colorScheme.onPrimary,
      activeTrackColor: Theme.of(context).colorScheme.primary,
      value: value,
      onChanged: onChanged,
      title: Text(AppLocalizations.of(context)!.repeat),
      subtitle: Text(AppLocalizations.of(context)!.repeatTransaction),
    );
  }
}
