import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

typedef BuilderCallback = Widget Function(BuildContext context);

class MobileDesktopBuilder extends StatelessWidget {
  final BuilderCallback buildMobile;
  final BuilderCallback buildDesktop;
  final bool isMobile;

  const MobileDesktopBuilder({
    Key key,
    @required this.buildMobile,
    @required this.buildDesktop,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, size) {
        if (isMobile ?? size.isMobile) return buildMobile(context);
        return buildDesktop(context);
      },
    );
  }
}
