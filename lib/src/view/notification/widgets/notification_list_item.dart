import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/src/data/models/notification.dart' as not;
import 'package:intl/intl.dart';

class NotificationListItem extends StatelessWidget {
  final not.Notification notification;
  const NotificationListItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('H:m').format(DateTime.now());
    return Container(
      color: notification.markedAsRead ? null : AppColors.light60,
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      notification.body,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: AppColors.light20),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
