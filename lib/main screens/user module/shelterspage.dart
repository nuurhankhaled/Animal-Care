import 'package:animalcare/common/widgets/custombutton.dart';
import 'package:animalcare/common/widgets/shelterinformation.dart';
import 'package:animalcare/main%20screens/user%20module/userappbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SheltersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromRGBO(239, 241, 245, 1),
      appBar: CustomeAppBar("Shelters",()
      {Navigator.pop(context);}),
      body:Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03, bottom: MediaQuery.of(context).size.height*0.045 ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("shelters")
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
                      Container(

                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding:  EdgeInsets.only(
                              left:  MediaQuery.of(context).size.width*0.04,
                              right: MediaQuery.of(context).size.width*0.04,
                              bottom:  MediaQuery.of(context).size.height*0.03),
                          child: ShelterInformation("images/hey.jpg", snapshot.data.docs[index]["name"], snapshot.data.docs[index]["phone"],
                              snapshot.data.docs[index]["location"], CustomButton(
                                  "Go To Maps",
                                  Color.fromRGBO(50, 132, 132, 1),
                                  Colors.white,
                                      () {
                                    launch("https://maps.google.com/?q="+snapshot.data.docs[index]["latitude"]+ ", " +snapshot.data.docs[index]["longitude"]);
                                  },
                                  35,
                                  0.3,
                                  14),0,snapshot.data.docs[index]["about"]),
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