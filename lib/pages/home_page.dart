import 'package:expense_counter/components/expense_tile.dart';
import 'package:expense_counter/data/expense_data.dart';
import 'package:expense_counter/models/expense_item.dart';
import 'package:expense_counter/models/text_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addNewExpense() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Добавить расходы'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: newExpenseNameController,
                  ),
                  TextField(
                    controller: newExpenseAmountController,
                  ),
                ],
              ),
              actions: [
                MaterialButton(onPressed: save, child: const Text('Сохранить')),
                MaterialButton(onPressed: cancel, child: const Text('Удалить'))
              ],
            ));
  }

  void save() {
    ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now());
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    Navigator.pop(context);
    clear();
  }

  void cancel() {
    Navigator.pop(context);
    clear();
  }

  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300],
            floatingActionButton: FloatingActionButton(
              onPressed: addNewExpense,
              child: const Icon(Icons.plus_one_sharp),
            ),
            body: ListView(children: [
              // weekly summary

              //expense list

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.getAllExpanseList().length,
                itemBuilder: (context, index) => ExpenseTile(
                  name: value.getAllExpanseList()[index].name,
                  amount: value.getAllExpanseList()[index].dateTime.toString(),
                  dateTime: value.getAllExpanseList()[index].dateTime,
                ),
              ),
            ])));
  }
}
