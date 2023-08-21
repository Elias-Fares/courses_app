import 'package:flutter/material.dart';

import '../../../controller/homescreencontroller.dart';

class AnimatedBar extends StatelessWidget {
  final HomeScreenController controller;
  final String section;
  const AnimatedBar({
    super.key,
    required this.controller,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 30,
      height: 7,
      margin: EdgeInsets.only(top: 8, bottom: 2),
      decoration: BoxDecoration(
        color: controller.selectiveSection == section
            ? Color.fromARGB(255, 120, 68, 198).withOpacity(1)
            : Color.fromARGB(255, 120, 68, 198).withOpacity(0),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
