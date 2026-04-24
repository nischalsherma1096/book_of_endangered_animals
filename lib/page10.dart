import "package:flutter/material.dart";
import "page9.dart";
import "page11.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Red Panda',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/RedPanda.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Eastern Himalayas and southwestern China (Nepal, Bhutan, northern Myanmar).\n\n'
              'Characteristics: Extremely cute, reddish-brown fur, and a bushy ringed tail; often called the "lesser panda" or "firefox" (inspiration for the Firefox browser logo).\n\n'
              'Threats: Deforestation for timber, agriculture, and livestock grazing; poaching for fur and illegal pet trade; fragmentation of bamboo forests (their primary food source).\n\n'
              'Status: Endangered (wild population estimated below 10,000 adults).',
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
                  RealisticPageTurnRoute(page: Page9(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page11(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
