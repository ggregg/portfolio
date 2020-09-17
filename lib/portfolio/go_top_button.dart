import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoTopButton extends StatelessWidget {
  const GoTopButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();

    if (scrollController.offset == 0) return SizedBox();
    return FloatingActionButton(
      child: Icon(Icons.arrow_upward),
      onPressed: () => scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
    );
  }
}
