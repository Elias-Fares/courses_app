import 'package:courses_app/core/appcolors.dart';
import 'package:courses_app/core/functions/validinput.dart';
import 'package:courses_app/view/widgets/onboarding/signupbtn.dart';
import 'package:courses_app/view/widgets/onboarding/textform1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../controller/onboardingcontroller.dart';
import '../widgets/onboarding/custompositioned.dart';

Future<dynamic> onBoardingDialog(
    BuildContext context, OnboardingController controller) {
  return Get.dialog(
    SlideTransition(
      position: controller.upToDown,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AlertDialog(
            backgroundColor: AppColors.dialogBackground,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            insetPadding: EdgeInsets.symmetric(horizontal: 16),
            content: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: GetBuilder<OnboardingController>(builder: (context) {
                  return Form(
                    key: controller.formstate1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: "Poppins", fontSize: 34),
                            )),
                        Text(
                          "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                          style: TextStyle(
                              fontFamily: "Inter",
                              color: AppColors.dialogFontColor),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Email",
                        ),
                        textForm1(
                          label: SvgPicture.asset("assets/icons/email.svg",
                              width: 30),
                          controller: controller.email,
                          validator: (p0) => validInput("email", p0!, 10, 100),
                        ),
                        Text("Password"),
                        textForm1(
                          label: SvgPicture.asset("assets/icons/password.svg",
                              width: 30),
                          controller: controller.password,
                          validator: (p0) =>
                              validInput("password", p0!, 4, 100),
                          isPassword: true,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SignUpBtn(
                            onTap: () {
                              controller.signUp();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Divider(
                                endIndent: 5,
                              ),
                            ),
                            Text(
                              "OR",
                              style: TextStyle(color: AppColors.greyfont),
                            ),
                            Expanded(
                              flex: 1,
                              child: Divider(
                                indent: 5,
                              ),
                            )
                          ],
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Sign Up with Email, Apple or Google",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Inter",
                                color: AppColors.greyfont,
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/email_box.svg",
                              width: 40,
                            ),
                            SvgPicture.asset("assets/icons/apple_box.svg",
                                width: 40),
                            SvgPicture.asset("assets/icons/google_box.svg",
                                width: 40),
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            child: GestureDetector(
              onTap: () {
                controller.closeDialog(context);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.dialogBackground,
                child: Icon(
                  Icons.close,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
          GetBuilder<OnboardingController>(
            builder: (controller) {
              if (controller.isLoadingShown == false) {
                return SizedBox();
              } else {
                return CustomPositioned(
                  controller: controller,
                  animation: RiveAnimation.asset(
                    "assets/riveassets/check.riv",
                    onInit: (artboard) {
                      controller.onInitRive1(artboard);
                    },
                  ),
                  width: 100,
                );
              }
            },
          ),
          GetBuilder<OnboardingController>(
            builder: (controller) {
              if (controller.isLoadingShown == false) {
                return SizedBox();
              } else {
                return CustomPositioned(
                  controller: controller,
                  animation: RiveAnimation.asset(
                    "assets/riveassets/confetti.riv",
                    onInit: (artboard) {
                      controller.onInitRive2(artboard);
                    },
                  ),
                  width: 400,
                );
              }
            },
          ),
        ],
      ),
    ),
  );
}
