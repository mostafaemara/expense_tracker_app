import 'package:auto_route/auto_route.dart';
import 'package:expense_tracker_app/src/routes/app_router.dart';
import 'package:expense_tracker_app/src/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(children: [
        SettingsListTile(
          title: "Currency",
          subtitle: "USD",
          onPressed: () {
            AutoRouter.of(context).navigate(const CurrencyRoute());
          },
        ),
        SettingsListTile(
          title: "Language",
          subtitle: "English",
          onPressed: () {
            AutoRouter.of(context).navigate(const LanguageRoute());
          },
        ),
        SettingsListTile(
          title: "Theme",
          subtitle: "Dark",
          onPressed: () {
            AutoRouter.of(context).navigate(const ThemeRoute());
          },
        ),
        const SizedBox(height: 50),
        SettingsListTile(
          title: "About",
          subtitle: "",
          onPressed: () {
            AutoRouter.of(context).navigate(const AboutRoute());
          },
        ),
      ]),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: AppColors.light20),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).colorScheme.primary,
        )
      ]),
    );
  }
}
