import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_browser.dart';
import 'package:portfolio/blog/blog_view.dart';
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/constants/NavigationItem.dart';
import 'package:portfolio/experience/experience_view.dart';
import 'package:portfolio/header/header_view.dart';
import 'package:portfolio/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio/project/projet_view.dart';
import 'package:portfolio/skills/skills_view.dart';

void main() async {
  await findSystemLocale();
  await initializeDateFormatting();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gregoire GUYON',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(color: Colors.black),
          headline4: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      home: PortfolioView(),
    );
  }
}

class PortfolioView extends StatefulWidget {
  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

final projectKey = GlobalKey();
final skillsKey = GlobalKey();
final experienceKey = GlobalKey();
final blogKey = GlobalKey();

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin<PortfolioView> {
  final scrollController = ScrollController();

  @override
  void afterFirstLayout(BuildContext context) {
    var p = _getPositions(projectKey);
    print(p);
  }

  double _getPositions(GlobalKey key, {Offset offset = Offset.zero}) {
    final RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox.localToGlobal(offset).dy;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              NavigationBarView(),
              HeaderView(),
              ProjectView(
                key: projectKey,
              ),
              SkillsView(
                key: skillsKey,
              ),
              ExperienceView(
                key: experienceKey,
              ),
              BlogView(
                key: blogKey,
              ),
              Container(height: size.height, width: size.width, color: Colors.blue),
            ],
          ),
        ),
      ),
      endDrawer: DrawerView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () => scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  const DrawerView({
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
              for (final item in kNavigationItems)
                ListTile(
                  title: Text(item.text),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
