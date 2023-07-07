import 'package:hive_flutter/hive_flutter.dart';

import '../models/expense_item.dart';

class HiveDataBase {
  final _myBox = Hive.box('expense_database1');

  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpenseFormatted = [];

    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];

      allExpenseFormatted.add(expenseFormatted);
    }
    _myBox.put('All_expenses', allExpenseFormatted);
  }

  List<ExpenseItem> readData() {
    List savedExpenses = _myBox.get('All_expenses') ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][02];

      ExpenseItem expense =
          ExpenseItem(name: name, amount: amount, dateTime: dateTime);

      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
