import 'package:flutter/material.dart';
import 'package:kavach_flutter_app/ANPR/car_detail.dart';
import 'package:vibration/vibration.dart';

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
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: detections.length,
            itemBuilder: (BuildContext context, int index) {
              final detection = detections[index];
              return Container(
                color:
                    flaggedVehicles.contains(detection['carNumber'].toString())
                        ? Colors.red
                        : Colors.white,
                child: ListTile(
                  title: Text(
                      "Number of cars detected: ${detection['carNumber']}"),
                  subtitle: Text("Time detected: ${DateTime.now().toString()}"),
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
