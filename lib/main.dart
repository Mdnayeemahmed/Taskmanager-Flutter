import 'package:flutter/material.dart';
import 'package:taskmanager/screen/components/newtask.dart';
import 'package:taskmanager/screen/components/taskCreateScreen.dart';
import 'package:taskmanager/screen/onboarding/forget.dart';
import 'package:taskmanager/screen/onboarding/login.dart';
import 'package:taskmanager/screen/onboarding/pinverify.dart';
import 'package:taskmanager/screen/onboarding/setpass.dart';
import 'package:taskmanager/screen/onboarding/signup.dart';
import 'package:taskmanager/screen/onboarding/splashscreen.dart';
import 'package:taskmanager/screen/profile/updateprofile.dart';
import 'package:taskmanager/screen/task/hometaskUi.dart';
//import 'package:taskmanager/screen/task/newtask.dart';
import 'package:taskmanager/utility/utility.dart';

 main() async {
   WidgetsFlutterBinding.ensureInitialized();

  String? token=await readuserdata('token');

  if(token==null){
    runApp(MyApp("/login"));
  }else{
    runApp(MyApp("/newtask"));
  }


}

class MyApp extends StatelessWidget {
   final String firstroute;
   MyApp(this.firstroute);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      initialRoute: firstroute,
      routes: {
        '/':(context)=>splashscreen(),
        '/login':(context)=>login(),
        '/forget':(context)=>forget(),
        '/pinverify':(context)=>pinverify(),
        '/setpass':(context)=>setpass(),
        '/signup':(context)=>signup(),
        '/newtask':(context)=>hometaskUi(),
        '/createtask':(context)=>taskCreateScreen(),
        '/update':(context)=>update()

      },
    );
  }
}

