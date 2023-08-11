import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_take_app/PageMovie/splashScreen.dart';

class LandingPG extends StatelessWidget {

   Widget BtnLanding(String text, String colorCodeTxt, String colorCodeBtn, double radius, double widthBorder, double marginTop, double marginBottom, context) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: marginTop, bottom: marginBottom),
      child: ElevatedButton(
      onPressed: () {
         Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen()),
            );
      },
      child: TextLanding(text, 16, FontWeight.w600, colorCodeTxt),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(int.parse('0x$colorCodeBtn')),
        minimumSize: Size(400, 49),
        side: BorderSide(width: widthBorder, color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      ),
    )
    );
  }

  Widget TextLanding(String text, double fontSize, FontWeight fontWeight, String colorCodeTxt){
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: "Roboto",
          fontWeight: fontWeight,
          color: Color(int.parse("0x$colorCodeTxt"))
        )
        );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              'assets/img/Ic_App.svg', 
              width: 92.86, 
              height: 100,
              ),
              Container(
                margin: EdgeInsets.only(left: 40.15, top: 40.15, right: 40.15, bottom: 0),
                child: TextLanding("Get Movie Info Easily with App", 32, FontWeight.w700, "FF000000"),
              ),
              Container(
                margin: EdgeInsets.only(left: 40.15, top: 15.85, right: 40.15, bottom: 95),
                child: TextLanding("Efficient Movie Information App Solution", 20, FontWeight.w500, "FF2C2C2C"),
              ),
              BtnLanding("Sign Up with Email ID", "FFFFFFFF", "ff2C2C2C", 5.0, 0, 0, 20, context),
              BtnLanding("Sign Up with Google", "ff2C2C2C", "FFFFFFFF", 5.0, 1, 0, 20, context),
              TextLanding("Already have an account? Sign In", 16, FontWeight.w400, "FF000000")
          ],
        ),
      )
    );
  }
}