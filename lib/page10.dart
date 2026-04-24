import "package:flutter/material.dart";
import "page9.dart";
import "page11.dart";
import "page_transition.dart";

class Page10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Red Panda")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/RedPanda.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Eastern Himalayas and southwestern China (Nepal, Bhutan, northern Myanmar).\n\n'
              'Characteristics: Extremely cute, reddish-brown fur, and a bushy ringed tail; often called the "lesser panda" or "firefox" (inspiration for the Firefox browser logo).\n\n'
              'Threats: Deforestation for timber, agriculture, and livestock grazing; poaching for fur and illegal pet trade; fragmentation of bamboo forests (their primary food source).\n\n'
              'Status: Endangered (wild population estimated below 10,000 adults).',
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
                      RealisticPageTurnRoute(page: Page9(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page11(), isForward: true),
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
