import 'dart:developer';
import 'dart:io';

import 'package:expense_tracker_app/src/repositories/categories/attachment_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

import 'attachment_source_button.dart';

class AttachmentBottomSheet extends StatelessWidget {
  const AttachmentBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      width: double.infinity,
      height: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AttachmentSourceButton(
            title: AppLocalizations.of(context)!.camera,
            imagePath: "assets/images/camera.png",
            onPressed: () async {
              final repo = AttachmentReposiotryImpl();
              final file =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              await repo.writeAttachment("uid", "id", File(file!.path));
            },
          ),
          AttachmentSourceButton(
            title: AppLocalizations.of(context)!.image,
            imagePath: "assets/images/gallery.png",
            onPressed: () async {
              final file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              print(file!.path.toString());
            },
          ),
          AttachmentSourceButton(
            title: AppLocalizations.of(context)!.document,
            imagePath: "assets/images/file.png",
            onPressed: () async {
              final repo = AttachmentReposiotryImpl();

              final file = await repo.readAttachment(
                "uid",
                "id",
              );
              log("read file path :" + file.path);
            },
          ),
        ],
      ),
    );
  }
}
