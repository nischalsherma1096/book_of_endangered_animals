import "package:flutter/material.dart";
import "page10.dart";
import "page_transition.dart";

class Page11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tiger")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Tiger.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: India, Southeast Asia, and the Russian Far East.\n\n'
              'Characteristics: The largest wild cat; features prominently in mythology and sport logos.\n\n'
              'Threats: Poaching for skins and traditional medicine; loss of prey; human-wildlife conflict.\n\n'
              'Status: Endangered (only about 4,500 remain in the wild).',
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
                      RealisticPageTurnRoute(page: Page10(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
