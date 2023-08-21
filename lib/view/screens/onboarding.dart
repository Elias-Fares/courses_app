import 'dart:ui';
import 'package:courses_app/controller/onboardingcontroller.dart';
import 'package:courses_app/core/animation/uptodownroute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../widgets/onboarding/button1.dart';
import 'onboardingdialog.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 1.5,
                right: -300,
                child: Image.asset(
                  'assets/backgrounds/Spline.png',
                )),
            const RiveAnimation.asset('assets/riveassets/shapes.riv'),
            Positioned(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: SizedBox(),
              ),
            ),
            SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 25, right: 25, top: 40, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Learn \ndesign \n& code",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 44),
                    ),
                                        SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Text(
                      "Don’t skip design. Learn design and code,\nby building real apps with Flutter and Swift. \nComplete courses about the best tools.",
                      style: TextStyle(
                          fontFamily: "inter",
                          wordSpacing: 1.5,
                          height: 1.5,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    GetBuilder<OnboardingController>(
                        init: OnboardingController(),
                        builder: (controller) => Button1(
                              riveController: [
                                controller.btnAnimationController
                              ],
                              onTap: () {
                                controller.onTap(context, controller);
                              },
                            )),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                      style: TextStyle(
                          fontFamily: "inter",
                          wordSpacing: 1.5,
                          height: 1.5,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
