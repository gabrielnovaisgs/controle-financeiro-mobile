import 'package:controle_financeiro/app/expenses/external/datasources/firebase_datasource.dart';
import 'package:controle_financeiro/app/expenses/infra/models/expense_model.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final firebase = FirebaseDatasource();
  final expense = ExpenseModel(
      dateExpense: DateTime.now(),
      category: "Comida",
      note: "BláBláBlá",
      value: 10.0);

  test('Deve retornar um true caso tenha dado certo', () async {
    firebase.setExpense(expense);
  });
}
