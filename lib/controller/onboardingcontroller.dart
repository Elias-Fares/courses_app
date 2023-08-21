import 'package:courses_app/core/animation/riveutils.dart';
import 'package:courses_app/view/screens/onboardingdialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class OnboardingController extends GetxController
    with GetTickerProviderStateMixin {
  late bool isLoadingShown;
//-----------------------------Animation----------------------------//
  late RiveAnimationController btnAnimationController;
  late AnimationController animationController;
  late Animation<Offset> upToDown;

  late SMITrigger check;
  late SMITrigger reset;
  late SMITrigger error;

  late SMITrigger confette;
//----------------------------Validation----------------------------//
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate1 = GlobalKey<FormState>();
//----------------------------Functions----------------------------//
  void Function()? onTap(
      BuildContext context, OnboardingController controller) {
    btnAnimationController.isActive = true;

    Future.delayed(
      Duration(milliseconds: 800),
      () {
        if (!Get.isDialogOpen!) {
          makeAnimation();
          onBoardingDialog(context, controller);
        }
      },
    );
    update();
    print("animation active");
    return null;
  }

  void makeAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    upToDown = Tween(begin: Offset(0.0, -1), end: Offset.zero).animate(
        CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack))
      ..addStatusListener((status) {})
      ..addListener(() {});

    animationController..forward();
  }

  void Function()? closeDialog(BuildContext context) {
    Get.back();
    print("the object closed");
    isLoadingShown = false;
    return null;
  }

  signUp() {
    isLoadingShown = true;
    update();
    Future.delayed(
      Duration(seconds: 1),
      () {
        //------------Valid Section--------------//
        if (formstate1.currentState!.validate()) {
          check.fire();
          Future.delayed(
            Duration(seconds: 3),
            () {
              confette.fire();
              Future.delayed(
                Duration(seconds: 2),
                () {
                  // isLoadingShown = false;
                  Get.offAllNamed("/HomeScreen");
                  isLoadingShown = false;
                  update();
                },
              );
            },
          );
          print("successful validated");
        }
        // ----------Not Valid Section-----------------//
        else {
          error.fire();
          Future.delayed(
            Duration(seconds: 3),
            () {
              isLoadingShown = false;
              update();
            },
          );
          print("not valid");
        }
      },
    );
  }

  void Function(Artboard)? onInitRive1(Artboard artboard) {
    StateMachineController controller = RiveUtils.getRiveController(artboard);
    check = controller.findSMI("Check") as SMITrigger;
    error = controller.findSMI("Error") as SMITrigger;
    reset = controller.findSMI("Reset") as SMITrigger;
    return null;
  }

  void Function(Artboard)? onInitRive2(Artboard artboard) {
    StateMachineController controller = RiveUtils.getRiveController(artboard);
    confette = controller.findSMI("Trigger explosion") as SMITrigger;
    return null;
  }

  @override
  void onInit() {
    isLoadingShown = false;
    makeAnimation();
    btnAnimationController = OneShotAnimation("active", autoplay: false);
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
