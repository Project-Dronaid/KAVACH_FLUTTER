import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavach_flutter_app/ANPR/anpr_home_page.dart';
import 'package:kavach_flutter_app/FRS/frs_home_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context2: context),
        body:Container(
            child:Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>AnprHomePage()));
                },
                    child: Text("ANPR")),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>CybersecurityPage()));
                },
                    child: Text("FRS")),
              ],
            )

        )

    );
  }


}


class CustomAppBar  extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar ({Key? key,
    required this.context2,
  }) : super(key: key);

  final BuildContext context2;

  @override
  Widget build(BuildContext context) {

    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;

    return  Scaffold(
      backgroundColor: Color(0xff26303c),
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              DropShadow(
                  child: SvgPicture.asset('assets/svg/Rectangle.svg', height: height*0.07,),
                offset: Offset(0.0,0.7),
                spread: 0.7,
                blurRadius: 1,
              ),
              DropShadow(
                child: Text("WELCOME TO KAVACH", style: GoogleFonts.chakraPetch(color: Colors.white, fontSize: height*0.025, fontWeight: FontWeight.normal),),
                offset: Offset(0.0,0.7),
                spread: 0.7,
                blurRadius: 2,
              )

            ],
          ),


        ),
      ),
    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size(double.maxFinite, MediaQuery.of(context2).size.height*0.07);
}

