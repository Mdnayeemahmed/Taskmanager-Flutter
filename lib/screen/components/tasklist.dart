

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';



ListView Tasklist(TaskItems,deleteditem,statuschange){




  return ListView.builder(
      itemCount: TaskItems.length,
      itemBuilder: (context,index)
      {

        Color statusColor=colorGreen;
        if(TaskItems[index]['status']=="New"){
          statusColor=colorBlue;
        }
        else if(TaskItems[index]['status']=="Progress"){
          statusColor=colorOrange;
        }
        else if(TaskItems[index]['status']=="Canceled"){
          statusColor=colorRed;
        }





        return Column(
          children: [

                Card(
                    child: itembox(Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(TaskItems[index]['title'] ?? 'unknown',style: Headtext6(colorDarkBlue),),//returning null
                    Text(TaskItems[index]['description'],style: Headtext7(colorLightGray),),
                    Text(TaskItems[index]['createdDate'],style: Headtext7(colorDarkBlue),),
                    SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Statuschild(TaskItems[index]['status'],statusColor),

                    Container(
                    child: Row(
                    children: [
                      SizedBox(width: 50,height: 30,child: ElevatedButton(onPressed: (
                        ){
                        statuschange(TaskItems[index]['_id']);
                          },child: Icon(Icons.edit_location_alt,size: 16,),style: appstatusbutton(colorBlue),),),
                        SizedBox(width: 5,),
                        SizedBox(width: 50,height: 30,child: ElevatedButton(onPressed: (){
                        deleteditem(TaskItems[index]['_id']);
                        },child: Icon(Icons.restore_from_trash_outlined,size: 16,),style: appstatusbutton(colorRed),),)
                          ],
                          ),
                          )
                            ],
                            )
                            ],
                            )),

                            )
                              ],
                            ) ;





      }
  );
}