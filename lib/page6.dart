import "package:flutter/material.dart";
import "page5.dart";
import "page7.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Leatherback Sea Turtle',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/LeatherBackSeaTurtle.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Tropical and subtropical oceans (nest on tropical beaches).\n\n'
              'Characteristics: The largest sea turtle; unique leathery shell (not hard).\n\n'
              'Threats: Egg collection, entanglement in fishing gear, plastic ingestion (they mistake bags for jellyfish), and coastal development.\n\n'
              'Status: Vulnerable (some subpopulations are critically endangered).',
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
                  RealisticPageTurnRoute(page: Page5(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page7(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
