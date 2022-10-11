import 'package:animalcare/main%20screens/sharedLayout/firstscreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashS extends StatelessWidget {
  const SplashS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2500,
      backgroundColor: Color.fromRGBO(50, 132, 132  , 1),
      splash: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.19),
            child: Image.asset("images/splash.png",
                width: 250,height: 250, color: Colors.white, ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Text("ANIMAL CARE", style: TextStyle(
                fontFamily: "title",color: Colors.white, fontSize: 33

              ),),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.17),
            child: SpinKitFadingCircle(
              color: Colors.white,
              size: 55,
            ),
          ),
        ],
      ),
      nextScreen: FirstScreen(),
      splashIconSize: MediaQuery.of(context).size.height*0.9,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}
