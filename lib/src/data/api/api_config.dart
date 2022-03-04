import 'package:expense_tracker_app/src/data/models/finance.dart';

class ApiConfig {
  static const baseUrl = "https://expense-tracker-api-mse.herokuapp.com/api";
  static const loginPath = "/auth/login";
  static const signupPath = "/auth/register";
  static const accountPath = "/account";
  static const transactionPath = "/transaction";
  static const categoryPath = "/category";
  static const financesPath = "/transaction/finances";
}
