import 'package:controle_financeiro/app/expenses/domain/entities/expense_entity.dart';
import 'package:controle_financeiro/app/expenses/domain/repositories/expense_repository.dart';
import 'package:controle_financeiro/app/expenses/domain/usecases/insert_expense_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ExpenseRepositoryMock extends Mock implements ExpenseRepository {}

void main() {
  final repository = ExpenseRepositoryMock();
  final expenseEntity = Expense(
      dateExpense: DateTime.now(),
      category: "Comida",
      note: "BláBláBlá",
      value: 10.0);
  test('Deve retornar true ao inserir um Expense', () async {
    when(repository.setExpense(any)).thenAnswer((_) async => true);

    final insertExpenseUsecase = InsertExpenseUsecaseImpl(repository);
    final result = await insertExpenseUsecase(expenseEntity);
    expect(result, isTrue);
  });

  test('Deve retornar false caso falte Date, category ou note', () async {
    final insertExpenseUsecase = InsertExpenseUsecaseImpl(repository);
    final result = await insertExpenseUsecase(Expense());
    expect(result, isFalse);
  });

  test('Deve retoornar false caso o repository retorne false', () async {
    when(repository.setExpense(expenseEntity)).thenAnswer((_) async => false);

    final insertExpenseUsecase = InsertExpenseUsecaseImpl(repository);
    final result = await insertExpenseUsecase(expenseEntity);
    expect(result, isFalse);
  });
}
