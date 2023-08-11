import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget TextHome(String text, double fontSize, FontWeight fontWeight, String colorCodeTxt){
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
        toolbarHeight: 20,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
            'assets/img/Ic_Home_App.svg',
            width: 119,
            height: 43.6,
            ),
            Container(
              margin: EdgeInsets.only(top: 30.46),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffD9D9D9),
                  hintText: "Search Movie",
                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: TextHome("Latest", 20, FontWeight.w600, "FF000000")
                  ),
                  Container(
                    child: TextHome("See All", 15, FontWeight.w500, "FF000000"),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}