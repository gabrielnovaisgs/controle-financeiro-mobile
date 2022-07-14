import 'package:controle_financeiro/app/expenses/infra/models/expense_model.dart';

abstract class ExpenseDatasource {
  Future<bool> setExpense(ExpenseModel expenseModel);
}
