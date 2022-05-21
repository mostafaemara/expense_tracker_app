import 'package:flutter/material.dart';

import 'notification_list_item.dart';

class NotificationList extends StatelessWidget {
  NotificationList({Key? key}) : super(key: key);

  final data = [
    {
      "title": "notification title 1",
      "desc": "blah blah blah 1",
      "date": DateTime.now()
    },
    {
      "title": "notification title 2",
      "desc": "blah blah blah 2",
      "date": DateTime.now()
    },
    {
      "title": "notification title 3",
      "desc": "blah blah blah 3",
      "date": DateTime.now()
    },
    {
      "title": "notification title 4",
      "desc": "blah blah blah 4",
      "date": DateTime.now()
    },
    {
      "title": "notification title 5",
      "desc": "blah blah blah 5",
      "date": DateTime.now()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => NotificationListItem(
          title: data[index]["title"] as String,
          description: data[index]["desc"] as String,
          date: data[index]["date"] as DateTime,
        ),
      ),
    );
  }
}
