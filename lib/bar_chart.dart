import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<TimeOpen> data;
  const BarChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TimeOpen, String>> series = [
      charts.Series(
        id: "notif",
        data: data,
        domainFn: (TimeOpen series, _) => series.notif!,
        measureFn: (TimeOpen series, _) => series.range,
        colorFn: (TimeOpen series, _) => series.color,
      )
    ];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                'Bar Chart Time Open In Second',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TimeOpen {
  final String? notif;
  final int range;
  final charts.Color color;

  TimeOpen(this.notif, this.range, this.color);
}
