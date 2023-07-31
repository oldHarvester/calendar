import 'package:flutter/material.dart';

class Sizer {
  final BuildContext context;
  final double widthViewport;
  final double heightViewport;

  const Sizer(
    this.context, {
    this.widthViewport = 375,
    this.heightViewport = 825,
  });

  double width() {
    return MediaQuery.of(context).size.width;
  }

  double height() {
    return MediaQuery.of(context).size.height;
  }

  double vw(double value) {
    return value * (1 / widthViewport * width());
  }

  double vh(double value) {
    return value * (1 / heightViewport * height());
  }
}
