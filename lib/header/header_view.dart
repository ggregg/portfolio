import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/constants/Common.dart';
import 'package:portfolio/utils/math.dart';
import 'package:portfolio/utils/hover_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildMobile: (_) => HeaderMobileView(),
      buildDesktop: (_) => HeaderDesktopView(),
    );
  }
}

class HeaderDesktopView extends StatelessWidget {
  const HeaderDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageWidth = between(400.0, 500.0)(size.width * 0.4);

    return Container(
      height: kInitHeight,
      width: kInitWidth,
      child: Padding(
        padding: kScreenPadding,
        child: Row(
          children: [
            Expanded(
              child: HeaderBody(
                isMobile: false,
              ),
            ),
            Image.asset('images/visage-min.png', width: imageWidth),
          ],
        ),
      ),
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.9,
      width: size.width,
      padding: kScreenPadding.copyWith(bottom: 40, top: 40),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'images/visage.png',
            ),
          ),
          HeaderBody(
            isMobile: true,
          ),
        ],
      ),
    );
  }
}

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({Key key, @required this.isMobile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fontStyle = Theme.of(context).textTheme.headline2.copyWith(fontSize: isMobile ? 30 : 60);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'I\'m a mobile',
          style: fontStyle,
          maxLines: 1,
        ),
        AutoSizeText(
          'Developeur < / >',
          style: fontStyle,
          maxLines: 1,
        ),
        SizedBox(
          height: isMobile ? 15 : 37,
        ),
        AutoSizeText(
          'J\'ai deux ans d\'expérience dans le développement de jolies applications mobiles Android et iOS.',
          style: TextStyle(fontSize: isMobile ? 16 : 24),
          maxLines: 3,
        ),
        SizedBox(
          height: isMobile ? 20 : 40,
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          color: Colors.redAccent,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 10 : 17,
            horizontal: isMobile ? 15 : 25,
          ),
          onPressed: () {
            launch('mailto:gregoire.guyon@gmail.com?subject=Demande%20de%20contact');
          },
          child: Text(
            'Me Contacter',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              color: Colors.white,
            ),
          ),
        ).moveUpOnHover,
      ],
    );
  }
}
