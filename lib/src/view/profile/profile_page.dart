import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/profile/widgets/account_list_view.dart';
import 'package:expense_tracker_app/src/view/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light60,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: const [
            SizedBox(height: 74),
            ProfileHeader(),
            SizedBox(
              height: 40,
            ),
            AccountListView()
          ]),
        ),
      ),
    );
  }
}
