import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kavach_flutter_app/ANPR/car_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class KavachPage extends StatefulWidget {
  KavachPage(this.name, this.t, {super.key});
  final DateTime t;
  final String name;
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
  State<KavachPage> createState() => _KavachPageState();
}

class _KavachPageState extends State<KavachPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.detections
        .insert(0, FaceRecognitionDetection(widget.name, widget.t));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text('KAVACH'),
        backgroundColor: Colors.grey[800],
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Color(0xff525252),
          color: Colors.black,
          // height: 800,
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
                      image: AssetImage("assetsh/fcrbg.png"),
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.detections.length,
                  itemBuilder: (BuildContext context, int index) {
                    final detection = widget.detections[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      color: Colors.white,
                      height: height * 0.1,
                      child: Center(
                        child: ListTile(
                          title: Text(
                            detection.personName,
                            style: GoogleFonts.chakraPetch(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Time detected: ${DateFormat.yMd().add_jm().format(detection.time)}',
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
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class KavachPage extends StatelessWidget {
//   KavachPage(this.name, this.t);
//   DateTime t;
//   String name;
//   final List<FaceRecognitionDetection> detections = [
//     FaceRecognitionDetection(
//         'John Doe', DateTime.now().subtract(Duration(minutes: 20))),
//     FaceRecognitionDetection(
//         'Jane Smith', DateTime.now().subtract(Duration(minutes: 45))),
//     FaceRecognitionDetection(
//         'Bob Johnson', DateTime.now().subtract(Duration(hours: 1))),
//     FaceRecognitionDetection(
//         'Alice Brown', DateTime.now().subtract(Duration(hours: 2))),
//     FaceRecognitionDetection(
//         'Charlie Green', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'David Lee', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Emily Davis', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Frank White', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Grace Wilson', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Henry Baker', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
//     FaceRecognitionDetection(
//         'Isabelle Taylor', DateTime.now().subtract(Duration(hours: 5))),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('KAVACH'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: 800,
//           child: ListView.builder(
//             shrinkWrap: true,
//             itemCount: detections.length,
//             itemBuilder: (BuildContext context, int index) {
//               final detection = detections[index];
//               return Container(
//                 child: ListTile(
//                   title: Text(detection.personName),
//                   subtitle: Text(
//                       'Time detected: ${DateFormat.yMd().add_jm().format(detection.time)}'),
//                   trailing: IconButton(
//                     icon: Icon(Icons.chevron_right),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CarDetailsPage(
//                             carNumber: "ABC123",
//                             carDetailsList: [
//                               CarDetails(
//                                 carNumber: "ABC123",
//                                 ownerName: "John Doe",
//                                 carModel: "Toyota Corolla",
//                                 carColor: "Blue",
//                                 carType: "Sedan",
//                               ),
//                               CarDetails(
//                                 carNumber: "XYZ456",
//                                 ownerName: "Jane Smith",
//                                 carModel: "Honda Civic",
//                                 carColor: "Red",
//                                 carType: "Coupe",
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class FaceRecognitionDetection {
  final String personName;
  final DateTime time;

  FaceRecognitionDetection(this.personName, this.time);
}
