import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/bottomNavigationBar/bottom_navigation_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/home_controller.dart';
import 'package:get/get.dart';

import '../../cbt_admin/category_list/category_lf_form/company_form_controller.dart';

class BottomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomController>(
          () => BottomController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );

    // Get.lazyPut<DepartmentLFController>(
    //       () => DepartmentLFController(),
    // );
  }
}