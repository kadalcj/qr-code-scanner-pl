//Package
import 'package:flutter/material.dart';

//Self Import
import 'package:qr_code_scanner_pl/ui/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blueGrey[900]),
                      child: FlutterLogo(
                        colors: Colors.grey,
                        size: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 80.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'QR Code Scanner PL',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: RaisedButton(
                      color: Colors.grey,
                      child: Text('Get Started'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageChange(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
