import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:podboi/views/new_landing_screen_view.dart';
// import 'package:podboi/views/subscriptions_page_view.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TO DO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return ScreenOne();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 25.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/logoPodboi.png',
                  fit: BoxFit.contain,
                  colorBlendMode: BlendMode.color,
                ),
              ),
              Container(
                width: 300,
                child: Center(
                  child: Text(
                    "PodBoi",
                    style: GoogleFonts.monoton(
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 4.0,
                width: 100.0,
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
