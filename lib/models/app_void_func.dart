// import 'package:flutter/material.dart';

// import 'text_controller.dart';

// void addNewExpense() {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: Text('Добавить расходы'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: newExpenseNameController,
//                   ),
//                   TextField(
//                     controller: newExpenseAmountController,
//                   )
//                   ,
//                 ],
//               ),

//               actions: [
//                 MaterialButton(onPressed: save,
//                 child: Text('Сохранить')),
//                 MaterialButton(onPressed: cancel,
//                 child: Text('Удалить'))

//               ],
//             ));
//   }