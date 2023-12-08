import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:get/get.dart';
import '../../category_list/category_lf_form/company_form_controller.dart';

class CompanyLFBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DepartmentLFController>(() => DepartmentLFController());
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
