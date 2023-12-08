import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/login/login_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/login/login_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/register/register_binding.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/register/register_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/bottomNavigationBar/bottom_navigation_view.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/bottomNavigationBar/botton_navigation_binding.dart';
import 'package:digigyan/cbtsrc/screens/splash/splash_binding.dart';
import 'package:digigyan/cbtsrc/screens/splash/splash_view.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/main_test_geration_page.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/test_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TEST,
      // page: () => TestPage(),
      page: () => TestPageMain(),
      binding: TestBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.HOME_MOBILE,
      page: () => BottomView(),
      binding: BottomBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
