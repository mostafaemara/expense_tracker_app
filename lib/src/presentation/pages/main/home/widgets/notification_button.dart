import 'package:expense_tracker_app/src/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

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
        icon: Image.asset(
          "assets/images/notifiaction.png",
          color: Theme.of(context).colorScheme.primary,
        ));
  }
}
