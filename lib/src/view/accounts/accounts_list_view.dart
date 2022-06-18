import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:flutter/material.dart';

import 'account_list_tile.dart';

class AccountsListView extends StatelessWidget {
  final List<Account> accounts;
  const AccountsListView({Key? key, required this.accounts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (context, index) => AccountListTile(
        account: accounts[index],
      ),
    );
  }
}
