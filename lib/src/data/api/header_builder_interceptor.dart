import 'package:dio/dio.dart';
import 'package:expense_tracker_app/injection.dart';
import 'package:expense_tracker_app/src/data/repositories/user_repository.dart';

class HeaderBuilderInterceptor extends Interceptor {
  final _userRepository = locator<UserRepository>();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final user = await _userRepository.readUser();
    if (user != null) {
      options.headers["Authorization"] = "Bearer ${user.token}";
    }

    return super.onRequest(options, handler);
  }
}
