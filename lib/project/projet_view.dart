import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/components/portfolio_panel.dart';
import 'package:portfolio/constants/ProjectItem.dart';
import 'package:portfolio/project/project_item_body.dart';

class ProjectView extends StatelessWidget {
  static const String titleText = 'Projets';
  const ProjectView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildMobile: (_) => ProjetMobileView(),
      buildDesktop: (_) => ProjetDesktopView(),
    );
  }
}

class ProjetDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioPanel(
      titleText: ProjectView.titleText,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final item in kProjectItems)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjetItemBody(item),
                ),
              )
          ],
        )
      ],
    );
  }
}

class ProjetMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioPanel(
      titleText: ProjectView.titleText,
      children: [
        for (final item in kProjectItems)
          ProjetItemBody(
            item,
            bodyHeight: kProjectItems.last == item ? 30 : 50,
          )
      ],
    );
  }
}
