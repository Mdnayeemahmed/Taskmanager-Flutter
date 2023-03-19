import 'package:flutter/material.dart';
import 'package:taskmanager/screen/components/tasklist.dart';
import 'package:taskmanager/style/style.dart';

import '../../api/clientApi.dart';

class newtask extends StatefulWidget {
  const newtask({Key? key}) : super(key: key);

  @override
  State<newtask> createState() => _newtaskState();
}

class _newtaskState extends State<newtask> {
  List counttask=[];
  int newtaskcount=0,completetaskcount=0,progresstaskcount=0,canceltaskcount=0;

  var tasklist=[];
  bool Loading=true;
  String Status="New";

  @override
  void initState(){
    calldata();
    gettaskcount();
    super.initState();
  }

  gettaskcount() async{
    var data=await Taskcount();
    setState(() {
      counttask=data;
      newtaskcount=0;completetaskcount=0;progresstaskcount=0;canceltaskcount=0;
      counttask.forEach((element) {
        if(element["_id"]=="New"){
          newtaskcount=element["sum"];
        }
        else   if(element["_id"]=="Completed"){
          completetaskcount=element["sum"];
        }
        else if(element["_id"]=="Progress"){
          progresstaskcount=element["sum"];
        }
        else if(element["_id"]=="Canceled"){
          canceltaskcount=element["sum"];
        }
      });
    });

  }

  calldata() async {
    var data=await Tasklistreq('New');
    setState(() {
      Loading=false;
      tasklist=data;
    });
  }

  deleteditem(id) async{
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Delete"),
            content: Text("Once You delete! you can't retrive the data"),
            actions: [
              OutlinedButton(onPressed: () async {
                setState(() {
                  Loading=true;
                });
                Navigator.pop(context);
                await Taskdeletereq(id);
                await calldata();

              }, child: Text('Yes')),
              OutlinedButton(onPressed: (){
                Navigator.pop(context);

              }, child: Text('NO')),

            ],
          );
        }
    );

  }

  updatestatus(id) async{
    Navigator.pop(context);
    setState(() {
      Loading=true;
    });
    await Taskupdatereq(id,Status);
    await calldata();
    setState(() {
      Status="New";
    });
  }

  statuschange(id) async{
    showModalBottomSheet(
        context: context,
        builder:(context){
          return StatefulBuilder(
              builder: (BuildContext,StateSetter setState){
                return Container(
                  padding: EdgeInsets.all(30),
                  height: 360,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RadioListTile(title : Text("New"),value: 'New', groupValue: Status,
                          onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),
                        RadioListTile(title : Text("Progress"),value: 'Progress', groupValue: Status, onChanged: (value){
                          setState(() {
                      Status=value.toString();
                    });
                  }),
                      RadioListTile(title : Text("Completed"),value: 'Completed', groupValue: Status, onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),
                      RadioListTile(title : Text("Canceled"),value: 'Canceled', groupValue: Status, onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),

                      Container(
                        child: ElevatedButton(
                          style: appbutton(),
                          child: Successbutton("Confirm"),
                          onPressed: () {
                            updatestatus(id);

                          },

                        ),
                      )

                    ],

                  ),
                );
              }

          );
        }

    );
  }

  @override
  Widget build(BuildContext context) {

    return Loading?(Center(child: CircularProgressIndicator(),)):(RefreshIndicator(
      onRefresh: () async {
        await calldata();
      },
      child:Column(
        children: [
        Row(
              children: [
                statuscount("New",newtaskcount.toString()),
                statuscount("Progress",progresstaskcount.toString()),
                statuscount("Completed",completetaskcount.toString()),
                statuscount("Canceled",canceltaskcount.toString()),
              ],
            ),
          Expanded(child: Tasklist(tasklist,deleteditem,statuschange))
        ],
      )


      //

      // Column(
      //   children: [
      //
      //     ,
      //    ,
      //   ],
      // )


    ));
  }
}

