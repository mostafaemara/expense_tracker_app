import 'package:expense_tracker_app/src/data/models/user.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.user,
    required this.onEditePressed,
  }) : super(key: key);
  final User user;
  final VoidCallback onEditePressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: user.image.isNotEmpty
                      ? Image.network(
                          user.image,
                          fit: BoxFit.cover,
                        )
                      : Image.asset("assets/images/user_place_holder.png"),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Username",
                  style: TextStyle(fontSize: 14, color: AppColors.light20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.dark),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: onEditePressed,
                icon: Image.asset(
                  "assets/images/edit.png",
                  width: 32,
                  height: 32,
                ))
          ],
        ));
  }
}
