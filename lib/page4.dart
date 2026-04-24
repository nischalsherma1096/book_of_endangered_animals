import "package:flutter/material.dart";
import "page3.dart";
import "page5.dart";
import "page_transition.dart";
import "book_theme.dart";

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Cheetah',
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset("assets/images/Cheetah.jpeg",
                  height: 200, fit: BoxFit.cover),
            ),
            const SizedBox(height: 20),
            const Text(
              'Where found: Africa (mainly Namibia, Botswana, Kenya) and a tiny population in Iran.\n\n'
              'Characteristics: Fastest land animal (0 to 60 mph in 3 seconds); sleek, spotted coat.\n\n'
              'Threats: Habitat loss, human-wildlife conflict (farmers kill them to protect livestock), and low genetic diversity.\n\n'
              'Status: Vulnerable.',
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
                  RealisticPageTurnRoute(page: Page3(), isForward: false)),
              onNext: () => Navigator.pushReplacement(context,
                  RealisticPageTurnRoute(page: Page5(), isForward: true)),
            ),
          ],
        ),
      ),
    );
  }
}
