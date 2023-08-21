import 'package:courses_app/controller/homescreencontroller.dart';
import 'package:courses_app/core/appcolors.dart';
import 'package:courses_app/view/widgets/homescreen/infocard.dart';
import 'package:courses_app/view/widgets/homescreen/sidemenutile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../core/animation/riveutils.dart';
import '../../../model/static/rivebuttons.dart';

class SideMenu extends StatelessWidget {
  final HomeScreenController controller;
  const SideMenu({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.drawerBackgroundColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(
              name: "Elias Fares",
              profession: "Application Programmer",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Browse".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sideMenus.map(
              (menu) => GetBuilder<HomeScreenController>(
                builder: (context) {
                  return SideMenuTile(
                    menu: menu,
                    riveonInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                      controller.selectMenu(menu);
                    },
                    isActive: controller.selectedMenu == menu,
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "History".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white70),
              ),
            ),
            ...sideMenu2.map(
              (menu) => GetBuilder<HomeScreenController>(
                builder: (context) {
                  return SideMenuTile(
                    menu: menu,
                    riveonInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                      // setState(() {
                      //   selectedMenu = menu;
                      // });
                      controller.selectMenu(menu);
                    },
                    isActive: controller.selectedMenu == menu,
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
