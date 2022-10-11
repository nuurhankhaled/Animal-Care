import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/widgets/customedcontainer.dart';

class PetProfile extends StatelessWidget {
  String name;
  String about;
  String number;
  String age;
  String price;
  String weight;
  String photo;
  String type;
  PetProfile(this.name,this.about, this.number, this.age,this.price,this.weight,this.photo,this.type);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: Image.asset(
                    photo, //profile photo
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                      left: MediaQuery.of(context).size.height * 0.019),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 132, 132, 0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
                  child: CustomedContainer(
                      60,
                      60,
                      0.6,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width * 0.05,
                                        left: MediaQuery.of(context).size.width * 0.06,
                                        top: MediaQuery.of(context).size.height * 0.06),
                                    child: Text(name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontFamily: "alef",
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width * 0.05,
                                        left: MediaQuery.of(context).size.width * 0.1,
                                        top: MediaQuery.of(context).size.height * 0.01),
                                    child: Text(type,
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 10,
                                          fontFamily: "alef",
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.34,
                                    top: MediaQuery.of(context).size.height*0.04),
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.3,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromRGBO(50, 132, 132, 1),
                                          Color.fromRGBO(50, 132, 132, 0.7),
                                          Color.fromRGBO(50, 132, 132, 1)],
                                      )),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width*0.05,
                                    height: 50,
                                    onPressed: (){
                                      launch("tel:"+number);
                                    },
                                    child: Text("Contact",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "fred",
                                          fontSize: 12
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.085,
                                left: MediaQuery.of(context).size.width * 0.085,
                                top: MediaQuery.of(context).size.height * 0.03
                            ),
                            child: Text("About",
                              style: TextStyle(
                                  color: Color.fromRGBO(50, 132, 132, 1),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "fred",
                                  fontSize: 17
                              ),),),

                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.13,
                              left: MediaQuery.of(context).size.width * 0.13,
                              top: MediaQuery.of(context).size.height * 0.02,
                              bottom: MediaQuery.of(context).size.height * 0.03,
                            ),
                            child: Text(about,
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.7),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "alef",
                                  fontSize: 15
                              ),),),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.009,
                                    left: MediaQuery.of(context).size.width * 0.125,
                                    right: MediaQuery.of(context).size.width * 0.01),
                                child: Icon(
                                  Icons.phone,
                                  size: 20,
                                  color: Colors.black87,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height * 0.006,
                                    left: MediaQuery.of(context).size.width * 0.015,
                                    right: MediaQuery.of(context).size.width * 0.01),
                                child: Text(
                                  number,
                                  style: TextStyle(
                                      color: Colors.black87.withOpacity(0.7),
                                      fontFamily: "alef",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                Padding(
                                  padding:EdgeInsets.only(

                                    left: MediaQuery.of(context).size.width * 0.085 ,
                                    top: MediaQuery.of(context).size.height * 0.015,
                                  ),
                                  child: Column(

                                    children: [
                                      Text("Age"),
                                      Container(
                                        width: 75,
                                        height: 75,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(age, style: TextStyle(
                                              fontFamily: "title",
                                              fontSize: 25,
                                              color: Colors.black
                                          ),),
                                        ),
                                      ),
                                    ],
                                  ),),


                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                                  child: Container(
                                    width: 2,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding:EdgeInsets.only(

                                    top: MediaQuery.of(context).size.height * 0.015,
                                  ),
                                  child: Column(
                                    children: [
                                      Text("price"),
                                      Container(
                                        width: 75,
                                        height: 75,

                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(price, style: TextStyle(
                                              fontFamily: "title",
                                              fontSize: 25,
                                              color: Colors.black
                                          ),),
                                        ),
                                      ),
                                    ],
                                  ),),


                                Padding(
                                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                                  child: Container(
                                    width: 2,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                  ),
                                ),


                                Padding(
                                  padding:EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width * 0.085,
                                    top: MediaQuery.of(context).size.height * 0.015,
                                  ),
                                  child: Column(
                                    children: [
                                      Text("weight"),
                                      Container(
                                        width: 75,
                                        height: 75,

                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(weight, style: TextStyle(
                                              fontFamily: "title",
                                              fontSize: 25,
                                              color: Colors.black
                                          ),),
                                        ),
                                      ),
                                    ],
                                  ),),
                              ],
                            ),
                          ),

                        ],
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
