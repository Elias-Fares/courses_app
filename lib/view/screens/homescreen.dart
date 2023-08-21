import 'package:courses_app/core/appcolors.dart';
import 'package:courses_app/view/widgets/homescreen/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homescreencontroller.dart';
import '../../model/static/coursemodel.dart';
import '../widgets/homescreen/coursecard1.dart';
import '../widgets/homescreen/coursecard2.dart';
import '../widgets/onboarding/bottomnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      key: controller.drawerKey,
      bottomNavigationBar: BottomNavBar(controller: controller),
      extendBody: true,
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
        child: Drawer(
          backgroundColor: Colors.transparent,
          child: SideMenu(controller: controller),
        ),
      ),
      body: SingleChildScrollView(
        physics: controller.columnScrolling,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    child: Icon(Icons.subject, size: 30, color: AppColors.drawerBackgroundColor,),
                    onTap: () {
                      controller.drawerKey.currentState!.openDrawer();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    child: Icon(Icons.logout, size: 30, color: AppColors.signUpBtnColor,),
                    onTap: () {
                      Get.toNamed("/");
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Courses",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                //???????????
                ...courses
                    .map((course) => Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CourseCard1(course: course),
                        ))
                    .toList(),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Recent",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            ...recentCourses
                .map(
                  (course) => Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: CourseCard2(course: course),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
