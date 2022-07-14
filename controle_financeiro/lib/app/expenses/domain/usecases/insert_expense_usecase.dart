import 'package:controle_financeiro/app/expenses/domain/entities/expense_entity.dart';
import 'package:controle_financeiro/app/expenses/domain/repositories/expense_repository.dart';

abstract class IInsertExpenseUsecase {
  Future<bool> call(Expense expense);
}

class InsertExpenseUsecaseImpl implements IInsertExpenseUsecase {
  final ExpenseRepository repository;

  InsertExpenseUsecaseImpl(this.repository);

  @override
  Future<bool> call(Expense expense) async {
    bool validation = expenseValidation(expense);
    if (validation) {
      validation = await repository.setExpense(expense);
    }

    return validation;
  }

  bool expenseValidation(Expense expense) {
    bool validation = true;
    if (expense.category == null) {
      validation = false;
    }
    if (expense.value == null) {
      validation = false;
    }

    if (expense.dateExpense == null) {
      validation = false;
    }
    return validation;
  }
}
