import 'package:flutter/material.dart';

// ── Parchment Colors ──
const Color kParchment = Color(0xFFF5E6C8);
const Color kParchmentDark = Color(0xFFE8D5A3);
const Color kParchmentEdge = Color(0xFFB8860B);
const Color kInkBrown = Color(0xFF3B1F0A);
const Color kInkDark = Color(0xFF2C1A00);
const Color kRuledLine = Color(0xFFD4B896);

// ── Book Page Scaffold ──
class BookPage extends StatelessWidget {
  final String title;
  final Widget child;

  const BookPage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kParchmentDark,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kParchment,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.45),
                blurRadius: 18,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(-2, 2),
              ),
            ],
            // Parchment texture via gradient
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFFAEED5),
                Color(0xFFF0D9A8),
                Color(0xFFEBCF95),
                Color(0xFFF2DDB0),
              ],
              stops: [0.0, 0.4, 0.7, 1.0],
            ),
          ),
          child: Column(
            children: [
              // ── Decorative title area ──
              _BookTitleBar(title: title),

              // ── Horizontal ruled line ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        kParchmentEdge.withOpacity(0.2),
                        kParchmentEdge,
                        kParchmentEdge.withOpacity(0.2),
                      ],
                    ),
                  ),
                ),
              ),

              // ── Page content ──
              Expanded(child: child),

              // ── Bottom decorative line ──
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 1,
                  color: kRuledLine,
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookTitleBar extends StatelessWidget {
  final String title;
  const _BookTitleBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
      child: Column(
        children: [
          // Top ornamental row
          Row(
            children: [
              _OrnamentLine(),
              const SizedBox(width: 8),
              const Text('✦',
                  style: TextStyle(color: kParchmentEdge, fontSize: 12)),
              const SizedBox(width: 8),
              _OrnamentLine(),
            ],
          ),
          const SizedBox(height: 6),
          // Title text
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'serif',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kInkDark,
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  color: Color(0x55000000),
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          // Bottom ornamental row
          Row(
            children: [
              _OrnamentLine(),
              const SizedBox(width: 8),
              const Text('✦',
                  style: TextStyle(color: kParchmentEdge, fontSize: 12)),
              const SizedBox(width: 8),
              _OrnamentLine(),
            ],
          ),
        ],
      ),
    );
  }
}

class _OrnamentLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kParchmentEdge.withOpacity(0.1),
              kParchmentEdge,
              kParchmentEdge.withOpacity(0.1),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Navigation Buttons ──
class BookNavButtons extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const BookNavButtons({super.key, this.onPrevious, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onPrevious != null)
            _NavButton(label: '◀  Previous', onTap: onPrevious!)
          else
            const SizedBox(),
          if (onNext != null)
            _NavButton(label: 'Next  ▶', onTap: onNext!)
          else
            const SizedBox(),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: kInkBrown.withOpacity(0.08),
          border: Border.all(color: kParchmentEdge.withOpacity(0.7), width: 1),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: kInkDark,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
