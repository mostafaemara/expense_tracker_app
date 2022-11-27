import 'package:expense_tracker_app/src/bloc/notification/notification_cubit.dart';
import 'package:expense_tracker_app/src/bloc/notification/notification_state.dart';
import 'package:expense_tracker_app/src/view/notification/widgets/notification_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) => state.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) => NotificationListItem(
                  notification: state.notifications[index],
                ),
              ),
      ),
    );
  }
}
