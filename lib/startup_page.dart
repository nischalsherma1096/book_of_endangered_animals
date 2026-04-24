import "dart:math" as math;
import "package:flutter/material.dart";
import "package:audioplayers/audioplayers.dart";

class StartupPage extends StatefulWidget {
  final Widget nextPage;

  const StartupPage({super.key, required this.nextPage});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage>
    with TickerProviderStateMixin {
  late AnimationController _sweepController;
  late Animation<double> _sweepAnimation;

  late AnimationController _logoController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoFadeAnimation;
  late Animation<double> _logoRotationAnimation;

  late AnimationController _textController;
  late Animation<double> _textFadeAnimation;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _sweepController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _sweepAnimation = CurvedAnimation(
      parent: _sweepController,
      curve: Curves.easeInOut,
    );

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    _logoFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _logoRotationAnimation = Tween<double>(begin: -0.5, end: 0.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOut),
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeIn),
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.06).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _audioPlayer.setReleaseMode(ReleaseMode.stop);
      await _audioPlayer.setVolume(1.0);
      _startSequence();
    });
  }

  Future<void> _startSequence() async {
    try {
      await _audioPlayer.setSource(AssetSource('sounds/intro.mp3'));
      await _audioPlayer.resume();
    } catch (e) {
      debugPrint('Sound error: $e');
    }

    await Future.delayed(const Duration(milliseconds: 300));
    await _sweepController.forward();

    await Future.delayed(const Duration(milliseconds: 100));
    await _logoController.forward();

    await Future.delayed(const Duration(milliseconds: 200));
    await _textController.forward();

    await Future.delayed(const Duration(milliseconds: 1800));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => widget.nextPage,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _sweepController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _pulseController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000000),
              Color(0xFF0A1A0A),
              Color(0xFF0D2B0D),
              Color(0xFF0F3B0F),
            ],
            stops: [0.0, 0.3, 0.65, 1.0],
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: ForestParticlePainter(),
              ),
            ),

            // Circle + text are now drawn together in ONE CustomPaint
            Center(
              child: AnimatedBuilder(
                animation: Listenable.merge([
                  _sweepAnimation,
                  _logoController,
                  _pulseAnimation,
                  _textController,
                ]),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _pulseAnimation.value,
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: CustomPaint(
                        painter: CircleWithTextPainter(
                          sweepProgress: _sweepAnimation.value,
                          textProgress: _textFadeAnimation.value,
                          text: 'ENDANGERED ANIMALS',
                        ),
                        child: Center(
                          child: FadeTransition(
                            opacity: _logoFadeAnimation,
                            child: Transform.rotate(
                              angle: _logoRotationAnimation.value * 2 * math.pi,
                              child: Transform.scale(
                                scale: _logoScaleAnimation.value,
                                child: _buildLogo(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4CAF50).withOpacity(0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: 110,
          height: 110,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────
// Painter: Circle arc + "ANIMAL KINGDOM" curved around the bottom arc
// ─────────────────────────────────────────────────────────────────────
class CircleWithTextPainter extends CustomPainter {
  final double sweepProgress;
  final double textProgress;
  final String text;

  CircleWithTextPainter({
    required this.sweepProgress,
    required this.textProgress,
    required this.text,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final circleRadius = size.width / 2 - 30;

    // ── Background dim ring ──
    final bgPaint = Paint()
      ..color = Colors.white.withOpacity(0.06)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;
    canvas.drawCircle(center, circleRadius, bgPaint);

    // ── Glowing sweep arc ──
    if (sweepProgress > 0) {
      final sweepPaint = Paint()
        ..shader = SweepGradient(
          colors: [
            const Color(0xFFFFD700),
            const Color(0xFF90EE90),
            const Color(0xFFFFD700),
          ],
          stops: const [0.0, 0.5, 1.0],
          startAngle: -math.pi / 2,
          endAngle: -math.pi / 2 + 2 * math.pi * sweepProgress,
        ).createShader(Rect.fromCircle(center: center, radius: circleRadius))
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: circleRadius),
        -math.pi / 2,
        2 * math.pi * sweepProgress,
        false,
        sweepPaint,
      );

      if (sweepProgress < 1.0) {
        final tipAngle = -math.pi / 2 + 2 * math.pi * sweepProgress;
        final tipX = center.dx + circleRadius * math.cos(tipAngle);
        final tipY = center.dy + circleRadius * math.sin(tipAngle);
        final dotPaint = Paint()
          ..color = const Color(0xFFFFD700)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
        canvas.drawCircle(Offset(tipX, tipY), 5, dotPaint);
      }
    }

    // ── Inner circle fill ──
    final fillPaint = Paint()
      ..color = const Color(0xFF0A1A0A).withOpacity(0.85)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, circleRadius - 2, fillPaint);

    // ── Inner glow rim ──
    final rimPaint = Paint()
      ..color = const Color(0xFF2E7D32).withOpacity(0.4 * sweepProgress)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawCircle(center, circleRadius - 10, rimPaint);

    // ── "ANIMAL KINGDOM" curved around the BOTTOM of the circle ──
    if (textProgress > 0) {
      // Text radius slightly outside the circle ring
      final textRadius = circleRadius + 18;

      // Start from bottom-left, sweep across the bottom to bottom-right
      // math.pi * 0.2 to math.pi * 0.8 covers the bottom half nicely
      const startAngle = math.pi * 0.73;
      const totalAngle = math.pi * 1.56;
      final angleStep = totalAngle / (text.length - 1);
      final visibleCount = (text.length * textProgress).round();

      for (int i = 0; i < visibleCount; i++) {
        final char = text[i];
        final angle = startAngle + i * angleStep;

        canvas.save();
        canvas.translate(
          center.dx + textRadius * math.cos(angle),
          center.dy + textRadius * math.sin(angle),
        );
        // Each letter faces outward along the arc
        canvas.rotate(angle + math.pi / 2);

        final textPainter = TextPainter(
          text: TextSpan(
            text: char,
            style: TextStyle(
              fontSize: char == ' ' ? 6 : 13,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFFD700).withOpacity(textProgress),
              letterSpacing: 1.2,
              shadows: [
                Shadow(
                  color: const Color(0xFFFFD700).withOpacity(0.6),
                  blurRadius: 8,
                ),
              ],
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(-textPainter.width / 2, -textPainter.height / 2),
        );

        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(CircleWithTextPainter old) =>
      old.sweepProgress != sweepProgress || old.textProgress != textProgress;
}

// ─────────────────────────────────────────────────────
// Painter: Subtle background forest particles / dots
// ─────────────────────────────────────────────────────
class ForestParticlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final dots = [
      [0.1, 0.15, 1.5, 0.08],
      [0.85, 0.1, 2.0, 0.06],
      [0.05, 0.6, 1.2, 0.07],
      [0.92, 0.55, 1.8, 0.09],
      [0.2, 0.88, 1.5, 0.06],
      [0.75, 0.85, 2.0, 0.07],
      [0.5, 0.05, 1.0, 0.05],
      [0.3, 0.3, 1.2, 0.04],
      [0.7, 0.4, 1.5, 0.05],
      [0.15, 0.45, 1.0, 0.04],
      [0.88, 0.75, 1.3, 0.06],
    ];

    for (final d in dots) {
      paint.color = const Color(0xFF4CAF50).withOpacity(d[3]);
      canvas.drawCircle(
        Offset(size.width * d[0], size.height * d[1]),
        d[2],
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
