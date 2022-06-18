import 'package:expense_tracker_app/src/helpers/number_helper.dart';
import 'package:flutter/material.dart';
import '../../../helpers/date_time_helper.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.amount,
    required this.description,
    required this.date,
  }) : super(key: key);

  final double amount;
  final String description;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height * 0.28) -
          MediaQuery.of(context).padding.top,
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          Text(
            "\$${amount.translate(context)}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            date.formatDateDDDDdMMyhm(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
