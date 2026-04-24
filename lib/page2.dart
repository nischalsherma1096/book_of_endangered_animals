import "package:flutter/material.dart";
import "page1.dart";
import "page3.dart";
import "page_transition.dart";

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Black Rhino")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/BlackRhino.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Eastern and Southern Africa (Namibia, Kenya, South Africa).\n\n'
              'Characteristics: Known for aggressive temperament and distinctive hooked upper lip; frequent focus of anti-poaching news.\n\n'
              'Threats: Intense poaching for horns (used in traditional Asian medicine and as status symbols).\n\n'
              'Status: Critically Endangered (populations have tripled since 1990s but remain low).',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page1(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page3(), isForward: true),
                    );
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
