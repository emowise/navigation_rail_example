import 'package:flutter/material.dart';

class Constants {
  static const unselectedLabelStyle =
      TextStyle(fontSize: 12, color: Colors.black);
  static const selectedLabelStyle =
      TextStyle(fontSize: 16, color: Colors.black);

  static const bottomNavigationItemList = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
    BottomNavigationBarItem(icon: Icon(Icons.remove), label: "Remove"),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
  ];

  static const navigationDestinationList = <NavigationRailDestination>[
    NavigationRailDestination(icon: Icon(Icons.person), label: Text("Person")),
    NavigationRailDestination(icon: Icon(Icons.remove), label: Text("Remove")),
    NavigationRailDestination(icon: Icon(Icons.add), label: Text("Add")),
  ];

  static const selectedIconTheme = IconThemeData(color: Colors.blue);
  static const unselectedIconTheme = IconThemeData(color: Colors.white);

  static const navigationRailLeadingIcon = Icon(
    Icons.more_vert_sharp,
    color: Colors.white,
  );

  static const navigationRailTrailingIcon = Icon(
    Icons.more_horiz,
    color: Colors.white,
  );
}
