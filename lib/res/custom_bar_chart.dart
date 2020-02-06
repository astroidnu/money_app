import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart';

class CustomBarChart extends StatelessWidget {
  final List<Series<dynamic, dynamic>> listSeries;
  final bool animate;

  CustomBarChart(this.listSeries, {this.animate = false});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      listSeries,
      animate: animate,
      barGroupingType: BarGroupingType.grouped,
      animationDuration: Duration(seconds: 2),
      defaultInteractions: false,
      barRendererDecorator: BarLabelDecorator<String>(),
    );
  }
}

