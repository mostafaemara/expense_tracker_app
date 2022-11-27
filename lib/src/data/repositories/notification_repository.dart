import 'package:cloud_firestore/cloud_firestore.dart' as fb;
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/data/models/notification.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

class NotificationRepository {
  final fireStore = fb.FirebaseFirestore.instance;

  Future<List<Notification>> readNotifications() async {
    final List<Notification> notifications = [];
    try {
      final user = await locator<UserRepository>().readUser();
      final snapShot = await fireStore
          .collection("notifications")
          .where("userId", isEqualTo: user!.id)
          .get();
      for (final doc in snapShot.docs) {
        var data = doc.data();
        data["created_at"] =
            (data["created_at"] as fb.Timestamp).millisecondsSinceEpoch;
        notifications.add(Notification.fromMap({...data, "id": doc.id}));
      }
      return notifications;
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> removeAll() async {
    try {
      final user = await locator<UserRepository>().readUser();
      final snapShot = await fireStore
          .collection("notifications")
          .where("userId", isEqualTo: user!.id)
          .get();

      for (final doc in snapShot.docs) {
        await fireStore.collection("notifications").doc(doc.id).delete();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> markAsRead(String id) async {
    try {
      await fireStore
          .collection("notifications")
          .doc(id)
          .update({"mark_as_read": true});
    } catch (e) {
      throw ServerException();
    }
  }

  Future<void> markAllAsRead() async {
    try {
      final user = await locator<UserRepository>().readUser();
      final snapShot = await fireStore
          .collection("notifications")
          .where("userId", isEqualTo: user!.id)
          .where("mark_as_read", isEqualTo: false)
          .get();

      for (final doc in snapShot.docs) {
        await fireStore
            .collection("notifications")
            .doc(doc.id)
            .update({"mark_as_read": true});
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
