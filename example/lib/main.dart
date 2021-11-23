import 'dart:math';

import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<DateTime, int> _input = {};

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var random = Random();
    for (int i = 0; i < 365; i++) {
      _input[TimeUtils.removeTime(now.subtract(Duration(days: i)))] = random.nextInt(50);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: HeatMapCalendar(
                input: _input,
                colorThresholds: {1: Colors.green[100]!, 10: Colors.green[300]!, 30: Colors.green[500]!},
                weekDaysLabels: ['', '1', '', '3', '', '5', ''],
                monthsLabels: [
                  "",
                  "1月",
                  "2月",
                  "3月",
                  "4月",
                  "5月",
                  "6月",
                  "7月",
                  "8月",
                  "9月",
                  "10月",
                  "11月",
                  "12月",
                ],
                squareSize: 15.0,
                textOpacity: 0.3,
                labelTextColor: Colors.blueGrey,
                dayTextColor: Colors.blue[500]!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
