import 'package:expense_tracker_app/src/extenstions/transaction_helper.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';
import "../../extenstions/transaction_helper.dart";
import "../../extenstions/number_helper.dart";
import "../../helpers/image_helper.dart";

class TransactionDetailsPage extends StatelessWidget {
  const TransactionDetailsPage({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.surface,
        ),
        Container(
          decoration: BoxDecoration(
              color: context.transactionIconColor(transaction.type),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          height: MediaQuery.of(context).size.height * 0.35,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
              IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/images/trash.png"))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 0.20),
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          "\$${transaction.amount.translate(context)}",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          transaction.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          transaction.formatDate(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.085,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _ContentField(
                              fieldKey: "Type",
                              fieldValue: transaction.type.name,
                            ),
                            _ContentField(
                              fieldKey: "Category",
                              fieldValue: transaction.type.name,
                            ),
                            _ContentField(
                              fieldKey: "Account Type",
                              fieldValue: "Wallet",
                            ),
                          ],
                        ),
                      ),
                    ),
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
                  SizedBox(
                    width: double.infinity,
                    child: transaction.attachment.isNotEmpty
                        ? Image.memory(
                            transaction.attachment.base64ToImage(),
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.attachment),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContentField extends StatelessWidget {
  const _ContentField({
    Key? key,
    required this.fieldKey,
    required this.fieldValue,
  }) : super(key: key);
  final String fieldKey;
  final String fieldValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Text(
          fieldKey,
          style: Theme.of(context).textTheme.caption,
        )),
        Expanded(
          child: Text(
            fieldValue,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
