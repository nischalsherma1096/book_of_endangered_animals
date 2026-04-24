import "package:flutter/material.dart";
import "page2.dart";
import "page4.dart";
import "page_transition.dart";

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Blue Whale")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/BlueWhale.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: All oceans except the Arctic.\n\n'
              'Characteristics: The largest animal ever known to exist (up to 100 feet long).\n\n'
              'Threats: Historic commercial whaling; modern threats include ship strikes, ocean noise, and climate change.\n\n'
              'Status: Endangered.',
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
                      RealisticPageTurnRoute(page: Page2(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page4(), isForward: true),
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
