import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen=Color.fromRGBO(33, 191, 115, 1);
const colorBlue=Color.fromRGBO(52, 152, 219,1.0);
const colorOrange=Color.fromRGBO(230, 126, 34,1.0);
const colorWhite=Color.fromRGBO(255, 255, 255,1.0);
const colorDarkBlue=Color.fromRGBO(44, 62, 80,1.0);
const colorLightGray=Color.fromRGBO(135, 142, 150, 1.0);
const colorLight=Color.fromRGBO(211, 211, 211, 1.0);


SizedBox itembox(child){
  return SizedBox(
    width: double.infinity,
    child: Container(
      padding: EdgeInsets.all(10),
      child: child,
    ),
  );
}

SvgPicture Svgbackground(context){
  return SvgPicture.asset(
    'assets/images/background.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

PinTheme appotpstyle(){
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    selectedColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: colorWhite,



  );
}

TextStyle Headtext1(textcolor){
  return TextStyle(
    color: textcolor,
    fontSize: 28,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700

  );
}

TextStyle Headtext7(textcolor){
  return TextStyle(
      color: textcolor,
      fontSize: 13,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400

  );
}
TextStyle Headtext9(textcolor){
  return TextStyle(
      color: textcolor,
      fontSize: 9,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w300

  );
}

TextStyle Headtext6(textcolor){
  return TextStyle(
      color: textcolor,
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400

  );
}

InputDecoration AppDecoration(lebel){
  return InputDecoration(
      focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorGreen,width: 1)
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: colorWhite,width: 0)
      ),
      border: OutlineInputBorder(),
      labelText: lebel
  );
}

Ink Successbutton(ButtonText){
  return Ink(
    decoration: BoxDecoration(
        color: colorGreen,
        borderRadius: BorderRadius.circular(6)
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15
      ),
      ),
    ),
  );
}

DecoratedBox Appdropdownbox(child){
  return DecoratedBox(decoration:BoxDecoration(
      color: colorWhite,
      border: Border.all(color: colorWhite,width: 1),
      borderRadius: BorderRadius.circular(4)
  ),
    child: Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: child,
    ),
  );
}

ButtonStyle appbutton(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );

}

Container Statuschild(statustext,statusColor){
  return Container(
    alignment: Alignment.center,
    child: Text(statustext,style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w400),),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: statusColor
    ),
    height: 20,
    width: 60,
  );
}

ButtonStyle appstatusbutton(btncolor){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.all(0),
      backgroundColor: btncolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );

}

void notsuccess(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: colorWhite,
      fontSize: 16.0
  );
}

void successmsg(msg){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0
  );
}



Showimage64(base64String) {
  UriData? data = Uri.parse(base64String).data;
  Uint8List image;
  if(data != null) {
    image = data.contentAsBytes();
  } else {
    image = base64Decode(base64String);
  }
  return image;
}

statuscount(status,statusnumber){
  return Expanded(
    child: Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FittedBox(
              child: Text(statusnumber,style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),),
            ),
            FittedBox(child: Text(status))
          ],
        ),
      ),
    ),
  );
}