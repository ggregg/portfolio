import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/Common.dart';

import 'mobile_desktop_builder.dart';

class PortfolioPanel extends StatelessWidget {
  final List<Widget> children;
  final String titleText;

  PortfolioPanel({
    Key key,
    @required this.children,
    @required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildMobile: (_) {
        return Container(
          padding: kScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(thickness: 3),
              SizedBox(height: 20),
              AutoSizeText(
                titleText,
                style: Theme.of(context).textTheme.headline2,
                maxLines: 1,
              ),
              SizedBox(height: 20),
              ...children
            ],
          ),
        );
      },
      buildDesktop: (_) {
        return Container(
          width: kInitWidth,
          padding: kScreenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleText,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 20),
              ...children
            ],
          ),
        );
      },
    );
  }
}
