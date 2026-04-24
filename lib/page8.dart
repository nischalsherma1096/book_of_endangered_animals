import "package:flutter/material.dart";
import "page7.dart";
import "page9.dart";
import "page_transition.dart";

class Page8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orangutan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Orangutan.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Rainforests of Borneo and Sumatra.\n\n'
              'Characteristics: Highly intelligent (use tools) and human-like behavior.\n\n'
              'Threats: Deforestation for palm oil plantations, logging, and fires.\n\n'
              'Status: Critically Endangered.',
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
                      RealisticPageTurnRoute(page: Page7(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page9(), isForward: true),
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
