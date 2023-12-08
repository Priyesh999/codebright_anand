import 'package:digigyan/cbtsrc/screens/test_generator/test_home/controller_test_home.dart';
import 'package:get/get.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestController>(
      () => TestController(),
    );
  }
}
