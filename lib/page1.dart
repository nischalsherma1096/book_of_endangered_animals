import "package:flutter/material.dart";
import "page2.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'African Elephant',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/AfricanElephant.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Sub-Saharan Africa.\n\n'
              'Characteristics: The largest land animal; known for high intelligence, memory, and complex social groups.\n\n'
              'Threats: Poaching for ivory tusks; habitat destruction for agriculture.\n\n'
              'Status: Endangered (forest elephants are critically endangered).',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 15,
                  color: kInkBrown,
                  height: 1.7,
                  fontFamily: 'serif'),
            ),
            const SizedBox(height: 16),
            BookNavButtons(
              onNext: () => Navigator.pushReplacement(
                context,
                RealisticPageTurnRoute(page: Page2(), isForward: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
