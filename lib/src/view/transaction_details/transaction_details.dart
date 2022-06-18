import 'package:expense_tracker_app/src/data/models/transaction.dart';
import 'package:expense_tracker_app/src/helpers/transaction_helper.dart';

import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:expense_tracker_app/src/view/common/remove_button.dart';
import 'package:flutter/material.dart';
import '../../helpers/transaction_helper.dart';

import 'widgets/attachment.dart';
import 'widgets/content_card.dart';
import 'widgets/header.dart';

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.transactionIconColor(transaction.type),
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
            onDeleteConfirmed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: context.transactionIconColor(transaction.type),
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
                    amount: transaction.amount,
                    description: transaction.description,
                    date: transaction.date,
                  ),
                  ContentFieldsCard(
                    account: "wallet",
                    type: transaction.type.name,
                    category: transaction.category.title,
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
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.light20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    transaction.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Attachment",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.light20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Attachment(
                    attachment: transaction.attachment,
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
    );
  }
}
