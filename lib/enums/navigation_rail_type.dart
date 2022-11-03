
import 'package:flutter/material.dart';

enum NavigationRailType{
  all("All",NavigationRailLabelType.all),
  selected("Selected",NavigationRailLabelType.selected),
  none("None",NavigationRailLabelType.none),;

  final NavigationRailLabelType labelType;
  final String name;
  const NavigationRailType(this.name,this.labelType);
}