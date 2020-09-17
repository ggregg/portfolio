import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/ProjectItem.dart';

class ProjetItemBody extends StatelessWidget {
  const ProjetItemBody(
    this.item, {
    Key key,
    this.bodyHeight: 50,
  }) : super(key: key);

  final ProjectItem item;
  final double bodyHeight;

  @override
  Widget build(BuildContext context) {
    final headStyle = Theme.of(context).textTheme.headline4;
    final descriptionStyle = TextStyle(fontSize: 17);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Image.asset(
              item.image,
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(item.title, style: headStyle),
        SizedBox(height: 10),
        AutoSizeText(
          item.description,
          style: descriptionStyle,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 10),
        Row(
          children: [
            for (var tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Chip(
                  label: Text(tech),
                ),
              ),
          ],
        ),
        SizedBox(
          height: bodyHeight,
        )
      ],
    );
  }
}
