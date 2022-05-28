import 'package:expense_tracker_app/src/bloc/transactions/transactions_cubit.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestButton extends StatelessWidget {
  const RestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71,
      height: 32,
      child: ElevatedButton(
        onPressed: () {
          context.read<TransactionCubit>().restFilter();
        },
        child: const Text(
          "Rest",
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColors.violet20,
          onPrimary: AppColors.violet,
        ),
      ),
    );
  }
}
