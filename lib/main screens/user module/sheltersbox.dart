import 'package:flutter/material.dart';

class SheltersBox extends StatelessWidget {
  SheltersBox({Key? key}) : super(key: key);
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Padding(
      padding: EdgeInsets.only(top: 0, left: width * 0.06,),
      child: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: height*0.055),
            child: Container(
              width: width * 0.88,
              height: 180,
              decoration: BoxDecoration(
                color: Color.fromRGBO(50, 132, 132  , 1),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height*0.06, left: width*0.05),
                    child: Text(
                      "Street animals need\nour protection,\nhelp them today.",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "fred",
                        fontSize: 16.5,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.01, ),
                child: Image.asset("images/cataw.png", scale: 4.5),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.13, left: width*0.45),
            child: Image.asset(
              "images/paws.png",
              scale: 15,
              color: Colors.white,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.057, left: width*0.45),
            child: Image.asset(
              "images/paws.png",
              scale: 15,
              color: Colors.white,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: height*0.19, left: width*0.45),
            child: Image.asset(
              "images/paws.png",
              scale: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
