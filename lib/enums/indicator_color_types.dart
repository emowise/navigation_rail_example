import 'package:flutter/material.dart';

enum IndicatorColorTypes{
  yellow("Yellow",Colors.yellow),
  white("White",Colors.white),
  blue("Light Green",Colors.lightGreenAccent),;

  final Color color;
  final String name;
  const IndicatorColorTypes(this.name,this.color);
}