import 'package:flutter/material.dart';

import 'widgets/head.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Head(), Expanded(child: Container())],
    );
  }
}
