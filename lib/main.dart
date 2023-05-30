import 'package:flutter/material.dart';

import 'package:expensetracker/widget/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
      ),
      home: const Expenses(),
    ),
  );
}
