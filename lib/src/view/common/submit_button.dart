import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);
  final VoidCallback onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()),
              )
            : Text(AppLocalizations.of(context)!.continueButtonTitle),
      ),
    );
  }
}
