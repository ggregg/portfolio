import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/constants/NavigationItem.dart';
import 'package:portfolio/utils/components_tools.dart';
import 'package:provider/provider.dart';

class PortfolioViewDrawer extends StatelessWidget {
  const PortfolioViewDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildDesktop: (_) => SizedBox(),
      buildMobile: (_) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Grégoire GUYON',
                  style: GoogleFonts.chilanka(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(157, 0, 253, 1),
                ),
              ),
              for (final item in kNavigationMap.values)
                ListTile(
                  title: Text(item.text),
                  onTap: () {
                    Navigator.pop(context);
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
