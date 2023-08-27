import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:one_take/Page/HomePage.dart';
import 'package:one_take/Page/SplashScreen.dart';
import '../widget/Widget.dart';
import 'package:one_take/Page/SignInPage.dart';

class LandingPage extends StatelessWidget {

  Widget WGT_TextSpan({ String text1 = '', String text2 = '', String fontColor = '', double fontSize = 0, FontWeight fontWeight1 = FontWeight.normal, FontWeight fontWeight2 = FontWeight.normal, context }){

    TextStyle textStyle1 = TextStyle(
      color: Color(int.parse('0xff$fontColor')),
        fontSize: fontSize,
        fontFamily: 'Roboto',
        fontWeight: fontWeight1,
        );
        
    TextStyle textStyle2 = TextStyle(
      color: Color(int.parse('0xff$fontColor')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: SvgLoader(
                  path: 'assets/img/Ic_Landing_App.svg',
                  widthImg: 92.86,
                  heightImg: 100
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 33, 
                  right: 33, 
                  top: 40.15
                ),
                child: TextWidget(
                  textLabel: 'Get Movie Info Easily with App', 
                  fontSize: 32, 
                  fontWeight: FontWeight.w700,
                  fontAlign : 
                  TextAlign.center)
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 33, 
                  right: 33, 
                  top: 15.85
                ),
                child: TextWidget(
                  textLabel: 'Efficient Movie Information App Solution',
                  fontColor: '6C6C6C',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontAlign: TextAlign.center
                )
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 72, 
                  bottom: 20
                ),
                child: ElevatedButtonWidget(
                  btnColor: '2C2C2C',
                  radius: 5,
                  widthBorder: 0,
                  left: 90,
                  right: 90,
                  textWidget: TextWidget(
                    textLabel: 'Sign Up with Email ID',
                    fontColor: 'FFFFFF',
                    fontWeight: FontWeight.w600,
                    fontAlign: TextAlign.center
                  ),
                  action: () => Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => HomePage())),
                )
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20
                ),
                child: ElevatedButtonWidget(
                  btnColor: 'FFFFFF',
                  radius: 5,
                  widthBorder: 1,
                  left: 95,
                  right: 95,
                  textWidget: TextWidget(
                    textLabel: 'Sign Up with Google',
                    fontColor: '2C2C2C',
                    fontWeight: FontWeight.w600,
                    fontAlign: TextAlign.center
                  ),
                  action: () => Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => SplashScreen())
                  ),
                )
              ),
              Container(
                child: WGT_TextSpan(
                  text1: 'Already have an account?', 
                  text2: ' Sign In', 
                  fontColor: '303030', 
                  fontSize: 16, 
                  fontWeight1: FontWeight.w400, 
                  fontWeight2: FontWeight.w600, 
                  context: context
                )
              )
            ],
          )
        ),
      ),
    );
  }
}