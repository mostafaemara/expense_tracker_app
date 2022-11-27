import 'dart:developer';

import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/bloc/notification/notification_state.dart';
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

  void markAllAsRead() {}
}
