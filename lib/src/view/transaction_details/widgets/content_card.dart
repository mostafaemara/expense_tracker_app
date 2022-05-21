import 'package:flutter/material.dart';

class ContentFieldsCard extends StatelessWidget {
  const ContentFieldsCard({
    Key? key,
    required this.type,
    required this.category,
    required this.account,
  }) : super(key: key);

  final String type;
  final String category;
  final String account;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.085,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ContentField(
                fieldKey: "Type",
                fieldValue: type,
              ),
              _ContentField(
                fieldKey: "Category",
                fieldValue: category,
              ),
              _ContentField(
                fieldKey: "Wallet",
                fieldValue: account,
              ),
            ],
          ),
        ),
      ),
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
