import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final String carNumber;
  final List<CarDetails> carDetailsList;

  CarDetailsPage({required this.carNumber, required this.carDetailsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Details'),
      ),
      body: ListView.builder(
        itemCount: carDetailsList.length,
        itemBuilder: (BuildContext context, int index) {
          final carDetails = carDetailsList[index];
          return ListTile(
            title: Text(carDetails.carNumber),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(carDetails.ownerName),
                Text(carDetails.carModel),
                Text(carDetails.carColor),
                Text(carDetails.carType),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CarDetails {
  final String carNumber;
  final String ownerName;
  final String carModel;
  final String carColor;
  final String carType;

  CarDetails({
    required this.carNumber,
    required this.ownerName,
    required this.carModel,
    required this.carColor,
    required this.carType,
  });
}
