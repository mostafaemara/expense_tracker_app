import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/bloc/submission_status.dart';
import 'package:expense_tracker_app/src/bloc/transaction_details/transaction_details_cubit.dart';
import 'package:expense_tracker_app/src/bloc/transaction_details/transaction_details_state.dart';
import 'package:expense_tracker_app/src/helpers/transaction_helper.dart';
import 'package:expense_tracker_app/src/helpers/ui_helper.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/remove_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/attachment.dart';
import 'widgets/content_card.dart';
import 'widgets/header.dart';

class TransactionDetailsPage extends StatefulWidget {
  const TransactionDetailsPage({Key? key, required this.arg}) : super(key: key);
  final dynamic arg;

  @override
  State<TransactionDetailsPage> createState() => _TransactionDetailsPageState();
}

class _TransactionDetailsPageState extends State<TransactionDetailsPage> {
  @override
  void initState() {
    context.read<TransactionDetailsCubit>().init(widget.arg);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionDetailsCubit, TransactionDetailsState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          context.showSnackBar(state.error, backgroundColor: AppColors.red);
        }
        if (state.status == Status.success) {
          AutoRouter.of(context).pop(true);
        }
      },
      builder: (context, state) => state.status == Status.loading
          ? const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor:
                    context.transactionIconColor(state.transaction!.type),
                iconTheme: Theme.of(context)
                    .appBarTheme
                    .iconTheme!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                title: Text(
                  "Transaction Details",
                  style: Theme.of(context)
                      .appBarTheme
                      .titleTextStyle!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                actions: [
                  DeleteButton(
                    color: AppColors.light,
                    body: "Are you sure do you wanna remove this transaction?",
                    title: "Remove this transaction?",
                    onDeleteConfirmed: () {
                      BlocProvider.of<TransactionDetailsCubit>(context)
                          .deleteTransaction(state.transaction!.id);
                    },
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: context
                              .transactionIconColor(state.transaction!.type),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16))),
                      height: (MediaQuery.of(context).size.height * 0.35) -
                          MediaQuery.of(context).padding.top,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(
                            amount: state.transaction!.amount,
                            description: state.transaction!.description,
                            date: state.transaction!.date,
                          ),
                          ContentFieldsCard(
                            account: "wallet",
                            type: state.transaction!.type.name,
                            category: state.transaction!.category.title,
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            "Description",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.light20),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            state.transaction!.description,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Attachment",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.light20),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Attachment(
                            attachment: state.transaction!.attachment,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
