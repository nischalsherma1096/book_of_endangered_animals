import 'package:flutter/material.dart';

class RealisticPageTurnRoute extends PageRouteBuilder {
  final Widget page;
  final bool isForward;

  RealisticPageTurnRoute({required this.page, required this.isForward})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (isForward) {
              return Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY((1 - animation.value) * -0.8),
                child: child,
              );
            } else {
              return Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY((1 - animation.value) * 0.8),
                child: child,
              );
            }
          },
        );
}
