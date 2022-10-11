import 'dart:io';

import 'package:animalcare/common/widgets/util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/widgets/custombutton.dart';
import '../../common/widgets/textfield.dart';
import '../doctor module/doctorappbar.dart';

class SaleAPet extends StatefulWidget {
  SaleAPet({Key? key}) : super(key: key);

  @override
  State<SaleAPet> createState() => _SaleAPetState();
}

class _SaleAPetState extends State<SaleAPet> {
  TextEditingController name = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController contact = TextEditingController();

  dynamic profileImage;

  dynamic b;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(239, 241, 245, 1),
      appBar: DoctorAppBar("Add New Pet:"),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.21,
                        decoration: BoxDecoration(
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
                        child: profileImage == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.asset(
                                  "images/avatar.png",
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(150),
                                child: Image.file(File(profileImage),
                                    fit: BoxFit.cover)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.16,
                            left: MediaQuery.of(context).size.width * 0.29),
                        child: Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: const Color.fromRGBO(239, 241, 245, 1),
                                  width: 5)),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                              onPressed: () async {
                                ImagePicker a = new ImagePicker();
                                b = await a.getImage(source: ImageSource.gallery);
                                setState(() {
                                  Image.file(File(b.path));
                                  profileImage = b.path;
                                });
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.grey.shade600,
                                size: 31,
                              ),
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
                    top: MediaQuery.of(context).size.height * 0.021,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields("Pet name", Icon(Icons.type_specimen_rounded),
                    null, false, name),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields("Pet Type",
                    Icon(Icons.featured_play_list_rounded), null, false, type),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields(
                    "Pet Age", Icon(Icons.numbers_outlined), null, false, age),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields("Pet Price",
                    Icon(Icons.monetization_on_rounded), null, false, price),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields(
                    "Pet Gender", Icon(Icons.transgender), null, false, gender),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields("Pet Weight",
                    Icon(Icons.monitor_weight_outlined), null, false, weight),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields(
                    "About Pet", Icon(Icons.feed), null, false, about),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.017,
                    left: MediaQuery.of(context).size.width * 0.07,
                    right: MediaQuery.of(context).size.width * 0.07),
                child: FormFields(
                    "For Contact", Icon(Icons.phone_android), null, false, contact),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03,
                    left: MediaQuery.of(context).size.width * 0.3,
                    right: MediaQuery.of(context).size.width * 0.3,
                    bottom: MediaQuery.of(context).size.height * 0.035),
                child: CustomButton("Submit",
                    const Color.fromRGBO(1, 129, 122, 1), Colors.white, () {
                  if (formKey.currentState != null &&
                      formKey.currentState!.validate()) {
                    FirebaseFirestore.instance
                        .collection("animals")
                        .add(<String, dynamic>{
                      "photo": b.path,
                      "name": name.text,
                      "petType": type.text,
                      "Age": age.text,
                      "price": price.text,
                      "gender": gender.text,
                      "weight": weight.text,
                      "about": about.text,
                      "contact": contact.text
                    });
                    name.clear();
                    type.clear();
                    age.clear();
                    price.clear();
                    gender.clear();
                    weight.clear();
                    about.clear();
                    contact.clear();
                    setState(() {
                      profileImage = null;
                    });
                  }
                }, 45, 60, 20),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
