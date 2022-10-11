import 'package:flutter/material.dart';

class GuideContainer extends StatelessWidget {
  String pic ="";
  dynamic color = Colors.black87;
  String name = "";
  double z,x,y;

  GuideContainer(this.pic,this.name,this.color,this.z,this.x,this.y);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0,right: 3),
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 13),
                  child: Container(
                    width: 80,
                    height: 92,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:x,top: y),
                  child: Image.asset(pic,scale: z,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0,left: 10),
              child: Text(
                name,
                style: TextStyle(fontFamily: "title",
                    color: Colors.black,
                    fontSize: 17
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
