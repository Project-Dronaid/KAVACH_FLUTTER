import 'package:flutter/material.dart';
import 'package:kavach_flutter_app/FRS/faces.dart';

class CybersecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/1124560262/vector/facial-recognition-system-concept-face-recognition-3d-scanning-face-id-vector-wireframe.jpg?s=612x612&w=is&k=20&c=2BvYCu_Je2M7WwQSqG5uKkv79TJt9Aa8m1CdbGOXv3g=',
              height: 500,
              width: 500,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => KavachPage("Harsh", DateTime.now())));
              },
              child: Text('Go to FRS'),
            ),
            
          ],
        ),
      ),
    );
  }
}
