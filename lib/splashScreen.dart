import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kavach_flutter_app/home_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  var show=0.0;
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500),
            () => setState(() {
          show=1.0;
        })
    );
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => HomePage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 12, 26, 1),
      body: SafeArea(
        child: Container(

          padding: EdgeInsets.symmetric(vertical: height*0.04, horizontal: width*0.1),

          child: AnimatedOpacity(
            opacity: show,
            duration: Duration(milliseconds: 1000),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(

                  child: Center(child: Image.asset("assets/images/kavachLogo.png", scale: 0.7,)),
                ),
                Container(

                  child: SvgPicture.asset('assets/svg/NAME.svg',width: width,),
                ),
                SizedBox(
                  height: height*0.0,
                ),
                Container(

                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset('assets/svg/ANPR.svg', width: width,),
                        SizedBox(
                          height: height*0.03,
                        ),
                        SvgPicture.asset('assets/svg/FRS.svg',width: width,)
                      ],
                    )
                ),
                SizedBox(
                  height: height*0.1,
                )

              ],
            ),
          ),

        ),
      ),
    );
  }
}
