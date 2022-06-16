import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accounts"),
      ),
      body: Column(children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Accounts Balance",
                  style: TextStyle(color: AppColors.light20),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "\$${9400}",
                  style: TextStyle(
                      fontSize: 40,
                      color: AppColors.dark,
                      fontWeight: FontWeight.w600),
                )
              ]),
        )
      ]),
    );
  }
}
