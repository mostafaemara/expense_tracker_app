import 'package:flutter/material.dart';

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 56.0,
        height: 56.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: const CircleBorder(),
          ),
          clipBehavior: Clip.antiAlias,
          onPressed: onPressed,
          child: icon,
        ));
  }
}
