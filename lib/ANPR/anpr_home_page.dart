import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kavach_flutter_app/ANPR/car_detail.dart';
import 'package:vibration/vibration.dart';

class AnprHomePage extends StatefulWidget {
  @override
  State<AnprHomePage> createState() => _AnprHomePageState();
}

class _AnprHomePageState extends State<AnprHomePage> {
  final List detections = [
    {
      'carNumber': "ABC121",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC122",
      'ownerName': "Sheldon",
      'carModel': "Toyota Innova",
      'carColor': "Black",
      'carType': "SUV",
    },
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC124",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC125",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC126",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
  ];

  List<String> flaggedVehicles = [];

  @override
  Widget build(BuildContext context) {

    var width= MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 11, 26, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(

            child:Column(
              children: [

                SvgPicture.asset('assets/svg/addedVehicles.svg'),
                SizedBox(
                  height: height*0.03,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: detections.length,
                  itemBuilder: (BuildContext context, int index) {
                    final detection = detections[index];
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
                        padding: EdgeInsets.symmetric(horizontal: width*0.02, vertical: height*0.01),
                        color: flaggedVehicles.contains(detection['carNumber'].toString()) ? Colors.red : Colors.white,

                        child: ListTile(
                          title: Text(
                              "Vehicle Number: ${detection['carNumber']}", style: GoogleFonts.chakraPetch(fontSize: height*0.026, color: flaggedVehicles.contains(detection['carNumber'].toString()) ?Colors.white:Colors.black)),
                          subtitle: Text("Time detected: ${DateTime.now().toString()}", style: GoogleFonts.chakraPetch(fontSize: width*0.035, color: flaggedVehicles.contains(detection['carNumber'].toString()) ?Colors.white.withOpacity(0.8):Colors.black.withOpacity(0.8)),),


                          ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailsPage(
                              carNumber: "ABC123",
                              carDetailsList: [
                                CarDetails(
                                  carNumber: "ABC123",
                                  ownerName: "John Doe",
                                  carModel: "Toyota Corolla",
                                  carColor: "Blue",
                                  carType: "Sedan",
                                ),
                                CarDetails(
                                  carNumber: "XYZ456",
                                  ownerName: "Jane Smith",
                                  carModel: "Honda Civic",
                                  carColor: "Red",
                                  carType: "Coupe",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: width*0.35,
        child: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            _showAddFlaggedVehicleDialog();
          },
          tooltip: 'Add Flagged Vehicle',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/alert.svg', width: width*0.06, color: Colors.white,),
              SizedBox(
                width: width*0.01,
              ),
              Text("Flag Vehicle")
            ],
          ),

          shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          hoverColor: Colors.red,
        ),
      ),
    );
  }

  void _showAddFlaggedVehicleDialog() {
    String newFlaggedVehicleNumber = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Flagged Vehicle'),
          content: TextFormField(
            decoration: InputDecoration(hintText: 'Enter vehicle number'),
            onChanged: (value) {
              newFlaggedVehicleNumber = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                setState(() {
                  flaggedVehicles.add(newFlaggedVehicleNumber);
                });
                Navigator.of(context).pop();
                bool x = false;
                for (var i in detections) {
                  if (i['carNumber'] == newFlaggedVehicleNumber) x = true;
                }
                if (x) Vibration.vibrate(duration: 2000);
              },
            ),
          ],
        );
      },
    );
  }
}
