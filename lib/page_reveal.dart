import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutri_quest/page_dragger.dart';
import 'package:nutri_quest/pager_indicator.dart';

class PageReveal extends StatelessWidget {

  final double revealPercent;
  final Widget child;
  final direction;
  PageReveal({
    this.direction,
    this.revealPercent,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new ClipRect(
      clipper: new CircleRevealClipper(revealPercent, direction),
      child: child,
    );
  }
}

class CircleRevealClipper extends CustomClipper<Rect> {

  final double revealPercent;
  final SlideDirection direction;
  CircleRevealClipper(
    this.revealPercent,
      this.direction
  );

  @override
  Rect getClip(Size size) {
    double start = 0.0;
    direction == SlideDirection.leftToRight ? start = 0.0 : start = size.width;
    final epicenter = new Offset(start, 0.0 );

    // Calculate distance from epicenter to the top left corner to make sure we fill the screen.
    double theta = atan(epicenter.dy / epicenter.dx);
    final distanceToCorner = epicenter.dy / sin(theta);

    final radius = size.width * revealPercent;
    final diameter = 2 * radius;
    //final so = new Rect.fromLTWH(left, top, width, height)
    return new Rect.fromLTWH(epicenter.dx - radius, epicenter.dy-radius, diameter, size.height * 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }

}