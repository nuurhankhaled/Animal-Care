import 'package:animalcare/main%20screens/user%20module/pofiledoctor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/card.dart';
import '../../common/widgets/custombutton.dart';
import '../../common/widgets/shelterinformation.dart';
import '../doctor module/doctorappbar.dart';

class DoctorViewPage extends StatefulWidget {
  const DoctorViewPage({Key? key}) : super(key: key);

  @override
  State<DoctorViewPage> createState() => _DoctorViewPageState();
}

class _DoctorViewPageState extends State<DoctorViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 241, 245, 1),
      extendBodyBehindAppBar: true,
      appBar: DoctorAppBar("Volunteering Doctors"),
      body: Padding(
        padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03, bottom: MediaQuery.of(context).size.height*0.045 ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("users").where("type", isEqualTo: "Doctor")
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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DoctorProfile(snapshot.data.docs[index]["name"],
                              snapshot.data.docs[index]["about"],
                              snapshot.data.docs[index]["phone"],
                              snapshot.data.docs[index]["experience"],
                              snapshot.data.docs[index]["price"],
                              snapshot.data.docs[index]["rate"],
                               () { }, "images/Public Opinion Research 1200x666.jpg")));
                        },
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding:  EdgeInsets.only(
                                left:  MediaQuery.of(context).size.width*0.04,
                                right: MediaQuery.of(context).size.width*0.04,
                                bottom:  MediaQuery.of(context).size.height*0.03),
                            child:  Cards(
                              snapshot.data.docs[index]["name"],
                              snapshot.data.docs[index]["about"],
                              snapshot.data.docs[index]["phone"]
                              ,"images/Public Opinion Research 1200x666.jpg",
                              CustomButton(
                                  "Go To chat",
                                  Color.fromRGBO(50, 132, 132, 1),
                                  Colors.white,
                                      () {},
                                  35,
                                  0.3,
                                  14),
                            ),
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
