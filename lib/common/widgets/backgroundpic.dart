import 'package:flutter/material.dart';

class BackPic extends StatelessWidget {
  double x=0;
  BackPic(this.x);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/enterance.jpg",
                ),
                fit: BoxFit.cover)),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(50, 132, 132, x)));
  }
}
