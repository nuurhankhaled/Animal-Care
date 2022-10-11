import 'package:flutter/material.dart';

class CustomedContainer extends StatelessWidget {
  double x=0,y=0;
  dynamic child;
  double height=0;
  CustomedContainer(this.x,this.y,this.height,this.child);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.only(topLeft: Radius.circular(x), topRight: Radius.circular(y)),
        ),
        child:child,
    );
  }
}
