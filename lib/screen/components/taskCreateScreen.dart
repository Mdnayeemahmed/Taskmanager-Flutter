import 'package:flutter/material.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({Key? key}) : super(key: key);

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {
  Map<String,String> Fromvalue={"title":"","description":"","status":"New"};

  bool Loading=false;

  Inputonchange(Mapkey,Textvalue){
    setState(() {
      Fromvalue.update(Mapkey, (value) => Textvalue);
    });
  }

  formsubmit() async {
    if(Fromvalue['title']!.length==0){
      notsuccess("Please Enter tittle");
    }
    else if(Fromvalue['description']!.length==0){
      notsuccess("This filled can't be empty");
    }

    else{
      setState(() {
        Loading=true;
      });

      bool res=await Tasklistcreate(Fromvalue);
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
      appBar: AppBar(backgroundColor: colorGreen,title: Text("Create New Task"),),

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
                  Text("Add New Task",style: Headtext1(colorDarkBlue),),
                  SizedBox(height: 1,),
                  TextFormField(decoration: AppDecoration("Tittle"),
                    onChanged: (Textvalue){
                      Inputonchange("title", Textvalue);
                    },
                  ),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppDecoration("Description"),
                      maxLines: 10,
                      onChanged: (Textvalue){
                        Inputonchange("description", Textvalue);
                      }),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style: appbutton(),
                      onPressed: (){
                        formsubmit();
                      },
                      child: Successbutton("Submit")),
                  SizedBox(height: 20,),
                ],

              ),
            )),
          )
        ],
      ),
    );
  }
  }

