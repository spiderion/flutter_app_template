import 'package:flutter/material.dart';

class RoundProgressBar extends StatelessWidget {
  final double max;
  final double current;
  final Color color;
  final Color? backgroundColor;

  const RoundProgressBar(
      {Key? key,
      required this.max,
      required this.current,
      this.color = Colors.grey,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(35);
    final barHeight = 12.0;
    final borderRadius = BorderRadius.only(topRight: radius, bottomRight: radius);
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (current / max) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: barHeight,
              decoration: BoxDecoration(
                  color: backgroundColor ?? Colors.transparent, borderRadius: borderRadius),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: percent,
              height: barHeight,
              decoration: BoxDecoration(color: color, borderRadius: borderRadius),
            ),
          ],
        );
      },
    );
  }
}
