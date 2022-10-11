import 'package:flutter/material.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class Cards extends StatefulWidget {
  String name = '';
  String pic ;
  String type = '';
  String phone = '';

  // late final VoidCallback phoneOnTap;
  dynamic button;

  Cards(this.name, this.type, this.phone, this.pic, this.button);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  var size, width, height;

  late double left;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    String img = widget.pic;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.025, right: width * 0.025, top: height * 0.01),
      child: Expanded(
        child: Container(
          width: width * 0.99,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
            border: Border.all(color: Colors.black12, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: height * 0.015,
                    left: width * 0.05,
                    bottom: height * 0.02),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: width * 0.25,
                    height: 115,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.pink.shade50,
                        borderRadius: BorderRadius.circular(15)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset( img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.025, left: width * 0.025),
                      child: Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "fred",
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.009,
                          left: width * 0.025,
                          right: width * 0.025),
                      child: Flexible(
                        child: Container(
                          width: 200,
                          child: Text(
                            widget.type,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: "beb",
                              color: Colors.black87.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                          launch("tel:"+widget.phone);
                        },
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.025),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.005,
                                  left: MediaQuery.of(context).size.width * 0,
                                  right:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Icon(
                                Icons.phone,
                                size: 17,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.002,
                                  left: MediaQuery.of(context).size.width * 0,
                                  right:
                                      MediaQuery.of(context).size.width * 0.01),
                              child: Text(
                                widget.phone,
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: "alef",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.009,
                          left: width * 0.07,
                          right: width * 0.1,
                          bottom: height * 0.01),
                      child: widget.button,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
