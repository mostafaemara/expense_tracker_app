import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_cubit.dart';
import 'package:expense_tracker_app/src/bloc/accounts/accounts_state.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'accounts_list_view.dart';

class AccountsPage extends StatefulWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  State<AccountsPage> createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  @override
  void initState() {
    context.read<AccountsCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accounts"),
      ),
      body: BlocBuilder<AccountsCubit, AccountsState>(
        builder: (context, state) => state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Accounts Balance",
                          style: TextStyle(color: AppColors.light20),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "\$${state.accountsBalance()}",
                          style: const TextStyle(
                              fontSize: 40,
                              color: AppColors.dark,
                              fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: AccountsListView(accounts: state.accounts)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      log("clicked");
                      final result = await AutoRouter.of(context)
                          .push(AddNewAccountRoute(isSetupAccount: false));
                      if (result != null) {
                        context.read<AccountsCubit>().init();
                      }
                    },
                    child: const Text("+ Add new Account"),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ]),
      ),
    );
  }
}
