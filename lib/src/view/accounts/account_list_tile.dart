import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/view/common/account_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/config/config_cubit.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({Key? key, required this.account}) : super(key: key);
  final Account account;
  @override
  Widget build(BuildContext context) {
    final currency = context.watch<ConfigCubit>().state.currency;
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
                  context.t
                      .amountWithCurrency(account.balance, currency.symbol),
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
