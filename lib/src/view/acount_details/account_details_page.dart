import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/account_details/account_details_bloc.dart';
import 'package:expense_tracker_app/src/bloc/account_details/account_details_state.dart';
import 'package:expense_tracker_app/src/data/models/account.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/view/common/account_icon.dart';
import 'package:expense_tracker_app/src/view/common/loading_indecator.dart';
import 'package:expense_tracker_app/src/view/common/transaction_list_item.dart';
import 'package:expense_tracker_app/src/view/common/transactions_of_date_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsPage extends StatefulWidget {
  final Account account;
  const AccountDetailsPage({Key? key, required this.account}) : super(key: key);

  @override
  State<AccountDetailsPage> createState() => _AccountDetailsPageState();
}

class _AccountDetailsPageState extends State<AccountDetailsPage> {
  @override
  void initState() {
    context.read<AccountDetailsCubit>().init(widget.account);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Account Details"),
          actions: [
            IconButton(
                onPressed: () async {
                  final result = await AutoRouter.of(context).push(
                      AddNewAccountRoute(
                          account: widget.account, isSetupAccount: false));
                  if (result != null) {
                    AutoRouter.of(context).pop(result);
                  }
                },
                icon: Image.asset("assets/images/edit.png"))
          ],
        ),
        body: BlocBuilder<AccountDetailsCubit, AccountDetailsState>(
            builder: ((context, state) => state.isLoading
                ? const LoadingIndecator()
                : SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 31,
                          ),
                          AccountIcon(iconPath: widget.account.type.iconPath()),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            widget.account.title,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "\$${widget.account.balance}",
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 47,
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              child: Column(
                                  children: state.transactions
                                      .map((e) => TransactionsOfDateListItem(
                                            date: e.date,
                                            transactions: e.transactions
                                                .map((t) => TransactionListItem(
                                                      onPressed: () {},
                                                      transaction: t,
                                                    ))
                                                .toList(),
                                          ))
                                      .toList()))
                        ],
                      ),
                    ),
                  ))));
  }
}
