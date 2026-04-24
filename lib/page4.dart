import "package:flutter/material.dart";
import "page3.dart";
import "page5.dart";
import "page_transition.dart";

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cheetah")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Cheetah.jpeg", height: 200),
            SizedBox(height: 30),
            Text(
              'Where found: Africa (mainly Namibia, Botswana, Kenya) and a tiny population in Iran.\n\n'
              'Characteristics: Fastest land animal (0 to 60 mph in 3 seconds); sleek, spotted coat.\n\n'
              'Threats: Habitat loss, human-wildlife conflict (farmers kill them to protect livestock), and low genetic diversity.\n\n'
              'Status: Vulnerable.',
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
                      RealisticPageTurnRoute(page: Page3(), isForward: false),
                    );
                  },
                  child: Text("Previous"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      RealisticPageTurnRoute(page: Page5(), isForward: true),
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
