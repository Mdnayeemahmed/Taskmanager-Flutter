
import 'package:flutter/material.dart';
import 'package:taskmanager/utility/utility.dart';

import '../../style/style.dart';

AppBar taskappbar(context,Profiledata){

  var img=Profiledata['Photo'];

  if(img=="") {
    img=DefaultProfilePic;
  }

  return AppBar(
    backgroundColor: colorGreen,
    flexibleSpace: Container(
      margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 24,
            child: ClipOval(
                child:Image.memory(Showimage64(img),),
               //Image.memory(Showimage64(DefaultProfilePic)),

            ),

          ),
          SizedBox(
            width: 18,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, "/update");
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${Profiledata['FirstName']} ${Profiledata['LastName']}',style:Headtext7(colorWhite)),
                Text(Profiledata['Email'],style:Headtext9(colorWhite)),
              ],
            ),
          )
        ],

      ),
    ),
    actions: [
      IconButton(onPressed: (){
        Navigator.pushNamed(context, "/createtask");
      },
          icon: Icon(Icons.add_circle_outline)),
      IconButton(onPressed: () async {
        await removetoken();
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      },
          icon: Icon(Icons.output)),
    ],

  );
}