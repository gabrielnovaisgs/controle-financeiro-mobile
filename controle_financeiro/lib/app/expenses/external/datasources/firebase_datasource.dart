import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_financeiro/app/expenses/infra/datasources/expense_datasource.dart';
import 'package:controle_financeiro/app/expenses/infra/models/expense_model.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseDatasource implements ExpenseDatasource {
  @override
  Future<bool> setExpense(ExpenseModel expenseModel) async {
    print("datasource");
    await Firebase.initializeApp();
    try {
      FirebaseFirestore.instance
          .collection("expenses")
          .doc("Gasto dia")
          .set(expenseModel.toMap());
    } catch (e) {
      print(e);
    }
    print("Cadastrar no banco de dados: ${expenseModel.toMap()}");
  }
}
