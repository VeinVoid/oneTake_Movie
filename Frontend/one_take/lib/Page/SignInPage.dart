import 'package:flutter/material.dart';
import 'package:one_take/Page/SplashScreen.dart';

class SignIn extends StatelessWidget {
  
  Widget TextSignIn(String text, String colorCodeTxt, double fontSize, FontWeight fontWeight, TextAlign textAlign){
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

  Widget BtnSignIn(String colorCodeBtn, double radius, double widthBorder, Widget textWidget, double left, double right, context) 
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

  Widget FormFieldSignIn(String codeColorText, double fontSize, String hintText){
    return TextFormField(        
      style: TextStyle(color: Color(int.parse('0xff$codeColorText')), fontSize: fontSize), 
      decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0xff2C2C2C)), 
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      filled: true, 
      fillColor: const Color(0xffD9D9D9), 
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: TextSignIn('Sign In', '303030', 32, FontWeight.w700, TextAlign.left),
              )
            ),
            Container(
              margin: EdgeInsets.only(right: 94, top: 10),
              child: TextSignIn('Sign in to your account before you back get an movie information', '303030', 15, FontWeight.w600, TextAlign.left),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: FormFieldSignIn('303030', 15, 'Username'),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: FormFieldSignIn('303030', 15, 'Password'),
            ),
            Container(
              margin: EdgeInsets.only(top: 54),
              child: BtnSignIn('2C2C2C', 5, 0, TextSignIn('Conferm Sign In', 'FFFFFF', 16, FontWeight.w600, TextAlign.center), 120, 120, context),
            ),
          ],
        ),
      ),
    );
  }
}