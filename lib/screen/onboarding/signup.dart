import 'package:flutter/material.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool Loading=false;

  Map<String,String> Fromvalue={"email":"","firstName":"","lastName":"","mobile":"","password":""};

  Inputonchange(Mapkey,Textvalue){
    setState(() {
      Fromvalue.update(Mapkey, (value) => Textvalue);
    });
  }

  formsubmit() async {
    if(Fromvalue['email']!.length==0){
      notsuccess("Please Enter Correct Email");
    }
    else if(Fromvalue['firstName']!.length==0){
      notsuccess("firstName Require");
    }
    else if(Fromvalue['lastName']!.length==0){
      notsuccess("lastName Require");
    }
    else if(Fromvalue['mobile']!.length==0){
      notsuccess("Mobile Require");
    }
    else if(Fromvalue['password']!.length==0){
      notsuccess("Password Require");
    }

    else{
      setState(() {
        Loading=true;
      });

      bool res=await signuprequest(Fromvalue);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      }
      else{
        setState(() {
          Loading=false;
        });
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Svgbackground(context),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Get Started With",style: Headtext1(colorDarkBlue),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Email"),
                      onChanged: (Textvalue){
                        Inputonchange("email", Textvalue);
                      }
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("First Name"),
                      onChanged: (Textvalue){
                        Inputonchange("firstName", Textvalue);
                      }
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Last Name"),
                      onChanged: (Textvalue){
                        Inputonchange("lastName", Textvalue);
                      }
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Mobile"),
                      onChanged: (Textvalue){
                        Inputonchange("mobile", Textvalue);
                      }
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Password"),
                      onChanged: (Textvalue){
                        Inputonchange("password", Textvalue);
                      }
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style: appbutton(),
                      onPressed: (){
                        formsubmit();

                      },
                      child: Successbutton("Submit"))
                ],
              ),
            )
          ],
        )
    );
  }
}
