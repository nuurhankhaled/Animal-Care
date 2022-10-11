import 'package:animalcare/common/widgets/backgroundpic.dart';
import 'package:animalcare/common/widgets/custombutton.dart';
import 'package:animalcare/main%20screens/sharedLayout/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackPic(0.6),
        ListView(

          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.165, left: 30),
              child: Text(
                "The best\napp for\nyour pet",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "fred",
                  fontSize: 60,
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 220),
                child: CustomButton(
                    "SIGN UP", Color.fromRGBO(60, 200, 190, 0.8), Colors.white,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                }, 42,0.75,19),
              ),
            ),
            Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25,bottom: 40),
                  child: CustomButton(
                      "LOG IN",
                      Colors.white.withOpacity(0.9),
                      Colors.black, (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn()));
                  },42,0.75,19
                  ),
                )
            ),
          ],
        )
      ]),
    );
  }
}
