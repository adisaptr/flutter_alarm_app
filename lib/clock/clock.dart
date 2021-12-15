import 'package:flutter/material.dart';

import 'hour_hand.dart';
import 'minute_hand.dart';
import 'wheel_circle_painter.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin {
  double wheelSize = 300;
  final double longNeedleHeight = 40;
  final double shortNeedleHeight = 25;

  @override
  Widget build(BuildContext context) {
    WheelCircle wheelCircle = WheelCircle(
        wheelSize: wheelSize,
        longNeedleHeight: longNeedleHeight,
        shortNeedleHeight: shortNeedleHeight,
        context: context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: wheelSize,
              height: wheelSize,
              child: Container(
                  color: Colors.transparent,
                  child: Center(child: CustomPaint(painter: wheelCircle))),
            ),
            Container(
              width: wheelSize,
              height: wheelSize,
              color: Colors.transparent,
              child: Center(
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      color: Color(0xff65D1BA),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            MinuteHand(),
            HourHand(),
          ],
        )
      ],
    );
  }
}
