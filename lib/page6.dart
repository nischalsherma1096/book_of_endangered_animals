import "package:flutter/material.dart";
import "page5.dart";
import "page7.dart";
import "page_transition.dart";

class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leather Back Sea Turtle")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/LeatherBackSeaTurtle.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Tropical and subtropical oceans (nest on tropical beaches).\n\n'
              'Characteristics: The largest sea turtle; unique leathery shell (not hard).\n\n'
              'Threats: Egg collection, entanglement in fishing gear, plastic ingestion (they mistake bags for jellyfish), and coastal development.\n\n'
              'Status: Vulnerable (some subpopulations are critically endangered).',
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
                      RealisticPageTurnRoute(page: Page5(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page7(), isForward: true),
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
