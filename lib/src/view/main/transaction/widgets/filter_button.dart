import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

import 'filter_card.dart';

class FilterButton extends StatelessWidget {
  FilterButton({
    Key? key,
  }) : super(key: key);
  bool isFilterActive = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFilterBottomSheet(context),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: 56,
            height: 56,
            child: Card(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: AppColors.light60),
                  borderRadius: BorderRadius.circular(
                    16,
                  )),
              child: Image.asset("assets/images/sort.png"),
              elevation: 0,
            ),
          ),
          if (isFilterActive)
            Container(
              alignment: Alignment.center,
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24)),
              child: Text(
                "!",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (context) => const FilterCard(),
    );
  }
}
