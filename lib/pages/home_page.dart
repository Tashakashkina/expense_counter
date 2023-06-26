import 'package:expense_counter/models/text_controller.dart';
import 'package:flutter/material.dart';

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

  void save() {}

  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: const Icon(Icons.plus_one_sharp),
      ),
    );
  }
}
