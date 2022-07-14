import 'package:controle_financeiro/app/expenses/domain/entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<bool> setExpense(Expense expense);
}
