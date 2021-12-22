import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage(
      {Key? key, required this.title, required this.body, required this.image})
      : super(key: key);
  final String title;
  final String body;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: image,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.dark,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            body,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.light20,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
