import "package:flutter/material.dart";
import "page6.dart";
import "page8.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Mountain Gorilla',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/MountainGorilla.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Virunga Mountains (Rwanda, Uganda, DRC).\n\n'
              'Characteristics: Shares 98% of human DNA, making them highly relatable.\n\n'
              'Threats: Civil wars, poaching, habitat loss, and disease transmission from humans.\n\n'
              'Status: Endangered (populations are slowly increasing due to intensive protection).',
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
                  RealisticPageTurnRoute(page: Page6(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page8(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
