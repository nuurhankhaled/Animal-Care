import 'package:animalcare/common/widgets/card.dart';
import 'package:animalcare/common/widgets/guidecontainer.dart';
import 'package:animalcare/main%20screens/user%20module/doctorpageview.dart';
import 'package:animalcare/main%20screens/user%20module/shelterspage.dart';
import 'package:animalcare/main%20screens/user%20module/sheltersbox.dart';
import 'package:animalcare/main%20screens/user%20module/time.dart';
import 'package:animalcare/main%20screens/user%20module/trainingviewPage.dart';
import 'package:animalcare/resources/authentication_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/custombutton.dart';
import '../sharedLayout/login.dart';
import 'guide.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.elliptical(90, 80)),
                    child: Image.asset(
                      "images/enter.jpg",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LabeledTime(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.037,
                          right: MediaQuery.of(context).size.width * 0.08),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            String output =
                                await authenticationMethods.logOutUser();
                            if (output == 'success') {
                              Navigator.of(context, rootNavigator: true)
                                  .pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return LogIn();
                                  },
                                ),
                                (_) => false,
                              );
                            }
                          },
                          icon: const Icon(
                            Icons.logout_rounded,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 90.0, right: MediaQuery.of(context).size.width * 0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SheltersPage()));
                      },
                      child: SheltersBox()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0, left: 15, right: 15),
              child: Container(
                height: 305,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: Colors.black12, width: 2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          left: MediaQuery.of(context).size.width * 0.04),
                      child: Text(
                        "  Guide",
                        style: TextStyle(
                            fontFamily: "fred",
                            color: Colors.pink.shade200,
                            fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 250,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GuideAnimal(
                                            "images/cats.png",
                                            "A cat's life expectancy will depend on many factors, "
                                                "including health, diet and their environment,"
                                                " but the average lifespan for a domestic cat is about 12-14 years."
                                                " However, some pet cats can live to be around 20 years old.",
                                            "Advices for Cat Owners:",
                                            "- Feed your cat healthy food.\n\n"
                                                "- Choose suitable food dishes and water bowls.\n\n"
                                                "- Have a litter box (and accessories) ready to go.\n\n"
                                                "- Brush your cat regularly.\n\n"
                                                "- Bathe your cat (but not too often).\n\n"
                                                "- Keep your cat's claws trimmed.\n\n"
                                                "- Find a good veterinarian.\n\n"
                                                "- Teach children how to treat your cat.\n\n"
                                                "- Give your cat a place to nap.",
                                            0.1319)));
                              },
                              child: GuideContainer("images/catt.png", "Cats",
                                  Colors.deepOrange.shade100, 8, 2, 32)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GuideAnimal(
                                            "images/dogs.png",
                                            "The dog or domestic dog is a domesticated descendant of the wolf. The dog is derived from an ancient, extinct wolf, and the modern wolf is the dog's nearest living relative. The dog was the first species to be domesticated, by hunter-gatherers over 15,000 years ago, before the development of agriculture.",
                                            "Advices for Dog Owners:",
                                            "- Dog Training is Essential.\n\n"
                                                "- Get Ready for Health Problems.\n\n"
                                                "- Choose the Right Dog Food.\n\n"
                                                "- Stock Up on Dog Supplies.\n\n"
                                                "- Bathe your Dog.\n\n"
                                                "- Keep your dog's claws trimmed.\n\n"
                                                "- Find a good veterinarian.\n\n"
                                                "- Meet Your Dog's Basic Needs.\n\n"
                                                "- Give your dog a place to nap.",
                                            0.099)));
                              },
                              child: GuideContainer("images/dogg.png", "Dogs",
                                  Colors.purple.shade200, 20, 18, 19)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GuideAnimal(
                                            "images/tur.png",
                                            "Turtles are an order of reptiles known as Testudines, characterized by a shell developed mainly from their ribs. Modern turtles are divided into two major groups, the side-necked turtles and Cryptodira, which differ in the way the head retracts.",
                                            "Advices for Turtles Owners:",
                                            "- Find Out How Much Your Turtle Should Hibernate.\n\n"
                                                "- Provide Food.\n\n"
                                                "- Clean Tank and Change Water Frequently.\n\n"
                                                "- Do Not Play with Your Turtle Often.\n\n"
                                                "- Set Up a Tank.\n\n"
                                                "- Set Up Temperature Control.\n\n"
                                                "- Wash Your Hands.\n\n"
                                                "- Teach children how to treat your turtle.\n\n"
                                                "- Give your turtle a place to nap.",
                                            0)));
                              },
                              child: GuideContainer("images/turtle.png",
                                  "Turtles", Colors.green.shade100, 7, 2, 98)),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GuideAnimal(
                                            "images/bir.png",
                                            "Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton.",
                                            "Advices for Birds Owners:",
                                            "- Select the Right Cage.\n\n"
                                                "- Buy Essential Accessories.\n\n"
                                                "- Keep the Cage Clean.\n\n"
                                                "- Feeding Your Bird.\n\n"
                                                "- Providing Entertainment.\n\n"
                                                "- Keep your bird's nails trimmed.\n\n"
                                                "- Give Your Bird Privacy.\n\n"
                                                "- Teach children how to treat your bird.\n\n"
                                                "- Find an experienced avian veterinarian.",
                                            0)));
                              },
                              child: GuideContainer("images/bird.png", "Birds",
                                  Colors.indigo.shade100, 6.9, 17, 35)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35.0, left: 7, right: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20,
                              left: MediaQuery.of(context).size.width * 0.04),
                          child: const Text(
                            "  Volunteering Doctors",
                            style: TextStyle(
                                fontFamily: "fred",
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorViewPage()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 25,
                                right:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: Text(
                              "view all",
                              style: TextStyle(
                                  fontFamily: "fred",
                                  color: Color.fromRGBO(50, 132, 132, 1),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 405,
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
                                itemCount: 2,
                                itemBuilder: ( context,  index) {
                                  String img =snapshot.data.docs[index]["photo"];
                                  img.replaceAll(' ', '');
                                  print(img);
                                  return
                                    Container(

                                    width: MediaQuery.of(context).size.width,
                                    child: Cards(
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
                                  );
                                },

                              );
                            }
                          },

                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 35.0, left: 7, right: 10, bottom: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 20,
                              left: MediaQuery.of(context).size.width * 0.04),
                          child: Text(
                            "  Ttain your Dog",
                            style: TextStyle(
                                fontFamily: "fred",
                                color: Colors.black,
                                fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrainigPlaces()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 25,
                                right:
                                    MediaQuery.of(context).size.width * 0.05),
                            child: Text(
                              "view all",
                              style: TextStyle(
                                  fontFamily: "fred",
                                  color: Color.fromRGBO(50, 132, 132, 1),
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 420,
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
                              itemCount: 2,
                              itemBuilder: ( context,  index) {

                                return
                                  Padding(
                                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025),
                                    child: Container(

                                      width: MediaQuery.of(context).size.width,
                                      child: Cards(
                                        snapshot.data.docs[index]["name"],
                                        snapshot.data.docs[index]["about"],
                                        snapshot.data.docs[index]["phone"]
                                        ,"images/shelter.jpg",
                                        CustomButton(
                                            "Go To maps",
                                            Color.fromRGBO(50, 132, 132, 1),
                                            Colors.white,
                                                () {
                                                  launch("https://maps.google.com/?q="+snapshot.data.docs[index]["latitude"]+ ", " +snapshot.data.docs[index]["longitude"]);

                                                },
                                            35,
                                            0.3,
                                            14),
                                      ),
                                    ),
                                  );
                              },

                            );
                          }
                        },
                      ),
                    ),
                  ]),
            ),

          ],
        ),
      ),
    );
  }
}