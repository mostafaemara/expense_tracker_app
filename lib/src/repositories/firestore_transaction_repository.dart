import 'package:expense_tracker_app/src/exceptions/server_exception.dart';
import 'package:expense_tracker_app/src/models/transaction_input.dart';
import 'package:expense_tracker_app/src/models/transaction.dart';
import 'package:expense_tracker_app/src/repositories/transaction_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firebase;

class FSTransactionRepository implements TransactionRepository {
  final _usersCollection =
      firebase.FirebaseFirestore.instance.collection("users");
  @override
  Future<void> addTransaction(TransactionInput transaction, String uid) async {
    try {
      await _usersCollection.doc(uid).collection("transactions").add({
        ...transaction.toMap(),
        "date": firebase.FieldValue.serverTimestamp()
      });
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Transaction>> getAllTransactions(String uid) async {
    try {
      final snapShots =
          await _usersCollection.doc(uid).collection("transactions").get();

      return _documentsToTransactions(snapShots.docs);
    } catch (e) {
      throw ServerException();
    }
  }

  List<Transaction> _documentsToTransactions(
      List<firebase.QueryDocumentSnapshot<Map<String, dynamic>>> documents) {
    List<Transaction> transactions = [];

    for (final doc in documents) {
      transactions.add(Transaction.fromDocument(doc));
    }
    return transactions;
  }
}
