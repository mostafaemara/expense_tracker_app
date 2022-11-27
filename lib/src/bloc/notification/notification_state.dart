// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expense_tracker_app/src/data/models/notification.dart';

class NotificationState {
  final List<Notification> notifications;
  final bool isLoading;

  NotificationState(this.notifications, this.isLoading);

  NotificationState copyWith({
    List<Notification>? notifications,
    bool? isLoading,
  }) {
    return NotificationState(
      notifications ?? this.notifications,
      isLoading ?? this.isLoading,
    );
  }

  int lengthOfNotification() {
    int count = 0;

    for (final not in notifications) {
      if (!not.markedAsRead) {
        count++;
      }
    }
    return count;
  }
}
