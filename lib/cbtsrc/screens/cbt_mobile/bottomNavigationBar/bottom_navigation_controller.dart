import 'dart:collection';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  Future<void> navigateToView() async {
    Future.delayed(const Duration(seconds: 1), () async {});
  }

  int activeIndex = 0;

  ListQueue<int> _navigationQueue = ListQueue();

  void setActiveIndex(int index) async {
    this.activeIndex = index;
    _navigationQueue.addLast(index);
  }

  Future<bool> getActiveIndex() async {
    if (_navigationQueue.isEmpty) {
    } else {
      activeIndex = _navigationQueue.last;
      _navigationQueue.removeLast();
      return false;
    }
    return false;
  }
}
