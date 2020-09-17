import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/blog/blog_view.dart';
import 'package:portfolio/constants/NavigationItem.dart';
import 'package:portfolio/experience/experience_view.dart';
import 'package:portfolio/footer/footer_view.dart';
import 'package:portfolio/header/header_view.dart';
import 'package:portfolio/navigation_bar/navigation_bar_view.dart';
import 'package:portfolio/portfolio/go_top_button.dart';
import 'package:portfolio/portfolio/portfolio_view_drawer.dart';
import 'package:portfolio/project/projet_view.dart';
import 'package:portfolio/skills/skills_view.dart';
import 'package:provider/provider.dart';

class PortfolioView extends StatefulWidget {
  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin<PortfolioView> {
  final scrollController = ScrollController();

  @override
  void afterFirstLayout(BuildContext context) {
    // Ne sert à rien pour le moment
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScrollController>.value(
      value: scrollController,
      child: Scaffold(
        body: Scrollbar(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  NavigationBarView(),
                  HeaderView(),
                  ProjectView(
                    key: kNavigationMap[NavigationItemEnum.projects].key,
                  ),
                  SkillsView(
                    key: kNavigationMap[NavigationItemEnum.skills].key,
                  ),
                  ExperienceView(
                    key: kNavigationMap[NavigationItemEnum.experience].key,
                  ),
                  BlogView(
                    key: kNavigationMap[NavigationItemEnum.blog].key,
                  ),
                  FooterView(),
                ],
              ),
            ),
          ),
        ),
        endDrawer: PortfolioViewDrawer(),
        floatingActionButton: GoTopButton(),
      ),
    );
  }
}
