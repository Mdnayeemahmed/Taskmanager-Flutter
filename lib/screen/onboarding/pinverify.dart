import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class pinverify extends StatefulWidget {
  const pinverify({Key? key}) : super(key: key);

  @override
  State<pinverify> createState() => _pinverifyState();
}

class _pinverifyState extends State<pinverify> {

  Map<String,String> Fromvalue={"otp":""};

  bool Loading=false;

  Inputonchange(Mapkey,Textvalue){
    setState(() {
      Fromvalue.update(Mapkey, (value) => Textvalue);
    });
  }

  formsubmit() async {
    if(Fromvalue['otp']!.length==0){
      notsuccess("Please Enter Otp");
    }

    else{
      setState(() {
        Loading=true;
      });

      String? Email=await readuserdata('email');


      bool res=await otpverify(Email,Fromvalue['otp']);
      if(res==true){
        Navigator.pushNamed(context, "/setpass");
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
                  Text("PIN Verification",style: Headtext1(colorDarkBlue),),
                  SizedBox(height: 10,),
                  Text("A 6 digit verification pin will send to your email address ",style: Headtext6(colorLight),),
                  SizedBox(height: 20,),
                  PinCodeTextField(
                      appContext: context,
                      length: 6,
                      pinTheme: appotpstyle(),
                      animationType:AnimationType.fade,
                      animationDuration: Duration(microseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v){},
                      onChanged: (value){
                        Inputonchange('otp',value);
                      }
                  ),
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
