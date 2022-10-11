import 'package:animalcare/common/widgets/animalwidget.dart';
import 'package:animalcare/main%20screens/doctor%20module/doctorappbar.dart';
import 'package:animalcare/main%20screens/user%20module/profilepets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/custombutton.dart';
import '../../common/widgets/shelterinformation.dart';

class AnimalPageView extends StatelessWidget {
  const AnimalPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 241, 245, 1),
      extendBodyBehindAppBar: true,
      appBar: DoctorAppBar("Pets"),
      body: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03, bottom: MediaQuery.of(context).size.height*0.045 ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("animals")
                .get(),
            builder:  (context, AsyncSnapshot snapshot){
              if (snapshot.hasData == false){
                return Center(child: Text("Loading"));
              }
              else {

                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: ( context,  index) {

                    return
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          PetProfile(snapshot.data.docs[index]["name"],
                              snapshot.data.docs[index]["about"],
                              snapshot.data.docs[index]["contact"],
                              snapshot.data.docs[index]["Age"],
                              snapshot.data.docs[index]["price"],
                              snapshot.data.docs[index]["weight"],
                              "images/ncatss.jpg",
                              snapshot.data.docs[index]["petType"])
                          ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:  EdgeInsets.only(
                                left:  MediaQuery.of(context).size.width*0.04,
                                right: MediaQuery.of(context).size.width*0.04,
                                bottom:  MediaQuery.of(context).size.height*0.03),
                            child: AnimalWidget("images/ncatss.jpg", snapshot.data.docs[index]["name"], snapshot.data.docs[index]["contact"],
                                snapshot.data.docs[index]["petType"], CustomButton(
                                    "Go To Maps",
                                    Color.fromRGBO(50, 132, 132, 1),
                                    Colors.white,
                                        () {
                                      launch("tel"+snapshot.data.docs[index]["contact"]);
                                    },
                                    35,
                                    0.3,
                                    14),0,snapshot.data.docs[index]["about"]),
                          ),
                        ),
                      );
                  },

                );
              }
            },
          ),
        ),
      ),
    );
  }
}
