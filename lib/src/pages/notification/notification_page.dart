import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/notification_list.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.notifications),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text(AppLocalizations.of(context)!.markAllRead)),
              PopupMenuItem(
                  child: Text(AppLocalizations.of(context)!.removeAll))
            ],
          ),
        ],
      ),
      body: NotificationList(),
    );
  }
}
