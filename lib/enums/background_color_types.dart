import 'package:flutter/material.dart';

enum BackgroundColorTypes{
  red("Red",Colors.red),
  orange("Orange",Colors.orange),
  purple("Purple",Colors.purple),;

  final Color color;
  final String name;
  const BackgroundColorTypes(this.name,this.color);
}