import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/topic/topic_controller.dart';
import 'package:get/get.dart';

class TopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopicController>(
          () => TopicController(),
    );
  }
}
