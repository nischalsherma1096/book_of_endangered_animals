import "package:flutter/material.dart";
import "page8.dart";
import "page10.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Polar Bear',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/PolarBear.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Arctic Circle (Alaska, Canada, Russia, Greenland, Norway).\n\n'
              'Characteristics: The "poster child" for climate change; iconic white fur and powerful build.\n\n'
              'Threats: Melting sea ice due to global warming (reduces their hunting grounds for seals).\n\n'
              'Status: Vulnerable (considered endangered in the U.S. under the ESA).',
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
                  RealisticPageTurnRoute(page: Page8(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page10(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
