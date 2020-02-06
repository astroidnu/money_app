import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:money_app_v1/model/income.dart';
import 'package:money_app_v1/model/outcome.dart';
import 'package:money_app_v1/res/custom_bar_chart.dart';

class ReportScreen extends StatelessWidget {
  final List<Income> incomeList = [
    Income(month: "January", amount: 200),
    Income(month: "February", amount: 30),
    Income(month: "March", amount: 60),
    Income(month: "April", amount: 37),
  ];

  final List<Outcome> outcomeList = [
    Outcome(month: "January", amount: 154),
    Outcome(month: "February", amount: 35),
    Outcome(month: "March", amount: 100),
    Outcome(month: "April", amount: 80),
  ];

  final bool animate = true;

  @override
  Widget build(BuildContext context) {
    List<Series<dynamic, String>> listSeries = [
      Series<Income, String>(
        id: "Pemasukan",
        domainFn: (Income income, _) => income.month,
        measureFn: (Income income, _) => income.amount,
        data: incomeList,
        labelAccessorFn: (Income income, int index) => "${income.amount}",
        outsideLabelStyleAccessorFn: (Income income, int index) =>
            TextStyleSpec(color: MaterialPalette.green.shadeDefault),
        fillColorFn: (Income income, int index) {
          if (income.month=="February"){
            return MaterialPalette.green.shadeDefault.darker;
          }
          return MaterialPalette.green.shadeDefault.lighter;
        },
      ),
      Series<Outcome, String>(
        id: "Pemasukan",
        domainFn: (Outcome outcome, _) => outcome.month,
        measureFn: (Outcome outcome, _) => outcome.amount,
        data: outcomeList,
        labelAccessorFn: (Outcome outcome, int index) => "${outcome.amount}",
        outsideLabelStyleAccessorFn: (Outcome outcome, int index) =>
            TextStyleSpec(color: MaterialPalette.green.shadeDefault),
        fillColorFn: (Outcome outcome, int index) {
          if (outcome.month=="February"){
            return MaterialPalette.red.shadeDefault.darker;
          }
          return MaterialPalette.red.shadeDefault.lighter;
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
              height: 300,
              child: CustomBarChart(
                listSeries,
                animate: animate,
              )),
        ),
      ),
    );
  }
}
