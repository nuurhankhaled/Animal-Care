import 'dart:io';

import 'package:animalcare/common/widgets/textfield.dart';
import 'package:animalcare/main%20screens/doctor%20module/doctorappbar.dart';
import 'package:animalcare/main%20screens/sharedLayout/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../common/widgets/custombutton.dart';
import '../../common/widgets/util.dart';
import '../../main.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  TextEditingController nameH = TextEditingController();

  TextEditingController phoneH = TextEditingController();

  TextEditingController latitudeH = TextEditingController();

  TextEditingController longitudeH = TextEditingController();
  TextEditingController locationS = TextEditingController();
  TextEditingController aboutS = TextEditingController();
  TextEditingController aboutT = TextEditingController();
  TextEditingController locationT = TextEditingController();

  TextEditingController nameS = TextEditingController();

  TextEditingController phoneS = TextEditingController();

  TextEditingController latitudeS = TextEditingController();

  TextEditingController longitudeS = TextEditingController();

  TextEditingController nameT = TextEditingController();

  TextEditingController phoneT = TextEditingController();

  TextEditingController latitudeT = TextEditingController();

  TextEditingController longitudeT = TextEditingController();

  dynamic shelterImage;

  dynamic shelter;

  dynamic trainImage;

  dynamic train;

  final formKeyS = GlobalKey<FormState>();

  final formKeyH = GlobalKey<FormState>();

  final formKeyT = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DoctorAppBar("Add New Data:"),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.040,
                      left: MediaQuery.of(context).size.width * 0.07),
                  child: const Text(
                    "Add New Shelter: ",
                    style: TextStyle(
                        fontFamily: "title",
                        color: Color.fromRGBO(1, 129, 122, 1),
                        fontSize: 20),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.0,
                      right: MediaQuery.of(context).size.width * 0.1),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 2.5,
                          ),
                        ]),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.grey.shade600,
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Form(
              key: formKeyS,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.02 ,
                         ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.21,
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
                            child : shelterImage== null? ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset("images/default.png",fit: BoxFit.fitHeight,)): ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.file(File(shelterImage), fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.151,
                                left:MediaQuery.of(context).size.width * 0.3 ),
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
                                    shelter = await a.getImage(source: ImageSource.gallery );
                                    setState(() {
                                      Image.file(File(shelter.path));
                                      shelterImage=shelter.path ;
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
                        top: MediaQuery.of(context).size.height * 0.015,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields("Shelter name",
                        Icon(Icons.type_specimen_rounded), null, false, nameS),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields("Shelter phone",
                        Icon(Icons.phone_iphone_outlined), null, false, phoneS),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "Latitude",
                        Icon(Icons.location_on_rounded),
                        null,
                        false,
                        latitudeS),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "longitude",
                        Icon(Icons.location_on_rounded),
                        null,
                        false,
                        longitudeS),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "location",
                        Icon(Icons.location_on_outlined),
                        null,
                        false,
                        locationS),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "About",
                        Icon(Icons.tag_rounded),
                        null,
                        false,
                        aboutS),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3),
              child: CustomButton(
                  "Submit", const Color.fromRGBO(1, 129, 122, 1), Colors.white,
                  () {
                if (formKeyS.currentState != null &&
                    formKeyS.currentState!.validate()) {
                  FirebaseFirestore.instance.collection("shelters").add(<String, dynamic>{
                    "name": nameS.text,
                    "phone": phoneS.text,
                    "latitude": latitudeS.text,
                    "longitude": longitudeS.text,
                    "photo": shelter.path,
                    "location" : locationS.text,
                    "about" : aboutS.text
                  });
                  phoneS.clear();
                  latitudeS.clear();
                  longitudeS.clear();
                  nameS.clear();
                  locationS.clear();
                  aboutS.clear();
                  setState(() {
                    shelterImage=null;
                  });
                  Utils().showSnackBar(
                      context: context,
                      content: "Data entered successfully");
                } else
                  Utils().showSnackBar(
                      context: context,
                      content: "Plase enter Data, its cannot be empty.");
              }, 45, 60, 20),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.040,
                  left: MediaQuery.of(context).size.width * 0.07),
              child: const Text(
                "Add New Hospital: ",
                style: TextStyle(
                    fontFamily: "title",
                    color: Color.fromRGBO(1, 129, 122, 1),
                    fontSize: 20),
              ),
            ),
            Form(
              key: formKeyH,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.015,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields("Hospital name",
                        Icon(Icons.type_specimen_rounded), null, false, nameH),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields("Hospital phone",
                        Icon(Icons.phone_iphone_outlined), null, false, phoneH),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "Latitude",
                        Icon(Icons.location_on_rounded),
                        null,
                        false,
                        latitudeH),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "longitude",
                        Icon(Icons.location_on_rounded),
                        null,
                        false,
                        longitudeH),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3),
              child: CustomButton(
                  "Submit", const Color.fromRGBO(1, 129, 122, 1), Colors.white,
                  () {
                if (formKeyH.currentState != null &&
                    formKeyH.currentState!.validate()) {
                  FirebaseFirestore.instance
                      .collection("hospitals")
                      .add(<String, dynamic>{
                    "name": nameH.text,
                    "phone": phoneH.text,
                    "latitude": latitudeH.text,
                    "longitude": longitudeH.text,
                  });
                  phoneH.clear();
                  latitudeH.clear();
                  longitudeH.clear();
                  nameH.clear();
                  Utils().showSnackBar(
                      context: context,
                      content: "Data entered successfully");
                } else
                  Utils().showSnackBar(
                      context: context,
                      content: "Plase enter Data, its cannot be empty.");
              }, 45, 60, 20),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.040,
                  left: MediaQuery.of(context).size.width * 0.07),
              child: const Text(
                "Add New Training place: ",
                style: TextStyle(
                    fontFamily: "title",
                    color: Color.fromRGBO(1, 129, 122, 1),
                    fontSize: 20),
              ),
            ),
            Form(
              key: formKeyT,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding:  EdgeInsets.only( top:MediaQuery.of(context).size.height * 0.02 ,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            height: MediaQuery.of(context).size.height * 0.21,
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
                            child : trainImage== null? ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset("images/default.png",fit: BoxFit.fitHeight,)): ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.file(File(trainImage), fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.151,
                                left:MediaQuery.of(context).size.width * 0.3 ),
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
                                    train = await a.getImage(source: ImageSource.gallery );
                                    setState(() {
                                      String i ='';
                                      Image.file(File(train.path));
                                      trainImage=train.path ;
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
                        top: MediaQuery.of(context).size.height * 0.015,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields("place name",
                        Icon(Icons.type_specimen_rounded), null, false, nameT),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields("place phone",
                        Icon(Icons.phone_iphone_outlined), null, false, phoneT),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "Latitude",
                        Icon(Icons.location_on_rounded),
                        null,
                        false,
                        latitudeT),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "longitude",
                        Icon(Icons.location_on_rounded),
                        null,
                        false,
                        longitudeT),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "location",
                        Icon(Icons.location_on_outlined),
                        null,
                        false,
                        locationT),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07),
                    child: FormFields(
                        "About",
                        Icon(Icons.tag_rounded),
                        null,
                        false,
                        aboutT),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.04,
                  left: MediaQuery.of(context).size.width * 0.3,
                  right: MediaQuery.of(context).size.width * 0.3,
                  bottom: MediaQuery.of(context).size.height * 0.06),
              child: CustomButton(
                  "Submit", const Color.fromRGBO(1, 129, 122, 1), Colors.white,
                  () {
                if (formKeyT.currentState != null &&
                    formKeyT.currentState!.validate()) {
                  FirebaseFirestore.instance.collection("train").add( <String, dynamic>{
                    "name": nameT.text,
                    "phone": phoneT.text,
                    "latitude": latitudeT.text,
                    "longitude": longitudeT.text,
                    "photo": train.path,
                    "location" : locationT.text,
                    "about" : aboutT.text,
                  });
                  phoneT.clear();
                  latitudeT.clear();
                  longitudeT.clear();
                  nameT.clear();
                  locationT.clear();
                  aboutT.clear();
                  setState(() {
                    trainImage=null;
                  });
                  Utils().showSnackBar(
                      context: context,
                      content: "Data entered successfully");
                } else
                  Utils().showSnackBar(
                      context: context,
                      content: "Plase enter Data, its cannot be empty.");
              }, 45, 60, 20),
            ),
          ]),
        ),
      ),
    );
  }
}
