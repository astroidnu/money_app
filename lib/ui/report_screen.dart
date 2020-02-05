import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:money_app_v1/model/income.dart';
import 'package:money_app_v1/model/outcome.dart';

class ReportScreen extends StatelessWidget {
  List<Income> incomeList = [
    Income(month: "January", amount: 200),
    Income(month: "February", amount: 30),
    Income(month: "March", amount: 60),
    Income(month: "April", amount: 37),
  ];

  List<Outcome> outcomeList = [
    Outcome(month: "January", amount: 154),
    Outcome(month: "February", amount: 35),
    Outcome(month: "March", amount: 100),
    Outcome(month: "April", amount: 80),
  ];

  bool animate = true;

  @override
  Widget build(BuildContext context) {
    List<charts.Series<dynamic, String>> listSeries = [
      charts.Series<Income, String>(
        id: "Pemasukan",
        domainFn: (Income income, _) => income.month,
        measureFn: (Income income, _) => income.amount,
        data: incomeList,
      ),
      charts.Series<Outcome, String>(
        id: "Pemasukan",
        domainFn: (Outcome outcome, _) => outcome.month,
        measureFn: (Outcome outcome, _) => outcome.amount,
        data: outcomeList,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: _buildChart(listSeries),
    );
  }

  Widget _buildChart(List<charts.Series> listSeries) {
    return charts.BarChart(
      listSeries,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
      animationDuration: Duration(seconds: 2),
      defaultInteractions: false,
    );
  }
}
