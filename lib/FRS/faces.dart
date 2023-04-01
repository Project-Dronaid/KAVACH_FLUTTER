import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kavach_flutter_app/ANPR/car_detail.dart';

class KavachPage extends StatelessWidget {
  final List<FaceRecognitionDetection> detections = [
    FaceRecognitionDetection(
        'John Doe', DateTime.now().subtract(Duration(minutes: 20))),
    FaceRecognitionDetection(
        'Jane Smith', DateTime.now().subtract(Duration(minutes: 45))),
    FaceRecognitionDetection(
        'Bob Johnson', DateTime.now().subtract(Duration(hours: 1))),
    FaceRecognitionDetection(
        'Alice Brown', DateTime.now().subtract(Duration(hours: 2))),
    FaceRecognitionDetection(
        'Charlie Green', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'David Lee', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Emily Davis', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Frank White', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Grace Wilson', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Henry Baker', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
    FaceRecognitionDetection(
        'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KAVACH'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: detections.length,
            itemBuilder: (BuildContext context, int index) {
              final detection = detections[index];
              return Container(
                child: ListTile(
                  title: Text(detection.personName),
                  subtitle: Text(
                      'Time detected: ${DateFormat.yMd().add_jm().format(detection.time)}'),
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
    );
  }
}

class FaceRecognitionDetection {
  final String personName;
  final DateTime time;

  FaceRecognitionDetection(this.personName, this.time);
}
