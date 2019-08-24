//Package
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePageChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner PL',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String result = 'Please Scan to Get the Code';
  String qrcode;
  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: WillPopScope(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 300),
                  child: Text(
                    result,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                RaisedButton(
                  child: Text('Scan'),
                  onPressed: () async {
                    qrcode = await FlutterBarcodeScanner.scanBarcode(
                        '#FFF123', 'Cancel', true);
                    setState(() {
                      result = qrcode;
                      Fluttertoast.showToast(msg: 'Scanning Complete');
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        onWillPop: _onWillPop,
      ),
    );
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press Back Again to Close the App');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
