import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class HeatMapDay extends StatelessWidget {
  final int? value;
  final double? size;
  final Map<int, Color?>? thresholds;
  final Color defaultColor;
  final DateTime? currentDay;
  final double opacity;
  final Duration animationDuration;
  final Color textColor;
  final FontWeight? fontWeight;

  const HeatMapDay(
      {Key? key,
      this.value,
      this.size,
      this.thresholds,
      this.defaultColor: Colors.black12,
      this.currentDay,
      this.opacity: 0.3,
      this.animationDuration: const Duration(milliseconds: 300),
      this.textColor: Colors.black,
      this.fontWeight})
      : super(key: key);

  /// Loop for getting the right color based on [thresholds] values
  ///
  /// If the [value] is greater than or equal one of [thresholds]' key,
  /// it will receive its value
  Color? getColorFromThreshold() {
    Color? color = defaultColor;
    if (value != null) {
      thresholds!.forEach((mapKey, mapColor) {
        if (value! >= mapKey) {
          color = mapColor;
        }
      });
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "$value次测试，在${formatDate(currentDay!, [yyyy, "/", mm, "/", dd])}",
      child: Container(
        alignment: Alignment.center,
        height: size,
        width: size,
        color: getColorFromThreshold(),
        margin: EdgeInsets.all(2.0),
        child: AnimatedOpacity(
          opacity: opacity,
          duration: animationDuration,
        ),
      ),
    );
  }
}
