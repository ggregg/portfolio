import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/constants/Common.dart';
import 'package:portfolio/utils/hover_extension.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildDesktop: (context) => FooterDesktopView(),
      buildMobile: (context) => FooterMobileView(),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  final year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Text('© Grégoire GUYON $year -- '),
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            child: Text(
              'Voir le code source',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () =>
                launch('https://github.com/ggregg/portfolio.git', webOnlyWindowName: '_blank'),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          Spacer(),
          for (final item in socials)
            IconButton(
              icon: item.icon,
              color: Colors.redAccent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onPressed: () => launch(item.url, webOnlyWindowName: '_blank'),
            ).moveUpOnHover,
          SizedBox(
            width: 60,
          )
        ],
      ),
    );
  }
}

class FooterMobileView extends StatelessWidget {
  final year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: kScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in socials)
                IconButton(
                  icon: item.icon,
                  color: Colors.redAccent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onPressed: () => launch(item.url, webOnlyWindowName: '_blank'),
                ),
            ],
          ),
          Text('© Grégoire GUYON $year'),
          InkWell(
            mouseCursor: MaterialStateMouseCursor.clickable,
            child: Text(
              'Voir le code source',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () =>
                launch('https://github.com/ggregg/portfolio.git', webOnlyWindowName: '_blank'),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class SocialInfo {
  Widget icon;
  String url;
  SocialInfo({
    @required this.icon,
    @required this.url,
  });
}

final socials = [
  SocialInfo(icon: FaIcon(FontAwesomeIcons.facebook), url: 'https://facebook.com'),
  SocialInfo(icon: FaIcon(FontAwesomeIcons.linkedin), url: 'https://linkedin.com'),
];
