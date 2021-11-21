import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unselectedItemColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    final selectedItemColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor;
    return BottomAppBar(
      elevation: 0,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/home.png",
              color: selectedItemColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/home.png",
              color: selectedItemColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/home.png",
              color: selectedItemColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/home.png",
              color: selectedItemColor,
            ),
          )
        ],
      ),
    );
  }
}


//  child: BottomNavigationBar(
//           elevation: 0,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           items: [
//             BottomNavigationBarItem(
//                 activeIcon: Image.asset(
//                   "assets/images/home.png",
//                   color: selectedItemColor,
//                 ),
//                 icon: Image.asset(
//                   "assets/images/home.png",
//                   color: unselectedItemColor,
//                 ),
//                 label: AppLocalizations.of(context)!.home),
//             BottomNavigationBarItem(
//                 activeIcon: Image.asset(
//                   "assets/images/transaction.png",
//                   color: selectedItemColor,
//                 ),
//                 icon: Image.asset(
//                   "assets/images/transaction.png",
//                   color: unselectedItemColor,
//                 ),
//                 label: AppLocalizations.of(context)!.transaction),
//             BottomNavigationBarItem(
//                 activeIcon: Image.asset("assets/images/pie-chart.png",
//                     color: selectedItemColor),
//                 icon: Image.asset("assets/images/pie-chart.png",
//                     color: unselectedItemColor),
//                 label: AppLocalizations.of(context)!.budget),
//             BottomNavigationBarItem(
//                 activeIcon: Image.asset("assets/images/user.png",
//                     color: selectedItemColor),
//                 icon: Image.asset("assets/images/user.png",
//                     color: unselectedItemColor),
//                 label: AppLocalizations.of(context)!.profile)
//           ]),