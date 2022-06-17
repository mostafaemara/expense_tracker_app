import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({Key? key, required this.account}) : super(key: key);
  final Account account;
  @override
  Widget build(BuildContext context) {
    final iconPath = account.type == AccountType.wallet
        ? "assets/images/wallet.png"
        : "assets/images/credit_card.png";
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).navigate(const AccountDetailsRoute());
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    iconPath,
                    color: AppColors.violet,
                    height: 32,
                    width: 32,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.light40),
                  width: 48,
                  height: 48,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  account.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  "\$${account.balance}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider()
        ],
      ),
    );
  }
}
