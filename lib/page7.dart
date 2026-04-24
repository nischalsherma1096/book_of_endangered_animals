import "package:flutter/material.dart";
import "page6.dart";
import "page8.dart";
import "page_transition.dart";

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mountain Gorilla")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/MountainGorilla.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Virunga Mountains (Rwanda, Uganda, DRC).\n\n'
              'Characteristics: Shares 98% of human DNA, making them highly relatable.\n\n'
              'Threats: Civil wars, poaching, habitat loss, and disease transmission from humans.\n\n'
              'Status: Endangered (populations are slowly increasing due to intensive protection).',
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
                      RealisticPageTurnRoute(page: Page6(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page8(), isForward: true),
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
