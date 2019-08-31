//Package
import 'dart:async';
import 'dart:convert';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

//Model
// import 'package:qr_code_scanner_pl/ui/model/ticket.dart';

class HomePageChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner PL',
      theme: ThemeData(primarySwatch: Colors.grey),
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
  int statusCode;
  DateTime currentBackPressTime;

  final String url = '/';
  List data;

  postTicket(qrcode) async {
    http.Response response = await http.post(
      Uri.encodeFull(url),
      headers: {
        'accept': 'appplication/json',
        'content-type': 'application/x-www-form-urlencoded'
      },
      body: jsonEncode({'qr_strings': qrcode}),
    );

    if (response.statusCode == 200) {
      // Fluttertoast.showToast(msg: 'Success!');
      print('Step 1');
    } else if (response.statusCode == 404) {
      // Fluttertoast.showToast(msg: 'Post Failed!');
      print('Step2');
    } else {
      print('Step3');
    }
  }

  // Future<Ticket> getTicket() async {
  //   http.Response response = await http
  //       .get(Uri.encodeFull(url), headers: {'accept': 'applications/json'});
  //   print(json.decode(response.body));
  //   print('Testing');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: WillPopScope(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Scan the Code',
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
                SizedBox(
                  child: Container(
                    width: 100,
                    height: 10,
                  ),
                ),
                Text(
                  result,
                  style: TextStyle(
                      fontSize: 35,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                )
              ],
            ),
          ),
        ),
        onWillPop: _onWillPop,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          MdiIcons.qrcodeScan,
          color: Colors.black,
        ),
        onPressed: () async {
          // getTicket();
          qrcode =
              await FlutterBarcodeScanner.scanBarcode('#FF263238', '', true);

          if (qrcode != '') {
            print('QR Code In');
            postTicket(qrcode);
          } else {
            Fluttertoast.showToast(msg: 'Please Try Again!');
          }
        },
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
