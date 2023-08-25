import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget TextWidget({String textLabel = '', String fontColor = '303030', double fontSize = 16, FontWeight fontWeight = FontWeight.normal, TextAlign fontAlign = TextAlign.center}){
  return Text(
    textLabel,
    textAlign: fontAlign,
    style: TextStyle(
      color: Color(int.parse('0xff$fontColor')),
      fontSize: fontSize,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
    ),
  );
}

Widget SvgLoader({String path = '', double widthImg = 0, double heightImg = 0}){
  return SvgPicture.asset(
    path,
    width: widthImg,
    height: heightImg,
  );
}

Widget TextFormWidget({String codeColorText = '', String hintText = '', double fontSize = 16}){
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