import 'package:expense_tracker_app/src/presentation/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationListItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;
  NotificationListItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('H:m').format(date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(color: AppColors.light20),
                ),
              ],
            ),
            Text(
              formattedDate,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: AppColors.light20),
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}
