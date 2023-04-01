// import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:kavach_flutter_app/ANPR/car_detail.dart';
import 'package:vibration/vibration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final player = AudioPlayer();
late QuerySnapshot x;
Future<QuerySnapshot> fetchDataFromFirestore(String collectionName) async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection(collectionName);
  QuerySnapshot querySnapshot = await collectionRef.get();
  x = querySnapshot;
  return querySnapshot;
}

class AnprHomePage extends StatefulWidget {
  @override
  State<AnprHomePage> createState() => _AnprHomePageState();
}

class _AnprHomePageState extends State<AnprHomePage> {
  final List detections = [
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
    {
      'carNumber': "ABC123",
      'ownerName': "John Doe",
      'carModel': "Toyota Corolla",
      'carColor': "Blue",
      'carType': "Sedan",
    },
  ];

  List<String> flaggedVehicles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(
        future: fetchDataFromFirestore('Flagged Database'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                height: 800,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var z = {
                      'carNumber': "ABC123",
                      'ownerName': '${snapshot.data!.docs[index].get('name')}',
                      'carModel': "Toyota Corolla",
                      'carColor': "Blue",
                      'carType': "Sedan",
                    };
                    detections.add(z);

                    final detection = detections[index];
                    if (flaggedVehicles.length > index)
                      print('flagged' + flaggedVehicles[index]);
                    print(detection['ownerName'].toString());
                    if (flaggedVehicles.contains(
                        snapshot.data!.docs[index].get('name').toString())) {}
                    return Container(
                      color: flaggedVehicles.contains(
                              snapshot.data!.docs[index].get('name').toString())
                          ? Colors.red
                          : Colors.white,
                      child: ListTile(
                        title: Text(
                            "Number of cars detected: ${snapshot.data!.docs[index].get('name')}"),
                        subtitle:
                            Text("Time detected: ${DateTime.now().toString()}"),
                        trailing: IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () {
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
                        ),
                      ),
                    );
                  },
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
                  if (i['ownerName'] == newFlaggedVehicleNumber) x = true;
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
