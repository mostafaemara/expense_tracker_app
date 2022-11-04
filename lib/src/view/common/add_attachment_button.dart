import 'dart:io';

import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAttachmentButton extends StatelessWidget {
  const AddAttachmentButton(
      {Key? key,
      required this.onPressed,
      this.selectedAttachment,
      required this.onDelete})
      : super(key: key);
  final VoidCallback onPressed;
  final VoidCallback onDelete;
  final File? selectedAttachment;
  @override
  Widget build(BuildContext context) {
    return selectedAttachment == null
        ? SizedBox(
            height: 56,
            width: double.infinity,
            child: TextButton.icon(
              onPressed: onPressed,
              icon: Transform.rotate(
                angle: 180,
                child: const Icon(Icons.attach_file),
              ),
              label: Text(AppLocalizations.of(context)!.addAttachment),
            ),
          )
        : Container(
            height: 150,
            alignment: AlignmentDirectional.centerStart,
            width: double.infinity,
            child: SizedBox(
              height: 150,
              width: 100,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: Image.file(
                      selectedAttachment!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 120,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8))),
                          backgroundColor: AppColors.red),
                      child: const Icon(
                        Icons.delete,
                      ),
                      onPressed: onDelete,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
