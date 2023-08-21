import 'package:courses_app/view/screens/onboarding.dart';
import 'package:courses_app/view/screens/homescreen.dart';
import 'package:get/get.dart';

List<GetPage> routes = [
  GetPage(
    name: '/',
    page: () => Onboarding(),
    transition: Transition.fadeIn,
  ),
  GetPage(
    name: '/HomeScreen',
    page: () => HomeScreen(),
    transition: Transition.rightToLeft,
  ),
];
