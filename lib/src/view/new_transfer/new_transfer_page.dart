import 'package:expense_tracker_app/src/bloc/new_transfer/new_transfer_cubit.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../common/my_app_bar.dart';
import 'widgets/transfer_form.dart';

class NewTransferPage extends StatefulWidget {
  const NewTransferPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NewTransferPage> createState() => _NewTransferPageState();
}

class _NewTransferPageState extends State<NewTransferPage> {
  late NewTransferCubit _newTransactionCubit;
  @override
  void didChangeDependencies() {
    _newTransactionCubit = NewTransferCubit();
    _newTransactionCubit.init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _newTransactionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: Theme.of(context).copyWith(
          appBarTheme: AppBarTheme(
              titleTextStyle: theme.appBarTheme.titleTextStyle!
                  .copyWith(color: theme.colorScheme.onPrimary))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.blue,
        appBar: MyAppBar(title: AppLocalizations.of(context)!.transfer),
        body: BlocProvider.value(
            value: _newTransactionCubit, child: const TransferForm()),
      ),
    );
  }
}
