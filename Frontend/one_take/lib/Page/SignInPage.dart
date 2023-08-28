import 'package:flutter/material.dart';
import 'package:one_take/Page/SplashScreen.dart';
import 'package:one_take/widget/Widget.dart';

class SignIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 20, 
          right: 20, 
          bottom: 20, 
          top: 40
        ),
        child: Column(
          children: [
            Container(
              child: Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  textLabel: 'Sign In',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  fontAlign: TextAlign.left
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(
                right: 94, 
                top: 10
              ),
              child: TextWidget(
                textLabel: 'Sign in to your account before you back get an movie information',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontAlign: TextAlign.left
              )
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20
              ),
              child: TextFormFieldWidget(
                hintText: 'Username',
                fontSize: 15,
              )
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20
              ),
              child: TextFormFieldWidget(
                hintText: 'Password',
                fontSize: 15
              )
            ),
            Container(
              margin: EdgeInsets.only(
                top: 54
              ),
              child: ElevatedButtonWidget(
                btnColor: '2C2C2C',
                radius: 5,
                widthBorder: 0,
                left: 120,
                right: 120,
                textWidget: TextWidget(
                  textLabel: 'Conferm Sign In',
                  fontColor: 'FFFFFF',
                  fontWeight: FontWeight.w600,
                  fontAlign: TextAlign.center
                ),
                action: () => Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => SplashScreen())
                )
              )
            ),
          ],
        ),
      ),
    );
  }
}