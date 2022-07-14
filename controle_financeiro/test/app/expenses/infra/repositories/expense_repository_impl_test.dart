import 'package:controle_financeiro/app/expenses/infra/datasources/expense_datasource.dart';
import 'package:controle_financeiro/app/expenses/infra/models/expense_model.dart';
import 'package:controle_financeiro/app/expenses/infra/repositories/expense_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ExpenseDatasourceImpl extends Mock implements ExpenseDatasource {}

void main() {
  final datasource = ExpenseDatasourceImpl();
  final repository = ExpenseRepositoryImpl(datasource);
  final expense = ExpenseModel(
      dateExpense: DateTime.now(),
      category: "Comida",
      note: "BláBláBlá",
      value: 10.0);

  test('Deve retornar true quando o dado for inserido', () async {
    when(datasource.setExpense(expense)).thenAnswer((_) async => true);
    final result = await repository.setExpense(expense);
    expect(result, isTrue);
  });

  test('Deve retornar false quando o datasouce falhar', () async {
    when(datasource.setExpense(expense)).thenThrow(Exception());
    final result = await repository.setExpense(expense);
    expect(result, isFalse);
  });
}
