import 'package:flutter/material.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  const ProjectItem({
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.technologies,
  });
}

const kProjectItems = [
  ProjectItem(
    title: 'Qui aliquip non elit Lorem ipsum proident laboris',
    description:
        'Tempor anim minim proident dolor enim sint ad eu laborum amet. Aute id deserunt nisi id cupidatat commodo aute dolore dolore est dolor est mollit. Reprehenderit magna nulla nostrud sunt incididunt minim enim excepteur ipsum. Laboris voluptate consectetur quis fugiat Lorem consequat qui esse.',
    image: 'images/app1-min.png',
    technologies: ['flutter', '.net core'],
  ),
  ProjectItem(
    title: 'Et esse reprehenderit aliqua',
    description:
        'Irure Lorem nisi adipisicing sit ipsum fugiat qui excepteur magna nulla. Culpa ipsum consectetur exercitation voluptate consectetur veniam. Ex magna minim nulla anim tempor mollit non laboris eu ut laboris deserunt occaecat. Voluptate minim ex proident eu. Culpa aliqua enim reprehenderit amet mollit duis magna aliquip in. Dolor amet sunt mollit tempor incididunt minim nisi aliqua magna id aute officia occaecat. Veniam do excepteur voluptate aliquip nostrud.',
    image: 'images/app2-min.png',
    technologies: ['vue.js', '.net core'],
  ),
  ProjectItem(
    title: 'Velit Lorem nulla laboris',
    description:
        'Mollit ut deserunt Lorem officia sit ex eu consequat ipsum culpa. In tempor ipsum quis proident voluptate. Commodo duis velit nisi eiusmod et. Sit exercitation velit velit exercitation pariatur. Nisi Lorem proident commodo et ex mollit excepteur tempor fugiat aute. Occaecat et commodo laborum aute minim culpa.',
    image: 'images/app3-min.png',
    technologies: ['vue.js', '.net core'],
  ),
];
