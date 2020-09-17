import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/constants/Common.dart';
import 'package:portfolio/constants/NavigationItem.dart';
import 'package:portfolio/utils/components_tools.dart';
import 'package:provider/provider.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildMobile: (_) {
        return Container(
          height: 60,
          width: double.infinity,
          padding: kScreenPadding,
          child: Row(
            children: [
              Image.asset(
                'images/logo.png',
                height: 20,
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              )
            ],
          ),
        );
      },
      buildDesktop: (_) {
        return Container(
          height: 100,
          width: kInitWidth,
          padding: kScreenPadding,
          child: Row(
            children: [
              Image.asset(
                'images/logo.png',
                height: 26,
              ),
              const Spacer(),
              for (final item in kNavigationMap.values)
                NavigationBarItem(
                  text: item.text,
                  onPressed: () {
                    final y = getVerticalPosition(item.key);
                    final scrollController = context.read<ScrollController>();
                    scrollController.animateTo(y,
                        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  const NavigationBarItem({Key key, @required this.text, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: EdgeInsets.only(left: isSmall ? 50 : 64),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
        onTap: onPressed,
      ),
    );
  }
}
