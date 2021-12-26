import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';

extension TransactionInputHelper on TransactionInput {
  TransactionInput toInternalTransactionByType(
      TransactionType type, String categoryId) {
    if (type == TransactionType.expense) {
      return ExpenseInput.fromTransaction(
          transaction: this, category: categoryId);
    }

    return IncomeInput.fromTransaction(transaction: this, category: categoryId);
  }
}
