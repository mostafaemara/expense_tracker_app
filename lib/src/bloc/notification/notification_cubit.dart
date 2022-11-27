import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/notification/notification_state.dart';
import 'package:expense_tracker_app/src/data/models/notification.dart';
import 'package:expense_tracker_app/src/data/repositories/notification_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState([], true));
  final _notificationRepository = locator<NotificationRepository>();
  void init() async {
    try {
      final notifications = await _notificationRepository.readNotifications();
      emit(state.copyWith(notifications: notifications, isLoading: false));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(isLoading: false));
    }
  }

  void markAllAsRead() async {
    try {
      final List<Notification> notifications = [];

      await _notificationRepository.markAllAsRead();
      for (final n in state.notifications) {
        notifications.add(n.copyWith(markedAsRead: true));
      }
      emit(state.copyWith(
        notifications: notifications,
      ));
    } catch (e) {
      log(e.toString());
    }
  }

  void deleteAll() async {
    try {
      await _notificationRepository.removeAll();

      emit(state.copyWith(
        notifications: [],
      ));
    } catch (e) {
      log(e.toString());
    }
  }

  void markAsRead(String id) async {
    try {
      final List<Notification> notifications =
          List<Notification>.from(state.notifications);

      await _notificationRepository.markAsRead(id);

      int index = notifications.indexWhere((element) => element.id == id);
      notifications[index] = notifications[index].copyWith(markedAsRead: true);

      emit(state.copyWith(
        notifications: notifications,
      ));
    } catch (e) {
      log(e.toString());
    }
  }
}
