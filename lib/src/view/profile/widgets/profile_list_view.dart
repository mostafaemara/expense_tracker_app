import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/profile/profile_cubit.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({Key? key}) : super(key: key);

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
              onPressed: () {
                AutoRouter.of(context).navigate(const SettingsRoute());
              },
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
              image: "assets/images/repeat.png",
              color: AppColors.violet,
              onPressed: () {
                AutoRouter.of(context)
                    .navigate(const TransactionFrequenciesRoute());
              },
              title: "Transactions Frequencies",
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
              onPressed: () async {
                await context.read<ProfileCubit>().logout();
                AutoRouter.of(context).replaceAll([const LoginRoute()]);
              },
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
