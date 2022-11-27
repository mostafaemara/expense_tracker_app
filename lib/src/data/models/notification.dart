// ignore_for_file: public_member_api_docs, sort_constructors_first

class Notification {
  final String id;
  final String title;
  final String body;
  final String transactionId;
  final NotificationType type;
  final DateTime createdAt;
  final bool markedAsRead;

  Notification(this.id, this.title, this.body, this.transactionId, this.type,
      this.createdAt, this.markedAsRead);

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
        map['id'] as String,
        map['title'] as String,
        map['body'] as String,
        map['transactionId'] as String,
        NotificationType.parse(map['type']),
        DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
        map['mark_as_read']);
  }
}

enum NotificationType {
  announcement("announcement"),
  transactionEvent("transaction_event");

  factory NotificationType.parse(String value) {
    switch (value) {
      case "announcement":
        return NotificationType.announcement;
      case "transaction_event":
        return NotificationType.transactionEvent;
      default:
        throw Exception("invalid Notification Type");
    }
  }
  const NotificationType(this.value);
  final String value;
}
