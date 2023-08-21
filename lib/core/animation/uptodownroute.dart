import 'package:flutter/material.dart';

class UpToDown extends PageRouteBuilder {
  final Page;
  UpToDown({this.Page})
      : super(
            pageBuilder: (context, animation, animationTwo) => Page,
            transitionsBuilder: (context, animation, animationTwo, child) {
              Offset begin = Offset(1.0, 0.0);
              Offset end = Offset.zero;

              Tween<Offset> tween = Tween(begin: begin, end: end);
              var offsetAnimation =animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child
              );
            });
}