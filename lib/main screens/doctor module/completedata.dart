import 'dart:io';
import 'dart:typed_data';

import 'package:animalcare/common/widgets/custombutton.dart';
import 'package:animalcare/common/widgets/util.dart';
import 'package:animalcare/main%20screens/doctor%20module/doctorappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/widgets/textfield.dart';
import '../sharedLayout/login.dart';

class CompleteData extends StatefulWidget {

  @override
  State<CompleteData> createState() => _CompleteDataState();
}

class _CompleteDataState extends State<CompleteData> {
  dynamic profileImage;
  String currentID = FirebaseAuth.instance.currentUser!.uid;
  final formKey = GlobalKey<FormState>();
  TextEditingController? aboutFieldController = TextEditingController();
  TextEditingController? rateFieldController = TextEditingController();
  TextEditingController? priceFieldController = TextEditingController();
  TextEditingController? experienceFieldController = TextEditingController();
  dynamic b;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 241, 245, 1),
      appBar: DoctorAppBar("Hi, complete your data"),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.03 ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.29,
                            decoration:  BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.transparent,
                            ),
                            child : profileImage== null? ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset("images/doctorprofile.png",)): ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.file(File(profileImage), fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.23,
                            left:MediaQuery.of(context).size.width * 0.39 ),
                            child: Container(
                              width: 58,
                              height: 58,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                color: const Color.fromRGBO(239, 241, 245, 1),
                                width: 5
                              )
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: IconButton(
                                  onPressed: () async {
                              ImagePicker a = new ImagePicker();
                              b = await a.getImage(source: ImageSource.gallery );
                              setState(() {
                              Image.file(File(b.path));
                              profileImage=b.path ;

                              });
                              },
                                  icon: Icon(Icons.camera_alt,color: Colors.grey.shade600,size: 31,),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.04,
                        left: MediaQuery.of(context).size.width * 0.11,
                        right: MediaQuery.of(context).size.width * 0.11),
                    child: FormFields(
                        "About",
                      const   Icon(Icons.type_specimen_outlined),
                        null,
                        false,
                        aboutFieldController!),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02 ,
                        left: MediaQuery.of(context).size.width * 0.11,
                        right: MediaQuery.of(context).size.width * 0.11),
                    child: FormFields("Rate", const Icon(Icons.star_rate_rounded),
                        null, false, rateFieldController!),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02 ,
                        left: MediaQuery.of(context).size.width * 0.11,
                        right: MediaQuery.of(context).size.width * 0.11),
                    child: FormFields("Price", const Icon(Icons.monetization_on_rounded),
                        null, false, priceFieldController!),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02 ,
                        left: MediaQuery.of(context).size.width * 0.11,
                        right: MediaQuery.of(context).size.width * 0.11),
                    child: FormFields("Experience", const Icon(Icons.work),
                        null, false, experienceFieldController!),
                  ),
                  Padding(
                     padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3),
                    child: CustomButton(
                        "Submit",  const Color.fromRGBO(1, 129, 122, 1), Colors.white, () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(currentID)
                            .update(<String, dynamic>{
                          'rate': rateFieldController!.text,
                          "photo": b.path,
                          "about": aboutFieldController!.text,
                          "price" : priceFieldController!.text,
                          "experience" : experienceFieldController!.text,
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (_) => LogIn()));
                      }
                    }, 45, 60, 20),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
