import 'package:expensetracker/widget/expenses_list/expenses_list.dart';
import 'package:expensetracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Groceries',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Gas',
      amount: 50.00,
      date: DateTime.now(),
      category: Category.transportation,
    ),
    Expense(
      title: 'Internet',
      amount: 100.00,
      date: DateTime.now(),
      category: Category.bills,
    ),
    Expense(
      title: 'Movie',
      amount: 20.00,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('The chart'),
        Expanded(
          child: ExpensesList(expenses: _registeredExpenses),
        ),
      ]),
    );
  }
}
