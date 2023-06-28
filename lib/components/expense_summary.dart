import 'package:expense_counter/bar%20graph/bar_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;
  const ExpenseSummary({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
            maxY: 100,
            monAmount: 20,
            tueAmount: 50,
            wedAmount: 10,
            thurAmount: 30,
            friAmount: 24,
            satAmount: 3,
            sunAmount: 90),
      ),
    );
  }
}
