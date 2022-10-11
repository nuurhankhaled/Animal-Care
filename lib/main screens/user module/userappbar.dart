import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title="";
  final VoidCallback onTap;
  CustomeAppBar(this.title,this.onTap);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded,size: 35,color: Colors.white,),
              onPressed: onTap,
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white ,
                fontFamily: "fred",
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
      flexibleSpace: Container(

        decoration:  BoxDecoration(
           image: DecorationImage(
             image: AssetImage("images/enter.jpg"),
             fit: BoxFit.fitWidth,
           ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(75.0),
          ),
        ),
        child: Container(width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Color.fromRGBO(50, 132, 132, 0.5),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(75.0),
            ),
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(75.0),
        ),
      ),
    );
  }
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}
