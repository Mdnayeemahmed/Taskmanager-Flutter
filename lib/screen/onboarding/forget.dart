import 'package:flutter/material.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {

  Map<String,String> Fromvalue={"email":""};

  bool Loading=false;

  Inputonchange(Mapkey,Textvalue){
    setState(() {
      Fromvalue.update(Mapkey, (value) => Textvalue);
    });
  }

  formsubmit() async {
    if(Fromvalue['email']!.length==0){
      notsuccess("Email Not found");
    }

    else{
      setState(() {
        Loading=true;
      });

      bool res=await forgetemail(Fromvalue['email']);
      if(res==true){
        Navigator.pushNamed(context, "/pinverify");

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
    return  Scaffold(
        body: Stack(
          children: [
            Svgbackground(context),
            Container(
              alignment: Alignment.center,
              child: Loading?(Center(child: CircularProgressIndicator(),)):(SingleChildScrollView(padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Email Address",style: Headtext1(colorDarkBlue),),
                    SizedBox(height: 10,),
                    Text("A 6 digit verification pin will send to your email address",style: Headtext6(colorLight),),
                    TextFormField(decoration: AppDecoration("Email"),
                    onChanged: (Textvalue)
                      {
                        Inputonchange("email", Textvalue);
                      },),
                    SizedBox(height: 20,),
                    ElevatedButton(
                        style: appbutton(),
                        onPressed: (){
                          formsubmit();
                        },
                        child: Successbutton("Submit"))
                  ],
                ),)),
            )
          ],
        )
    );
  }
}
