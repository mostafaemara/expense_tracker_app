import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/view/common/account_icon.dart';
import 'package:flutter/material.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({Key? key, required this.account}) : super(key: key);
  final Account account;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).navigate(AccountDetailsRoute(account: account));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                AccountIcon(iconPath: account.type.iconPath()),
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
