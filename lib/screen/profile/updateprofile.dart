import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/clientApi.dart';
import '../../style/style.dart';
import '../../utility/utility.dart';

class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {



  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  XFile? pickedImage;
  String? base64Image;


  bool Loading=false;

  Readuserappdata() async {
    String? Email=await readuserdata('email');
    String? FirstName=await readuserdata('First');
    String? LastName=await readuserdata('Last');
    String? mobile=await readuserdata('mobile');

    setState(() {
      _emailETController.text=Email.toString();
      _firstNameETController.text=FirstName.toString();
      _lastNameETController.text=LastName.toString();
      _mobileETController.text=mobile.toString();
    });
  }


  @override
  void initState() {
    Readuserappdata();
    super.initState();
  }

  updateprofile() async{
    Map<String, String> fromvalue = {
      'firstName':_firstNameETController.text,
      'lastName':_lastNameETController.text,
      'mobile':_mobileETController.text.trim(),
    };

    if (pickedImage != null) {
      List<int> imageBytes = await pickedImage!.readAsBytes();
      print(imageBytes);
      base64Image = base64Encode(imageBytes);
      fromvalue['photo'] = base64Image ?? "";

    }

    if (_passwordETController.text.isNotEmpty) {
      fromvalue['password'] = _passwordETController.text;
    }

    setState(() {
      Loading=true;
    });

    bool response=await updaterequest(fromvalue);

    if(response=true){
      setState(()   {
        // if(pickedImage!=null){
        // }
        updateprofileuser('Photo',base64Image!);


        updateprofileuser('First',_firstNameETController.text);
        updateprofileuser('Last',_lastNameETController.text);
        updateprofileuser('mobile',_mobileETController.text);
      });
      Navigator.pushNamedAndRemoveUntil(context, '/newtask', (route) => false);
    }



}

  Future<void> pickImage() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Pick Image From"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    var navigator = Navigator.of(context);
                    pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                    navigator.pop();
                  },
                  leading: const Icon(Icons.camera_alt_outlined, size: 34, color: colorDarkBlue,),
                  title: const Text("Camera"),
                ),
                ListTile(
                  onTap: () async {
                    var navigator = Navigator.of(context);
                    pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                    navigator.pop();
                  },
                  leading: const Icon(Icons.image_outlined, size: 34, color: colorDarkBlue,),
                  title: const Text("Gallery"),
                ),
                SizedBox(height: 8,),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")
                )
              ],
            ),
          );
        }
    );
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
                  Text("Update Your Profile",style: Headtext1(colorDarkBlue),),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      pickImage();

                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),

                              )
                          ),
                          child: Text("Photo"),


                        ),
                        Expanded(
                            child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Text(pickedImage?.name??''),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8),
                                    )))),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    readOnly: true,
                      controller: _emailETController,
                      decoration: AppDecoration("Email"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                      controller: _firstNameETController,
                      decoration: AppDecoration("First Name"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                      controller: _lastNameETController,
                      decoration: AppDecoration("Last Name"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                      controller: _mobileETController,
                      decoration: AppDecoration("Mobile"),

                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                      obscureText: true,
                      controller: _passwordETController,
                      decoration: AppDecoration("Password"),

                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                      style: appbutton(),
                      onPressed: (){
                        updateprofile();;

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
