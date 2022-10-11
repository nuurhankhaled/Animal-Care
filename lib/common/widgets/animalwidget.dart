import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimalWidget extends StatelessWidget {
  String title="";
  String phone="";
  String type="";
  String pic="";
  double top=0;
  String about;
  dynamic button;
  AnimalWidget(this.pic,this.title,this.phone,this.type,this.button,this.top,this.about);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
              color: Colors.black12,
              width: 1.5
          )
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: top),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07,
                  top: MediaQuery.of(context).size.height * 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(pic), fit: BoxFit.fitHeight),
                  color: Colors.black,
                  //shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        left: MediaQuery.of(context).size.width * 0),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "title",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      launch("tel:"+phone);
                    } ,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.009,
                              left: MediaQuery.of(context).size.width * 0,
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: Icon(
                            Icons.phone,
                            size: 17,
                            color: Colors.black87,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.006,
                              left: MediaQuery.of(context).size.width * 0,
                              right: MediaQuery.of(context).size.width * 0.01),
                          child: Text(
                            phone,
                            style: TextStyle(
                                color: Colors.black87.withOpacity(0.7),
                                fontFamily: "alef",
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.011,
                        left: MediaQuery.of(context).size.width * 0,
                        right: MediaQuery.of(context).size.width * 0.01,
                    ),
                    child: Container(
                        width: 160,
                        child: Text(
                          type,
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.7),
                              fontFamily: "alef",
                              fontSize: 11,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.011),
                    child: Container(
                      width: 190,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.011,left: MediaQuery.of(context).size.width * 0,
                            right: MediaQuery.of(context).size.width * 0.07,
                          bottom: MediaQuery.of(context).size.height * 0.02
                            ),
                        child: Center(
                            child: Text(
                              about,
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.7),
                                  fontFamily: "alef",
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600),
                            )),),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
