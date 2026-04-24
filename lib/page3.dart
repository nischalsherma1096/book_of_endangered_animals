import "package:flutter/material.dart";
import "page2.dart";
import "page4.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Blue Whale',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/BlueWhale.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: All oceans except the Arctic.\n\n'
              'Characteristics: The largest animal ever known to exist (up to 100 feet long).\n\n'
              'Threats: Historic commercial whaling; modern threats include ship strikes, ocean noise, and climate change.\n\n'
              'Status: Endangered.',
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
                  RealisticPageTurnRoute(page: Page2(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page4(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
