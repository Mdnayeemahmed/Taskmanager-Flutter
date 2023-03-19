import 'package:flutter/material.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class setpass extends StatefulWidget {
  const setpass({Key? key}) : super(key: key);

  @override
  State<setpass> createState() => _setpassState();
}

class _setpassState extends State<setpass> {

  Map<String,String> Fromvalue={'email':'','OTP':'',"pass":"","cpass":""};

  bool Loading=false;



  Inputonchange(Mapkey,Textvalue){
    setState(() {
      Fromvalue.update(Mapkey, (value) => Textvalue);
    });
  }

  formsubmit() async {
    if(Fromvalue['pass']!.length==0){
      notsuccess("Enter Your Pass");
    }
    else if(Fromvalue['pass']!=Fromvalue['cpass']){
      notsuccess("Password Not Match");
    }

    else{
      setState(() {
        Loading=true;
      });

      bool res=await passwordchange(Fromvalue);
      if(res==true){
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);

      }
      else{
        setState(() {
          Loading=false;
        });
      }

    }
  }

  @override
  initState() {
    callStoreData();
    super.initState();
  }

  callStoreData() async {

    String? Email= await readuserdata('email');
    String? OTP= await readuserdata('otp');
    Inputonchange("email", Email);
    Inputonchange("OTP", OTP);
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
                  Text("Your Email Address",style: Headtext1(colorDarkBlue),),
                  SizedBox(height: 20,),
                  Text("Minimum length password 8 character with Letter and number combination ",style: Headtext6(colorLight),),
                  TextFormField(decoration: AppDecoration("Password"),
                    onChanged: (Textvalue)
                    {
                      Inputonchange("pass", Textvalue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Confirm"),
                      onChanged: (Textvalue)
                      {
                        Inputonchange("cpass", Textvalue);
                      }),
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
