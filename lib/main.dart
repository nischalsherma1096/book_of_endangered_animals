import "package:flutter/material.dart";
import "page1.dart";
import "startup_page.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Endangered Animals",
      debugShowCheckedModeBanner: false,
      home: StartupPage(nextPage: Page1()), // Changed this line
    );
  }
}
