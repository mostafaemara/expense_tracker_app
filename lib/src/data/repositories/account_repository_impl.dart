import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/api/api.dart';

class AccountRepository {
  final _api = locator<Api>();
}
