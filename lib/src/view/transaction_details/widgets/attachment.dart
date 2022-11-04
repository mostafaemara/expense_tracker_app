import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class Attachment extends StatelessWidget {
  const Attachment({
    Key? key,
    required this.attachment,
  }) : super(key: key);

  final String attachment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: attachment.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                attachment,
                fit: BoxFit.cover,
              ),
            )
          : const Icon(
              Icons.attachment,
              size: 100,
              color: AppColors.light20,
            ),
    );
  }
}
