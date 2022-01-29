import 'package:expense_tracker_app/src/extenstions/transaction_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import "../../extenstions/transaction_helper.dart";

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
        actions: [DeleteButton()],
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
                    category: transaction.category.title.english,
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

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _showRemoveBottomSheet(context),
        icon: Image.asset("assets/images/trash.png"));
  }

  void _showRemoveBottomSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 217,
        width: double.infinity,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Remove this transaction?",
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "Are you sure do you wanna remove this transaction?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.light20),
                ),
                SizedBox(
                  height: 56,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onPrimary: AppColors.violet,
                                  primary: AppColors.violet20),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("No"))),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes")))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
