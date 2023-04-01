import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kavach_flutter_app/ANPR/anpr_home_page.dart';
import 'package:kavach_flutter_app/ANPR/car_detail.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

class KavachPage extends StatefulWidget {
  KavachPage(this.name, this.t, {super.key});
  final DateTime t;
  final String name;

  @override
  State<KavachPage> createState() => _KavachPageState();
}

class _KavachPageState extends State<KavachPage> {
  final player = AudioPlayer();
  // final player1 = AudioPlayer();

  // Future<void> playSound() async {
  //   await player1.setUrl(...);
  // }

  // @override
  // void dispose() {
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

  final List detections = [
    {'name': 'Sandeep', 'number': '9369204281'},
    {'name': 'Sandeep', 'number': '9369204281'},
  ];

  List<String> flaggedVehicles = [];
  List<int> vis = [];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text('KAVACH'),
        backgroundColor: Colors.grey[800],
        actions: [
          GestureDetector(
            child: Icon(Icons.stop),
            onTap: () {
              player.stop();
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Live Detection Database')
            .snapshots(),
        builder: (context, snapshot) {
          List<QueryDocumentSnapshot<Map<String, dynamic>>> items =
              snapshot.data!.docs;
          var idk;
          for (var i in items) {
            if (i.id == "detected") {
              idk = i;
              break;
            }
          }
          List llist = idk.data()['faces'];
          print(llist);
          if (snapshot.hasData) {
            return Container(
              height: 800,
              child: SingleChildScrollView(
                child: Container(
                  // color: Color(0xff525252),
                  color: Colors.black,
                  height: height,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                        child: Container(
                          width: width,
                          height: height * 0.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/fcrbg.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "DETECTED    FACES",
                              style: GoogleFonts.chakraPetch(
                                fontWeight: FontWeight.w700,
                                fontSize: 33,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: llist.length,
                            itemBuilder: (BuildContext context, int index) {
                              // final detection = widget.detections[index];
                              if (flaggedVehicles.contains(llist[index])) {
                                flaggedVehicles.add(llist[index]);
                              }
                              //

                              // if (vis.length < flaggedVehicles.length) {
                              //   playSound();
                              // }
                              // if(vis.length)
                              // vis.add(0);
                              // if (flaggedVehicles.contains(llist[index])) {
                              //   playSound();
                              //   flaggedVehicles.clear();
                              // }
                              var z = {
                                'name': '${llist[index]}',
                                'number':
                                    "{snapshot.data!.docs[index].get('number')}",
                              };
                              detections.add(z);
                              return Container(
                                margin: EdgeInsets.only(bottom: height * 0.02),
                                color: flaggedVehicles.contains(llist[index])
                                    ? Colors.red
                                    : Colors.white,
                                height: height * 0.1,
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      '${llist[index]}',
                                      style: GoogleFonts.chakraPetch(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Time detected:  ${DateTime.now().toString()}',
                                      style: GoogleFonts.chakraPetch(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.chevron_right,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CarDetailsPage(
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
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddFlaggedVehicleDialog();
        },
        tooltip: 'Add Flagged Vehicle',
        child: Icon(Icons.add),
      ),
    );
  }

  void playSound() async {
    await player.play(AssetSource('alarm.mp3'));
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
                  print(i['name']);
                  if (i['name'] == newFlaggedVehicleNumber) x = true;
                }
                if (x) {
                  Vibration.vibrate(duration: 2000);
                  playSound();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
