import 'package:portfolio/utils/string_extension.dart';
import 'package:portfolio/utils/hover_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class BlogCard extends StatelessWidget {
  final bool isMobile;
  final RssItem article;

  const BlogCard({
    Key key,
    @required this.article,
    this.isMobile = false,
  }) : super(key: key);

  static const textStyleBase = TextStyle(fontSize: 20, height: 1.3);
  static final textStyleTimeline = textStyleBase.copyWith(color: Colors.grey[600]);
  static final formatter = DateFormat('d MMMM yyyy à HH:mm');

  @override
  Widget build(BuildContext context) {
    final content = article.content.value.toPlainText();

    return GestureDetector(
      onTap: () => launch(article.link, webOnlyWindowName: '_blank'),
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.redAccent,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: isMobile ? 20 : 40),
              child: Text(
                article.title,
                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formatter.format(article.pubDate),
                    style: textStyleTimeline,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    content,
                    maxLines: 3,
                    style: textStyleBase,
                  ),
                ],
              ),
            )
          ],
        ),
      ).showCursorOnHover.moveUpOnHover,
    );
  }
}
