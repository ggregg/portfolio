import 'package:flutter/material.dart';
import 'package:portfolio/constants/ExperienceItem.dart';

class ExperienceContainer extends StatelessWidget {
  static const textStyleBase = TextStyle(fontSize: 20, height: 1.3);
  static final textStyleTitle = textStyleBase.copyWith(fontWeight: FontWeight.bold);
  static final textStyleTimeline = textStyleBase.copyWith(color: Colors.grey[600]);

  const ExperienceContainer({
    Key key,
    @required this.data,
    @required this.color,
  }) : super(key: key);

  final ExperienceItem data;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: color),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.compagny, style: textStyleTitle),
          Text(data.timeline, style: textStyleTimeline),
          for (var item in data.descriptions) Text(item, style: textStyleBase)
        ],
      ),
    );
  }
}
