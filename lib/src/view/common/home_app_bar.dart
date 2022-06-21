import 'dart:developer';

import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notification_button.dart';
import 'profile_image.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profilPic = context.watch<ProfileCubit>().state.user.image;
    log(profilPic);
    return SizedBox(
      height: 64,
      child: Row(
        children: [
          ProfileImage(imageUrl: profilPic),
          const Spacer(),
          const NotificationButton()
        ],
      ),
    );
  }
}
