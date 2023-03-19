import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../style/style.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Svgbackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: SvgPicture.asset("assets/images/logo.svg",alignment: Alignment.center,),
            ),
          )
        ],
      ),

    );
  }
}
