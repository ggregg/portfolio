import 'package:flutter/material.dart';

class OutlinedSkillContainer extends StatelessWidget {
  const OutlinedSkillContainer(this.skill, this.color, {Key key}) : super(key: key);

  final String skill;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: color),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        skill,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
