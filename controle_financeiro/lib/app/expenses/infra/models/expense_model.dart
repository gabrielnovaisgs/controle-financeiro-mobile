import 'dart:convert';

import 'package:controle_financeiro/app/expenses/domain/entities/expense_entity.dart';

class ExpenseModel extends Expense {
  final DateTime dateExpense;
  final double value;
  final String category;
  final String note;

  ExpenseModel({this.dateExpense, this.value, this.category, this.note});

  Map<String, dynamic> toMap() {
    return {
      'dateExpense': dateExpense,
      'value': value,
      'category': category,
      'note': note,
    };
  }

  static ExpenseModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ExpenseModel(
      dateExpense: map['dateExpense'],
      category: map['category'],
      note: map['note'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());
  static ExpenseModel fromJson(String source) => fromMap(json.decode(source));
}
