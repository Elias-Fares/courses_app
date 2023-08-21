import 'package:courses_app/model/static/rivebuttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../core/animation/riveutils.dart';

class HomeScreenController extends GetxController {
  late String selectiveSection;
  late ScrollPhysics columnScrolling;
    RiveAsset selectedMenu = sideMenus.first;
  late GlobalKey<ScaffoldState> drawerKey;

  void Function(Artboard)? onInitIcon(
      Artboard artboard, String stateMachineNamee, int index) {
    StateMachineController controller = RiveUtils.getRiveController(artboard,
        stateMachineName: stateMachineNamee);
    bottomNavs[index].input = controller.findSMI("active") as SMIBool;
    return null;
  }

  void startIconAnimation(SMIBool? input) {
    input!.change(true);
  }

  void stopIconAnimation(SMIBool? input) {
    input!.change(false);
  }

  void selectSection(int index) {
    selectiveSection = bottomNavs[index].title;
    update();
  }
  void selectMenu(RiveAsset menu) {
    selectedMenu = menu;
    update();
  }

  @override
  void onInit() {
    selectSection(0);
    drawerKey = GlobalKey();
    columnScrolling = ScrollPhysics(parent: BouncingScrollPhysics());
    super.onInit();
  }
}
