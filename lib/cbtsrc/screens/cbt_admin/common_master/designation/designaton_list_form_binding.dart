import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_form_controller.dart';
import 'package:get/get.dart';

class DesignationLFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesignationLFController>(() => DesignationLFController());
  }
}
