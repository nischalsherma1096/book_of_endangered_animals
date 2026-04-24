import "package:flutter/material.dart";
import "page8.dart";
import "page10.dart";
import "page_transition.dart";

class Page9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Polar Bear")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/PolarBear.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Arctic Circle (Alaska, Canada, Russia, Greenland, Norway).\n\n'
              'Characteristics: The "poster child" for climate change; iconic white fur and powerful build.\n\n'
              'Threats: Melting sea ice due to global warming (reduces their hunting grounds for seals).\n\n'
              'Status: Vulnerable (considered endangered in the U.S. under the ESA).',
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
                      RealisticPageTurnRoute(page: Page8(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page10(), isForward: true),
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
