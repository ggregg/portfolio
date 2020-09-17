import 'package:flutter/material.dart';
import 'package:portfolio/components/mobile_desktop_builder.dart';
import 'package:portfolio/components/portfolio_panel.dart';
import 'package:portfolio/constants/Common.dart';
import 'package:portfolio/skills/outlined_skill_container.dart';

class SkillsView extends StatelessWidget {
  static const String titleText = 'Skills';
  const SkillsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopBuilder(
      buildMobile: (_) => SkillsMobileView(),
      buildDesktop: (_) => SkillsDesktopView(),
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioPanel(
      titleText: SkillsView.titleText,
      children: [
        for (int index = 0; index < kSkills.length; index++) ...[
          OutlinedSkillContainer(
            kSkills.elementAt(index),
            kColorAssets.elementAt(index % kColorAssets.length),
          ),
          SizedBox(
            height: 10,
          ),
        ],
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class SkillsDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PortfolioPanel(
      titleText: SkillsView.titleText,
      children: [
        for (var rowIndex = 0; rowIndex < kSkills.length / 4; rowIndex++) ...[
          Row(
            children: [
              for (int index = 0; index < kSkills.length / 2; index++)
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: index != 0 ? 8.0 : 0),
                    child: OutlinedSkillContainer(
                      kSkills.elementAt(rowIndex + index * 2),
                      kColorAssets.elementAt(index),
                    ),
                  ),
                )
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

const kSkills = [
  'Flutter',
  'Vue',
  '.net core',
  'Javascript',
  'Sql',
  'Firebase',
  'C#',
  'Python',
];
