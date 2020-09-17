import 'package:flutter/material.dart';

double getVerticalPosition(GlobalKey key, {Offset offset = Offset.zero}) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  return renderBox.localToGlobal(offset).dy;
}
