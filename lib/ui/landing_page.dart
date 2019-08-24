//Package
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_pl/ui/home_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[400],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: FlutterLogo(
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
                    style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: RaisedButton(
                      child: Text('Get Started'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePageChange()));
                        // print('Button Pressed');
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
