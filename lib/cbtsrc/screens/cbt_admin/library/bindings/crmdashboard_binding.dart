import 'package:get/get.dart';
import '../controllers/crmdashboard_controller.dart';
class CrmDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrmDashBoardController>(
      () => CrmDashBoardController(),
    );
  }
}
