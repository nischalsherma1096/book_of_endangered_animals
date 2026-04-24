import "package:flutter/material.dart";
import "page1.dart";
import "page3.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Black Rhino',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/BlackRhino.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Eastern and Southern Africa (Namibia, Kenya, South Africa).\n\n'
              'Characteristics: Known for aggressive temperament and distinctive hooked upper lip; frequent focus of anti-poaching news.\n\n'
              'Threats: Intense poaching for horns (used in traditional Asian medicine and as status symbols).\n\n'
              'Status: Critically Endangered (populations have tripled since 1990s but remain low).',
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
                  RealisticPageTurnRoute(page: Page1(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page3(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
