import 'package:flutter/material.dart';

class NavigationItem {
  final String text;
  final Icon icon;
  final GlobalKey key;
  NavigationItem(this.text, {this.key, this.icon});
}

final kNavigationItems = [
  NavigationItem('Projetcs'),
  NavigationItem('Skills'),
  NavigationItem('Experience'),
  NavigationItem('Blog'),
];
