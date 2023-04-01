import 'package:flutter/material.dart';

class FRSDetail extends StatefulWidget {
  const FRSDetail(this.name, {super.key});
  final String name;

  @override
  State<FRSDetail> createState() => _FRSDetailState();
}

class _FRSDetailState extends State<FRSDetail> {
  List<String> redList = ["Sandeep", "Harsh"];
  bool isWanted = false;
  @override
  Widget build(BuildContext context) {
    for (var i in redList) {
      if (i == widget.name) {
        isWanted = true;
        break;
      }
    }
    return Container(
      color: isWanted==true ? Colors.red: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
