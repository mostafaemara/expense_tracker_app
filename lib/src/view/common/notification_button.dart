import 'package:expense_tracker_app/src/bloc/notification/notification_cubit.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../styles/app_colors.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.navigateTo(const NotificationRoute());
        },
        icon: Stack(
          children: [
            if (context
                    .watch<NotificationCubit>()
                    .state
                    .lengthOfNotification() !=
                0)
              Container(
                width: 10,
                height: 10,
                child: FittedBox(
                  child: Text(
                    context
                        .watch<NotificationCubit>()
                        .state
                        .lengthOfNotification()
                        .toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(10)),
              ),
            Image.asset(
              "assets/images/notifiaction.png",
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ));
  }
}
