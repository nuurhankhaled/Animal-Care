import 'package:flutter/material.dart';

class DoctorAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title="";
  DoctorAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style:  const TextStyle(
            color: Colors.white ,
            fontFamily: "fred",
            fontSize: 25,
          ),
        ),
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
