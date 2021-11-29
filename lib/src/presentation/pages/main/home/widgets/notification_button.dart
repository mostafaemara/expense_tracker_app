import 'package:flutter/material.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Image.asset(
          "assets/images/notifiaction.png",
          color: Theme.of(context).colorScheme.primary,
        ));
  }
}
