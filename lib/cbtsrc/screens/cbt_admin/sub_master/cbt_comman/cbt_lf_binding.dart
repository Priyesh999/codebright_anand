import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';
import 'package:get/get.dart';

class CbtLFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CbtLFController>(
      () => CbtLFController(),
    );
  }
}
