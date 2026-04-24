import "package:flutter/material.dart";
import "page7.dart";
import "page9.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Orangutan',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/Orangutan.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Rainforests of Borneo and Sumatra.\n\n'
              'Characteristics: Highly intelligent (use tools) and human-like behavior.\n\n'
              'Threats: Deforestation for palm oil plantations, logging, and fires.\n\n'
              'Status: Critically Endangered.',
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
                  RealisticPageTurnRoute(page: Page7(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page9(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
