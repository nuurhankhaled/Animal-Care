import 'package:flutter/material.dart';

class LabeledTime extends StatefulWidget {
  const LabeledTime({Key? key}) : super(key: key);

  @override
  State<LabeledTime> createState() => _LabeledTimeState();
}

class _LabeledTimeState extends State<LabeledTime> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    dynamic x = Text("");
    if (now.hour >= 5 && now.hour < 12) {
      setState(() {
        x = Text(
          "  Good Morning!",
          style: TextStyle(
              fontFamily: "fred", color: Colors.pink.shade200, fontSize: 13),
        );
      });
      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.037,
            left: MediaQuery.of(context).size.width * 0.043,
            right: 100),
        child: Container(
          width: 150,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, spreadRadius: 1),
              ]),
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 5),
            child: x,
          ),
        ),
      );
    } else if (now.hour >= 12 && now.hour < 18) {
      setState(() {
        x = Text(
          "  Good Afternoon!",
          style: TextStyle(
              fontFamily: "fred", color: Colors.pink.shade200, fontSize: 13),
        );
      });
      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.037,
            left: MediaQuery.of(context).size.width * 0.043,
            right: 100),
        child: Container(
          width: 150,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, spreadRadius: 1),
              ]),
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 5),
            child: x,
          ),
        ),
      );
    } else {
      setState(() {
        x = Text(
          "    Good Evening!",
          style: TextStyle(
              fontFamily: "fred", color: Colors.pink.shade200, fontSize: 13),
        );
      });
      return Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.037,
            left: MediaQuery.of(context).size.width * 0.043,
            right: 100),
        child: Container(
          width: 150,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black26, spreadRadius: 1),
              ]),
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 5),
            child: x,
          ),
        ),
      );
    }
  }
}
