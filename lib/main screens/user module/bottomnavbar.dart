import 'package:animalcare/main%20screens/user%20module/addapet.dart';
import 'package:animalcare/main%20screens/user%20module/animalview.dart';
import 'package:animalcare/main%20screens/user%20module/hospitalsmap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'home.dart';

class CustomizedNavBar extends StatelessWidget {
  CustomizedNavBar({Key? key}) : super(key: key);
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return  PersistentTabView(
      context,
      controller: _controller,
      screens: [
        Home(),
        HospitalsMap(),
        AnimalPageView(),
        SaleAPet()
      ],
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      //stateManagement: true, // Default is true.

      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          topLeft: Radius.circular(60)
        ),
        colorBehindNavBar: Colors.black87,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1
          )
        ]
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}
List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      textStyle: const TextStyle(
          fontFamily: "title"
      ),
      icon: const Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: const Color.fromRGBO(1, 129, 122, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      textStyle: const TextStyle(
          fontFamily: "title"
      ),
      icon: const Icon(Icons.map_outlined),
      title: ("Hospitals"),
      activeColorPrimary: const Color.fromRGBO(1, 129, 122, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      textStyle: const TextStyle(
          fontFamily: "title"
      ),
      icon: const Icon(Icons.shopping_cart_rounded),
      title: ("Buy an animal"),
      activeColorPrimary: const Color.fromRGBO(1, 129, 122, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      textStyle: const  TextStyle(
        fontFamily: "title"
      ),
      icon: const Icon(Icons.sell_rounded),
      title: ("Sell your animal"),
      activeColorPrimary: const Color.fromRGBO(1, 129, 122, 1),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
  }

