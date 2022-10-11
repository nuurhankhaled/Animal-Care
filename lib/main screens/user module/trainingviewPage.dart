import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/custombutton.dart';
import '../../common/widgets/shelterinformation.dart';
import '../doctor module/doctorappbar.dart';

class TrainigPlaces extends StatelessWidget {
  const TrainigPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 241, 245, 1),
     extendBodyBehindAppBar: true,
      appBar: DoctorAppBar("Training Places"),
      body: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03, bottom: MediaQuery.of(context).size.height*0.045 ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("train")
                .get(),
            builder:  (context, AsyncSnapshot snapshot){
              if (snapshot.hasData == false){
                return Center(child: Text("data"));
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
                          child: ShelterInformation("images/shelter.jpg", snapshot.data.docs[index]["name"], snapshot.data.docs[index]["phone"],
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
