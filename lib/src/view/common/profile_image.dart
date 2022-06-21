import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: Theme.of(context).colorScheme.primary,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(45),
            )));
  }
}
