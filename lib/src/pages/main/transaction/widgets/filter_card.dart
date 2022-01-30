import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 495,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _Title(
                  title: "Filter Transaction",
                ),
                _RestButton()
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const _Title(
              title: "Filter By",
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 8,
              children: [
                _FilterButton(
                  onPressed: () {},
                  title: "Icome",
                ),
                _FilterButton(
                  onPressed: () {},
                  title: "Expense",
                ),
                _FilterButton(
                  onPressed: () {},
                  title: "Transfer",
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const _Title(
              title: "Sort By",
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              runSpacing: 8,
              spacing: 8,
              children: [
                _FilterButton(
                  onPressed: () {},
                  title: "Highest",
                ),
                _FilterButton(
                  onPressed: () {},
                  title: "Lowest",
                ),
                _FilterButton(
                  onPressed: () {},
                  title: "Newest",
                ),
                _FilterButton(
                  onPressed: () {},
                  title: "Oldest",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const _FilterButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 42,
        width: 98,
        child: ElevatedButton(onPressed: onPressed, child: Text(title)));
  }
}

class _RestButton extends StatelessWidget {
  const _RestButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 71,
      height: 32,
      child: ElevatedButton(
        onPressed: () {},
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

class _Title extends StatelessWidget {
  final String title;
  const _Title({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
