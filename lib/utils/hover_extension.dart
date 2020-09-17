import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:portfolio/components/elevate_on_hover.dart';

/* Pour archive, déja implémenté dans la version actuelle de flutter */

extension HoverExtension on Widget {
  static final flutterContent =
      html.document.getElementsByTagName('flt-glass-pane').first as html.HtmlElement;

  Widget get showCursorOnHover {
    return MouseRegion(
      onEnter: (_) {
        flutterContent.style.cursor = "pointer";
      },
      onExit: (_) {
        flutterContent.style.cursor = "default";
      },
      child: this,
    );
  }

  Widget get moveUpOnHover {
    return ElevateOnHover(child: this);
  }
}
