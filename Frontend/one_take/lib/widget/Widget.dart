import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget SvgLoader({ String path = '', double widthImg = 0, double heightImg = 0 }){
  return SvgPicture.asset(
    path,
    width: widthImg,
    height: heightImg,
  );
}

Widget TextWidget({String textLabel = '', String fontColor = '303030', double fontSize = 16, int maxLine = 2, FontWeight fontWeight = FontWeight.normal, TextAlign fontAlign = TextAlign.center, TextOverflow? overflow }){
  return Text(
    textLabel,
    textAlign: fontAlign,
    overflow: overflow,
    maxLines: maxLine,
    style: TextStyle(
      color: Color(int.parse('0xff$fontColor')),
      fontSize: fontSize,
      fontFamily: 'Roboto',
      fontWeight: fontWeight,
    ),
  );
}

Widget TextFormFieldWidget({ String hintText = '', String fontColor = '303030', double fontSize = 0, TextEditingController? controller, VoidCallback? onClick, Function(String)? onChange }) {
  return TextFormField(
    onTap: onClick,
    onChanged: onChange != null ? (value) => onChange(value) : null,
    style: TextStyle(
      color: Color(int.parse('0xff$fontColor')),
      fontSize: fontSize,
    ),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Color(0xff2C2C2C)),
      filled: true,
      fillColor: const Color(0xffD9D9D9),
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}

Widget ElevatedButtonWidget({String btnColor = '303030', double radius = 5, double widthBorder = 0, double left = 0, double right = 0, Widget? textWidget, VoidCallback? action}) {
  return ElevatedButton(
    onPressed: action,
    child: textWidget, 
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.only(left: left, right: right, top: 12, bottom: 12),
      backgroundColor: Color(int.parse('0xff$btnColor')),
      side: BorderSide(width: widthBorder, color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      )
    ),
  );
}
