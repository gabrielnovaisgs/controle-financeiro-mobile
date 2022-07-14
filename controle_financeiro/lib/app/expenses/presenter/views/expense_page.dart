import 'package:controle_financeiro/app/expenses/domain/entities/expense_entity.dart';
import 'package:controle_financeiro/app/expenses/domain/usecases/insert_expense_usecase.dart';
import 'package:controle_financeiro/app/expenses/infra/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExpensePage extends StatelessWidget {
  ExpensePage({Key key}) : super(key: key);
  final insert = Modular.get<InsertExpenseUsecaseImpl>();
  final expense = new ExpenseModel(
      dateExpense: DateTime.now(),
      value: 500.0,
      category: "Docinho",
      note: "Meu namorado olhou espantado");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gastos"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Enviar (com muita enfâse)"),
          onPressed: () => insert(expense),
        ),
      ),
    );
  }
}
