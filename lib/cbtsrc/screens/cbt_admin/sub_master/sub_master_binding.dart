import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/sub_master_controller.dart';
import 'package:get/get.dart';

import '../category_list/category_lf_form/company_form_controller.dart';

class SubMasterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubMasterController>(
      () => SubMasterController(),
    );
    // Get.lazyPut<DepartmentLFController>(
    //   () => DepartmentLFController(),
    // );
    Get.lazyPut<DesignationLFController>(
      () => DesignationLFController(),
    );

    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );

    Get.lazyPut<StudentController>(
      () => StudentController(),
    );
  }
}
