import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

import '../../api/clientApi.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  Map<String,String> Fromvalue={"email":"","password":""};

  bool Loading=false;

  Inputonchange(Mapkey,Textvalue){
    setState(() {
      Fromvalue.update(Mapkey, (value) => Textvalue);
    });
  }

  formsubmit() async {
    if(Fromvalue['email']!.length==0){
      notsuccess("Please Enter Correct Email");
    }
    else if(Fromvalue['password']!.length==0){
      notsuccess("Password incorrect");
    }

    else{
      setState(() {
        Loading=true;
      });

      bool res=await Loginrequest(Fromvalue);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/newtask", (route) => false);
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
            alignment: Alignment.center,
            child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(
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
                  },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Password"),
                      onChanged: (Textvalue){
                        Inputonchange("password", Textvalue);
                      }),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style: appbutton(),
                      onPressed: (){
                        formsubmit();
                      },
                      child: Successbutton("Login")),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/forget");

                          },child: Text("Forget Pass?",style: Headtext7(colorLightGray),),
                        ),
                        SizedBox(height: 5,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "/signup");

                          },child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have a account?",style: Headtext7(colorDarkBlue),),
                              Text(" Sign Up",style: Headtext7(colorGreen),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],

              ),
            )),
          )
        ],
      ),
    );
  }
}
