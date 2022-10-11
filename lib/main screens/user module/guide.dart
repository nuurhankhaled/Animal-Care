
import 'package:animalcare/common/widgets/customedcontainer.dart';
import 'package:animalcare/common/widgets/pic.dart';
import 'package:flutter/material.dart';

class GuideAnimal extends StatelessWidget {

  String info = "";
  String title = "";
  String advices = "";
  String pic;
  double x=0;
  GuideAnimal(this.pic,this.info,this.title,this.advices,this.x);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                PictureBack(),
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
                          Icons.arrow_back_rounded,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * x,
                      left: MediaQuery.of(context).size.width * 0.095,
                      right: MediaQuery.of(context).size.width * 0.095),
                  child: Image.asset(pic),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.229),
                  child: CustomedContainer(
                      60,
                      60,
                      0.99,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.05,
                                left: MediaQuery.of(context).size.width * 0.06,
                                top: MediaQuery.of(context).size.height * 0.06),
                            child: Text(info,
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
                              right: MediaQuery.of(context).size.width * 0.085,
                              left: MediaQuery.of(context).size.width * 0.085,
                              top: MediaQuery.of(context).size.height * 0.06
                          ),
                          child: Text(title,
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
                              top: MediaQuery.of(context).size.height * 0.03,
                              bottom: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: Text(advices,
                          style: TextStyle(
                            color: Colors.black87.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                            fontFamily: "alef",
                            fontSize: 15
                          ),),),
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
