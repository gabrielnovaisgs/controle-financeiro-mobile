import 'package:controle_financeiro/app/expenses/domain/entities/expense_entity.dart';
import 'package:controle_financeiro/app/expenses/domain/repositories/expense_repository.dart';
import 'package:controle_financeiro/app/expenses/infra/datasources/expense_datasource.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseDatasource datasource;

  ExpenseRepositoryImpl(this.datasource);

  @override
  Future<bool> setExpense(Expense expense) async {
    try {
      final result = await datasource.setExpense(expense);
      return result;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
