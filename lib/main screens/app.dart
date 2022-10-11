import 'package:animalcare/main%20screens/sharedLayout/login.dart';
import 'package:animalcare/main%20screens/sharedLayout/splash.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const  Color.fromRGBO(1, 129, 122, 1),
          background:  const Color.fromRGBO(239, 241, 245, 1),
      ),
      ),

      debugShowCheckedModeBanner: false,
      home: const SplashS(),
    );
  }
}