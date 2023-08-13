import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_take/Page/SignInPage.dart';
import 'package:one_take/Page/SplashScreen.dart';

class LandingPage extends StatelessWidget {

  Widget BtnLanding(String colorCodeBtn, double radius, double widthBorder, Widget textWidget, double left, double right, context) 
  {
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
      },
      child: textWidget, 
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(left: left, right: right, top: 12, bottom: 12),
        backgroundColor: Color(int.parse('0xff$colorCodeBtn')),
        side: BorderSide(width: widthBorder, color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),

        )),
      );
  }

  Widget TextLanding(String text, String colorCodeTxt, double fontSize, FontWeight fontWeight, TextAlign textAlign){
    return Text(
      text,
      style: TextStyle(
        color: Color(int.parse('0xff$colorCodeTxt')),
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: fontWeight,
        ),
        textAlign: textAlign,
    );
  }

  Widget WGT_TextSpan(String text1, String text2, String colorCodeTxt, double fontSize, FontWeight fontWeight1, FontWeight fontWeight2, context ){

    TextStyle textStyle1 = TextStyle(
      color: Color(int.parse('0xff$colorCodeTxt')),
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: fontWeight1,
        );
        
    TextStyle textStyle2 = TextStyle(
      color: Color(int.parse('0xff$colorCodeTxt')),
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: fontWeight2,
        );

    return RichText(
      text: TextSpan(
        text: text1,
        style: textStyle1,
        children: [
          TextSpan(
            text: text2,
            style: textStyle2,
            recognizer: TapGestureRecognizer()..onTap = () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => SignIn()));
            }
          )
        ]
      ));
  }

  Widget ImgLoader(String path, double widthImg, double heightImg){
    return SvgPicture.asset(
      path,
      width: widthImg,
      height: heightImg,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            ImgLoader("assets/img/Ic_Landing_App.svg", 92.86, 100),
            Container(
              margin: EdgeInsets.only(left: 33, right: 33, top: 40.15),
              child: TextLanding('Get Movie Info Easily with App', '303030', 32, FontWeight.w700, TextAlign.center)
            ),
            Container(
              margin: EdgeInsets.only(left: 33, right: 33, top: 15.85),
              child: TextLanding('Efficient Movie Information App Solution', '6C6C6C', 20, FontWeight.w600, TextAlign.center),
            ),
            Container(
              margin: EdgeInsets.only(top: 72, bottom: 20),
              child: BtnLanding('2C2C2C', 5, 0, TextLanding('Sign Up with Email ID', 'FFFFFF', 16, FontWeight.w600, TextAlign.center), 90, 90, context),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: BtnLanding('FFFFFF', 5, 1, TextLanding('Sign Up with Google', '2C2C2C', 16, FontWeight.w600, TextAlign.center), 95, 95, context),
            ),
            Container(
              child: WGT_TextSpan('Already have an account?', 'Sign In', '303030', 16, FontWeight.w400, FontWeight.w600, context)
            )
          ],
          )
        ),
      ),
    );
  }
}