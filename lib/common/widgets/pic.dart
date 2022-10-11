import 'package:flutter/material.dart';

class PictureBack extends StatelessWidget {
  const PictureBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Image.asset(
        "images/enterance.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
