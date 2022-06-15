import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.color,
    required this.title,
    required this.body,
    required this.onDeleteConfirmed,
  }) : super(key: key);
  final Color color;
  final String title;
  final String body;
  final VoidCallback onDeleteConfirmed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _showRemoveBottomSheet(context),
        icon: Image.asset(
          "assets/images/trash.png",
          color: color,
        ));
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
                  title,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  body,
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
                                onDeleteConfirmed();

                                Navigator.of(context).pop();
                              },
                              child: const Text("Yes")))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
