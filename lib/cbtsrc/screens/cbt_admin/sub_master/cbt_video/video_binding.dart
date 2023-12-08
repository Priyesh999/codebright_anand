import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_controller.dart';
import 'package:get/get.dart';


class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoController>(
          () => VideoController(),
    );
  }
}
