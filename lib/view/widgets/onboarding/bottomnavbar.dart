import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rive/rive.dart';

import '../../../controller/homescreencontroller.dart';
import '../../../core/appcolors.dart';
import '../../../model/static/rivebuttons.dart';
import '../homescreen/animatedbar.dart';

class BottomNavBar extends StatelessWidget {
  final HomeScreenController controller;
  const BottomNavBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.bottomNavigationBarColor.withOpacity(0.85),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(
                bottomNavs.length,
                (index) => Column(
                      children: [
                        GetBuilder<HomeScreenController>(
                          builder: (controller) => AnimatedBar(
                            controller: controller,
                            section: bottomNavs[index].title,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.selectSection(index);
                            controller
                                .startIconAnimation(bottomNavs[index].input!);

                            print(controller.selectiveSection.toString());
                            Future.delayed(
                              Duration(seconds: 2),
                              () {
                                controller.stopIconAnimation(
                                    bottomNavs[index].input!);
                              },
                            );
                          },
                          child: SizedBox(
                            width: 36,
                            height: 36,
                            child: RiveAnimation.asset(
                              bottomNavs[index].src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                controller.onInitIcon(
                                    artboard,
                                    bottomNavs[index].stateMachineName,
                                    // i pass the index cause the modification on input should be on the bottomNavs[index].input not on a shallow copy of SMIBool
                                    index);
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
          ),
        ),
      );
  }
}
