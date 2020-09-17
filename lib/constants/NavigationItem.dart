import 'package:flutter/material.dart';

class NavigationItem {
  final String text;
  final Icon icon;
  final GlobalKey key = GlobalKey();
  NavigationItem(this.text, {this.icon});
}

enum NavigationItemEnum { projects, skills, experience, blog }

Map<NavigationItemEnum, NavigationItem> kNavigationMap = {
  NavigationItemEnum.projects: NavigationItem('Projetcs'),
  NavigationItemEnum.skills: NavigationItem('Skills'),
  NavigationItemEnum.experience: NavigationItem('Experience'),
  NavigationItemEnum.blog: NavigationItem('Blog'),
};
