import 'package:flutter/material.dart';

import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/components/portfolio_panel.dart';
import 'package:portfolio/constants/Common.dart';
import 'package:portfolio/constants/ExperienceItem.dart';
import 'package:portfolio/experience/experience_container.dart';

class ExperienceView extends StatelessWidget {
  static const titleText = 'Experience';
  const ExperienceView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildMobile: (_) => ExperienceMobileView(),
      buildDesktop: (_) => ExperienceDesktopView(),
    );
  }
}

class ExperienceMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioPanel(
      titleText: ExperienceView.titleText,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int index = 0; index < kExperiences.length; index++)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: ExperienceContainer(
                  data: kExperiences.elementAt(index),
                  color: kColorAssets.elementAt(index % kColorAssets.length),
                ),
              )
          ],
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class ExperienceDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioPanel(
      titleText: ExperienceView.titleText,
      children: [
        Column(
          children: [
            for (int rowIndex = 0; rowIndex < kExperiences.length / 2; rowIndex++)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < kExperiences.length / 2; index++)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(index == 0 ? 0 : 4, 4, index == 0 ? 4 : 0, 4),
                        child: ExperienceContainer(
                          data: kExperiences.elementAt(index + rowIndex * 2),
                          color:
                              kColorAssets.elementAt((index + rowIndex * 2) % kColorAssets.length),
                        ),
                      ),
                    ),
                ],
              )
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
