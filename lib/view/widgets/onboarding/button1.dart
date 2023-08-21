import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Button1 extends StatelessWidget {
  final List<RiveAnimationController> riveController;
  final void Function()? onTap;
  const Button1({
    super.key,
    required this.riveController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 200,
        height: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            RiveAnimation.asset(
              "assets/riveassets/button.riv",
              controllers: this.riveController,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.arrow_forward),
                  Text(
                    "Start the courses",
                    style: TextStyle(
                        fontFamily: "Inter", fontWeight: FontWeight.w600),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: this.onTap,
    );
  }
}