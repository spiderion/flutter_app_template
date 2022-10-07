import 'dart:math';

import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  final Color color;
  final double? sizeRadius;

  Loader({this.color = Colors.white, this.sizeRadius});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> animationRadiusIn;
  late Animation<double> animationRadiusOut;
  double radius = 0.0;
  double? internalDotRadius = 0.0;
  double externalDotRadius = 0.0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    internalDotRadius = widget.sizeRadius != null ? widget.sizeRadius : 30;
    externalDotRadius = internalDotRadius! / 5;
    controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    animationRotation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animationRadiusIn = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animationRadiusOut = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value < 1.0) {
          radius = animationRadiusIn.value * internalDotRadius!;
        } else if ((controller.value >= 0.0 && controller.value < 0.25)) {
          radius = animationRadiusOut.value * internalDotRadius!;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: internalDotRadius! * 3,
      height: internalDotRadius! * 3,
      child: Center(
        child: RotationTransition(
          turns: animationRotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: internalDotRadius,
                color: widget.color,
              ),
              Transform.translate(
                  offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
              Transform.translate(
                  offset: Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                  child: Dot(
                    radius: externalDotRadius,
                    color: widget.color,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}
