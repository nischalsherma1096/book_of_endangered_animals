import "package:flutter/material.dart";
import "page4.dart";
import "page6.dart";
import "page_transition.dart";

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giant Panda")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/GiantPanda.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Bamboo forests of southwestern China.\n\n'
              'Characteristics: The global logo of the World Wildlife Fund (WWF) and a symbol of conservation success.\n\n'
              'Threats: Habitat loss due to farming and development; historically low birth rates.\n\n'
              'Status: Vulnerable (upgraded from endangered due to successful breeding programs).',
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
                      RealisticPageTurnRoute(page: Page4(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page6(), isForward: true),
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
