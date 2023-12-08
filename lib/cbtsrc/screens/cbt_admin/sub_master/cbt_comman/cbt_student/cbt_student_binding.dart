import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_student/cbt_student_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/video_controller.dart';
import 'package:get/get.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(
      () => StudentController(),
    );
    Get.lazyPut<VideoController>(
      () => VideoController(),
    );
  }
}
