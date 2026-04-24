import 'dart:math' as math;
import 'package:flutter/material.dart';

class RealisticPageTurnRoute extends PageRouteBuilder {
  final Widget page;
  final bool isForward;

  RealisticPageTurnRoute({required this.page, required this.isForward})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return _BookPageTurnTransition(
              animation: animation,
              isForward: isForward,
              child: child,
            );
          },
        );
}

class _BookPageTurnTransition extends StatelessWidget {
  final Animation<double> animation;
  final bool isForward;
  final Widget child;

  const _BookPageTurnTransition({
    required this.animation,
    required this.isForward,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final t = Curves.easeInOut.transform(animation.value);
        final angle = isForward
            ? (1 - t) * -math.pi / 2 // right page flips left
            : (1 - t) * math.pi / 2; // left page flips right

        final alignment =
            isForward ? Alignment.centerLeft : Alignment.centerRight;

        // Shadow intensity grows during the turn
        final shadowOpacity = math.sin(t * math.pi) * 0.5;

        return Stack(
          children: [
            // ── Shadow cast on the page beneath ──
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: isForward
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    end: isForward
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    colors: [
                      Colors.black.withOpacity(shadowOpacity),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // ── Turning page ──
            Transform(
              alignment: alignment,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0015) // perspective
                ..rotateY(angle),
              child: Stack(
                children: [
                  child,

                  // ── Page curl shadow on the turning page ──
                  Positioned.fill(
                    child: IgnorePointer(
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (_, __) {
                          final curl = math.sin(t * math.pi);
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: isForward
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                end: isForward
                                    ? Alignment.centerLeft
                                    : Alignment.centerRight,
                                colors: [
                                  Colors.black.withOpacity(curl * 0.35),
                                  Colors.white.withOpacity(curl * 0.08),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.15, 0.5],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
