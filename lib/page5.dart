import "package:flutter/material.dart";
import "page4.dart";
import "page6.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Giant Panda',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/GiantPanda.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Bamboo forests of southwestern China.\n\n'
              'Characteristics: The global logo of the World Wildlife Fund (WWF) and a symbol of conservation success.\n\n'
              'Threats: Habitat loss due to farming and development; historically low birth rates.\n\n'
              'Status: Vulnerable (upgraded from endangered due to successful breeding programs).',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 15,
                  color: kInkBrown,
                  height: 1.7,
                  fontFamily: 'serif'),
            ),
            const SizedBox(height: 16),
            BookNavButtons(
              onPrevious: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page4(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page6(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
