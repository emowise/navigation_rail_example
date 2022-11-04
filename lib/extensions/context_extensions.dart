import 'package:flutter/cupertino.dart';

extension ContextExtensions on BuildContext {
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;
}
