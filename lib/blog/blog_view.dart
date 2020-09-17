import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/components/portfolio_panel.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/webfeed.dart';

import 'blog_card.dart';

class BlogView extends StatelessWidget {
  static const titleString = 'Blog';
  const BlogView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<RssItem>>(
      create: (_) => getArticles(),
      child: MobileDesktopBuilder(
        buildDesktop: (_) => DesktopBlogView(),
        buildMobile: (_) => MobileBlogView(),
      ),
    );
  }
}

class DesktopBlogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();

    return PortfolioPanel(
      titleText: BlogView.titleString,
      children: [
        Row(
          children: [
            for (final article in articles)
              Expanded(
                child: BlogCard(article: article),
              )
          ],
        )
      ],
    );
  }
}

class MobileBlogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<RssItem>>();
    if (articles == null) return CircularProgressIndicator();

    return PortfolioPanel(
      titleText: BlogView.titleString,
      children: [
        for (final article in articles)
          BlogCard(
            article: article,
            isMobile: true,
          ),
      ],
    );
  }
}

Future<List<RssItem>> getArticles() async {
  const url = "https://cors-anywhere.herokuapp.com/https://medium.com/feed/@boeledi";
  final response = await http.get(url);
  final parsedResponse = RssFeed.parse(response.body);
  return parsedResponse.items.where((element) => element.categories.isNotEmpty).take(2).toList();
}
