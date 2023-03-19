import 'dart:convert';

import 'package:http/http.dart' as http;

import '../style/style.dart';
import '../utility/utility.dart';

var BaseURL="https://task.teamrabbil.com/api/v1";
var requestheader={"Content-Type":"application/json"};

Future<bool> Loginrequest(Fromvalue) async {
  var URL=Uri.parse("${BaseURL}/login");
  var Postbody=jsonEncode(Fromvalue);
  var response=await http.post(URL,headers: requestheader,body: Postbody);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  print("xys");

  if(resultcode==200 && resultbody['status']=='success'){
    successmsg("Req Success");
    await writeuserdata(resultbody);
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future<bool> signuprequest(fromvalue) async {
  var URL=Uri.parse("${BaseURL}/registration");
  var Postbody=jsonEncode(fromvalue);
  var response=await http.post(URL,headers: requestheader,body: Postbody);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  if(resultcode==200 && resultbody['status']=='success'){
    successmsg("Req Success");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future<bool> otpverify(email,otp) async {
  var URL=Uri.parse("${BaseURL}/RecoverVerifyOTP/${email}/${otp}");
  var response=await http.get(URL,headers: requestheader);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  if(resultcode==200 && resultbody['status']=='success'){
    await writeotp(otp);
    successmsg("Req Success");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future<bool> forgetemail(email) async {
  var URL=Uri.parse("${BaseURL}/RecoverVerifyEmail/${email}");
  var response=await http.get(URL,headers: requestheader);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  if(resultcode==200 && resultbody['status']=='success'){
    await writeemail(email);
    successmsg("Req Success");
    return true;
  }else{
    notsuccess("Request fail ! try again");
    return false;
  }

}

Future<bool> passwordchange(fromvalue) async {
  var URL=Uri.parse("${BaseURL}/RecoverResetPass");
  var Postbody=jsonEncode(fromvalue);
  var response=await http.post(URL,headers: requestheader,body: Postbody);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  if(resultcode==200 && resultbody['status']=='success'){

    successmsg("Req Success");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future <List> Tasklistreq(Status) async {
  print("start");
  var URL=Uri.parse("${BaseURL}/listTaskByStatus/${Status}");
  String? token=await readuserdata("token");
  print('$token');
  var requestheaderwithtoken={"Content-Type":"application/json","token":'$token'};
  var response=await http.get(URL,headers: requestheaderwithtoken);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  if(resultcode==200 && resultbody['status']=='success'){

    successmsg("Req Success");
    return resultbody['data'];
  }else{
    notsuccess("Something Went Wrong");
    return [];
  }

}


Future <bool> Tasklistcreate(fromvalue) async {
  var URL=Uri.parse("${BaseURL}/createTask");
  String? token=await readuserdata("token");
  var requestheaderwithtoken={"Content-Type":"application/json","token":'$token'};
  var Postbody=jsonEncode(fromvalue);
  var response=await http.post(URL,headers: requestheaderwithtoken,body: Postbody);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);
  print("req");

  if(resultcode==200 && resultbody['status']=='success'){

    successmsg("Req Success");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future <bool> Taskdeletereq(id) async {
  print("start");
  var URL=Uri.parse("${BaseURL}/deleteTask/${id}");
  String? token=await readuserdata("token");
  print('$token');
  var requestheaderwithtoken={"Content-Type":"application/json","token":'$token'};
  var response=await http.get(URL,headers: requestheaderwithtoken);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);
  print("status");

  if(resultcode==200 && resultbody['status']=='success'){

    successmsg("Req Success");
    print("status success");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future <bool> Taskupdatereq(id,Status) async {
  print("start");
  var URL=Uri.parse("${BaseURL}/updateTaskStatus/${id}/${Status}");
  String? token=await readuserdata("token");
  print('$token');
  var requestheaderwithtoken={"Content-Type":"application/json","token":'$token'};
  var response=await http.get(URL,headers: requestheaderwithtoken);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);
  print("status");

  if(resultcode==200 && resultbody['status']=='success'){

    successmsg("Req Success");
    print("status success");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

Future <List> Taskcount() async {
  print("start");
  var URL=Uri.parse("${BaseURL}/taskStatusCount");
  String? token=await readuserdata("token");
  print('$token');
  var requestheaderwithtoken={"Content-Type":"application/json","token":'$token'};
  var response=await http.get(URL,headers: requestheaderwithtoken);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);
  print("status");

  if(resultcode==200 && resultbody['status']=='success'){

    //successmsg("Req Success");
    print("status success");
    return resultbody['data'];
  }else{
    notsuccess("Something Went Wrong");
    return [];
  }

}

Future<bool> updaterequest(Fromvalue) async {
  var URL=Uri.parse("${BaseURL}/profileUpdate");
  var Postbody=jsonEncode(Fromvalue);
  String? token=await readuserdata("token");
  var requestheaderwithtoken={"Content-Type":"application/json","token":'$token'};
  var response=await http.post(URL,headers: requestheaderwithtoken,body: Postbody);
  var resultcode=response.statusCode;
  var resultbody=jsonDecode(response.body);

  if(resultcode==200 && resultbody['status']=='success'){
    successmsg("Profile update");
    return true;
  }else{
    notsuccess("Something Went Wrong");
    return false;
  }

}

