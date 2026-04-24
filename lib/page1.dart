import "package:flutter/material.dart";
import "page2.dart";
import "page_transition.dart";

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("African Elephant")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/AfricanElephant.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Sub-Saharan Africa.\n\n'
              'Characteristics: The largest land animal; known for high intelligence, memory, and complex social groups.\n\n'
              'Threats: Poaching for ivory tusks; habitat destruction for agriculture.\n\n'
              'Status: Endangered (forest elephants are critically endangered).',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page2(), isForward: true),
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
