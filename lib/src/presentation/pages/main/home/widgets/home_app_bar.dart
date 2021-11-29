import 'package:flutter/material.dart';

import 'month_selection_button.dart';
import 'notification_button.dart';
import 'profile_image.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Row(
        children: const [
          ProfileImage(),
          Spacer(),
          MonthSelectionButton(),
          Spacer(),
          NotificationButton()
        ],
      ),
    );
  }
}
