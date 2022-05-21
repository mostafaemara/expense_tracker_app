import 'package:expense_tracker_app/src/data/exceptions/server_exception.dart';

import 'package:ntp/ntp.dart';

class DateRepository {
  Future<DateTime> readCurrentTime() async {
    try {
      final date = await NTP.now();

      return date;
    } catch (e) {
      throw ServerException();
    }
  }
}
