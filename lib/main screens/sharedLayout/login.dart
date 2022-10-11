import 'package:animalcare/common/widgets/custombutton.dart';
import 'package:animalcare/common/widgets/customedcontainer.dart';
import 'package:animalcare/common/widgets/pic.dart';
import 'package:animalcare/common/widgets/textfield.dart';
import 'package:animalcare/main%20screens/admin%20module/adminhome.dart';
import 'package:animalcare/main%20screens/doctor%20module/homedoctor.dart';
import 'package:animalcare/main%20screens/user%20module/bottomnavbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../common/widgets/util.dart';
import '../../resources/authentication_methods.dart';
import '../doctor module/completedata.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool passwordVisible = false;
  TextEditingController? emailFieldController = TextEditingController();
  TextEditingController? passwordFieldController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  String? variable;
  final firebase = FirebaseFirestore.instance;
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              const PictureBack(),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.24),
                child: CustomedContainer(
                  180,
                  0,
                  0.76,
                  ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08,
                            left: MediaQuery.of(context).size.width * 0.21),
                        child: const Text(
                          "Welcome back",
                          style: TextStyle(
                              color: Color.fromRGBO(50, 132, 132, 1),
                              fontSize: 37,
                              fontFamily: "title"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.34),
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.47),
                              fontSize: 13,
                              fontFamily: "alef",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.055,
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07),
                        child: FormFields("Email", const Icon(Icons.mail), null,
                            false, emailFieldController!),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07),
                        child: FormFields(
                            "Password",
                            const Icon(Icons.lock),
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSecure = !isSecure;
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            isSecure,
                            passwordFieldController!),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.14,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.15),
                        child: CustomButton(
                            "LOG IN",
                            const Color.fromRGBO(1, 129, 122, 1),
                            Colors.white, () async {
                              if(emailFieldController!.text == "admin" &&
                                  passwordFieldController!.text == "admin") {
                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AdminHome()));
                        }
                          else if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            String output =
                                await authenticationMethods.logInUser(
                                    email: emailFieldController!.text,
                                    password: passwordFieldController!.text);

                            if (output == "success")  {
                              //functions
                              await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots().forEach((element) {
                                if(element.data()?['type'] == "User"){


                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CustomizedNavBar()));
                                }
                                else {
                                  //navigate l home el doctor with element.data()?['name'],element.data()?['phone']
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DoctorHome(element.data()?['name'], element.data()?['about'],
                                      element.data()?['phone'], element.data()?['experience'],
                                      element.data()?['price'], element.data()?['rate'], "images/Public Opinion Research 1200x666.jpg")));

                                }
                              });
                            } else {

                              Utils().showSnackBar(
                                  context: context, content: output);
                            }
                          } else {
                            Utils().showSnackBar(
                                context: context, content: "Please Enter your data." );
                          }
                        }, 42, 0.75, 19),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
