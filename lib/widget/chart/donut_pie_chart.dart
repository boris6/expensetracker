import 'package:expensetracker/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:collection/collection.dart';

class DonutPieChart extends StatelessWidget {
  final List<Expense> expenses;

  const DonutPieChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final data = _createChartData(expenses);

    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
        textStyle: const TextStyle(fontSize: 12),
      ),
      series: <CircularSeries>[
        DoughnutSeries<_ExpenseData, String>(
          dataSource: data,
          xValueMapper: (_ExpenseData expense, _) => expense.category,
          yValueMapper: (_ExpenseData expense, _) => expense.amount,
          dataLabelMapper: (_ExpenseData expense, _) =>
              '${expense.category}: \$${expense.amount}',
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
            textStyle: TextStyle(fontSize: 12),
          ),
          radius: '70%',
          innerRadius: '85%',
          enableTooltip: true,
          cornerStyle: CornerStyle.bothCurve,
        ),
      ],
    );
  }

  List<_ExpenseData> _createChartData(List<Expense> expenses) {
    final data = <_ExpenseData>[];
    final groupedExpenses = groupBy(expenses, (expense) => expense.category);
    groupedExpenses.forEach((category, expenses) {
      final totalAmount =
          expenses.fold<double>(0.0, (sum, expense) => sum + expense.amount);
      data.add(_ExpenseData(category.name, totalAmount));
    });
    return data;
  }
}

class _ExpenseData {
  final String category;
  final double amount;

  _ExpenseData(this.category, this.amount);
}
