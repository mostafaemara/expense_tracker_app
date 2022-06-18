import 'package:expense_tracker_app/src/bloc/new_account/new_account_cubit.dart';
import 'package:expense_tracker_app/src/view/common/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/add_new_account_form.dart';

class AddNewAccountPage extends StatelessWidget {
  const AddNewAccountPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => NewAccountCubit(),
      child: Theme(
        data: Theme.of(context).copyWith(
            appBarTheme: AppBarTheme(
                titleTextStyle: theme.appBarTheme.titleTextStyle!
                    .copyWith(color: theme.colorScheme.onPrimary))),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: MyAppBar(title: AppLocalizations.of(context)!.addNewAccount),
          body: const AddNewAccountForm(),
        ),
      ),
    );
  }
}
