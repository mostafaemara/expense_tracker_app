import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AccountListView extends StatelessWidget {
  const AccountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.light, borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            ProfileListTile(
              image: "assets/images/wallet.png",
              color: AppColors.violet,
              onPressed: () {
                AutoRouter.of(context).navigate(const AccountsRoute());
              },
              title: "Account",
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            ProfileListTile(
              image: "assets/images/settings.png",
              color: AppColors.violet,
              onPressed: () {},
              title: "Settings",
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            ProfileListTile(
              image: "assets/images/download.png",
              color: AppColors.violet,
              onPressed: () {},
              title: "Export Data",
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            ProfileListTile(
              image: "assets/images/logout.png",
              color: AppColors.red,
              onPressed: () {},
              title: "Logout",
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.color,
      required this.image})
      : super(key: key);
  final VoidCallback onPressed;
  final String title;
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        height: 60,
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                image,
                width: 32,
                height: 32,
                color: color,
              ),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16)),
              width: 52,
              height: 52,
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
