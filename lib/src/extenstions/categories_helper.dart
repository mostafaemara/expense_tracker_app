import 'package:expense_tracker_app/src/models/category.dart';

import 'package:expense_tracker_app/src/models/transaction_type.dart';

extension CategoriesListFilter on List<Category> {
  List<Category> filterByTransactionType(TransactionType transactionType) {
    List<Category> categories = [];

    for (final c in this) {
      if (c.transactionType == transactionType) {
        categories.add(c);
      }
    }
    return categories;
  }
}
