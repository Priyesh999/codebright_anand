import 'package:digigyan/cbtsrc/screens/cbt_admin/category_list/category_lf_form/company_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:get/get.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    // Get.lazyPut<DepartmentLFController>(
    //   () => DepartmentLFController(),
    // );
  }
}
