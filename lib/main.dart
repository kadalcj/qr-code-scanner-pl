//Package
import 'package:flutter/material.dart';

//Self Import
import 'package:qr_code_scanner_pl/ui/landing_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}
