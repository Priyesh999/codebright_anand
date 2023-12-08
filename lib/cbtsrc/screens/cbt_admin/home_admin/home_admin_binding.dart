import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_list_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/home_admin/home_admin_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/library/controllers/crmdashboard_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/master/master_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/more/controllers/more_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/home_controller.dart';
import 'package:digigyan/cbtsrc/screens/view_all/controller_view_all.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import '../category_list/category_lf_form/company_form_controller.dart';
import '../sub_master/cbt_comman/cbt_lf_controller.dart';
import '../sub_master/cbt_video/video_controller.dart';
import '../sub_master/sub_master_controller.dart';

class HomeAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAdminController>(() => HomeAdminController());
    Get.lazyPut<MoreController>(() => MoreController());
    Get.lazyPut<MasterController>(() => MasterController());
    Get.lazyPut<CrmDashBoardController>(() => CrmDashBoardController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<CbtLFController>(() => CbtLFController());
    Get.lazyPut<SubMasterController>(() => SubMasterController());
    // Get.lazyPut<DepartmentLFController>(() => DepartmentLFController());
    Get.lazyPut<DesignationLFController>(() => DesignationLFController());
    Get.lazyPut<VideoController>(() => VideoController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ViewAllController>(() => ViewAllController());
  }
}
