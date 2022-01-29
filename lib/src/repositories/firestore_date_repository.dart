import 'dart:developer';

import 'package:expense_tracker_app/src/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/repositories/date_repository.dart';

import 'package:ntp/ntp.dart';

class FSDateRepository implements DateRepository {
  @override
  Future<DateTime> readCurrentTime() async {
    try {
      final date = await NTP.now();

      return date;
    } catch (e) {
      throw ServerException();
    }
  }
}
