import "package:flutter/material.dart";
import "page10.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Tiger',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/Tiger.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: India, Southeast Asia, and the Russian Far East.\n\n'
              'Characteristics: The largest wild cat; features prominently in mythology and sport logos.\n\n'
              'Threats: Poaching for skins and traditional medicine; loss of prey; human-wildlife conflict.\n\n'
              'Status: Endangered (only about 4,500 remain in the wild).',
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
                  RealisticPageTurnRoute(page: Page10(), isForward: false)),
            ),
          ],
        ),
      ),
    );
  }
}
