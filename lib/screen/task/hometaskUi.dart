import 'package:flutter/material.dart';
import 'package:taskmanager/screen/components/completetask.dart';
import 'package:taskmanager/screen/components/progresstask.dart';
import 'package:taskmanager/screen/task/addtask.dart';
import 'package:taskmanager/screen/components/canceltask.dart';
import 'package:taskmanager/screen/components/newtask.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';
import '../../utility/appdrawer.dart';
import '../../utility/utility.dart';
import '../components/appbar.dart';

class hometaskUi extends StatefulWidget {
  const hometaskUi({Key? key}) : super(key: key);

  @override
  State<hometaskUi> createState() => _hometaskUiState();
}

class _hometaskUiState extends State<hometaskUi> {


  int currentindex=0;

  Map<String,String> Profiledata={"Email":"","FirstName":"","LastName":"","Photo":DefaultProfilePic};

  onItemtap(int index){
    setState(() {
      currentindex=index;
    });
  }

  final widgetsOptions=[
    newtask(),
    progresstask(),
    completetask(),
    canceltask(),


  ];

  Readuserappdata() async {
    String? Email=await readuserdata('email');
    String? FirstName=await readuserdata('First');
    String? LastName=await readuserdata('Last');
    String? Photo=await readuserdata('photo');

    setState(() {
      Profiledata={"Email": '$Email',"FirstName":"$FirstName","LastName":"$LastName","Photo":"$Photo"};
    });
  }

  @override
  void initState() {
    Readuserappdata();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: taskappbar(context,Profiledata),
      body: widgetsOptions.elementAt(currentindex),
      bottomNavigationBar: appdrawer(currentindex,onItemtap),
    );
  }
}
