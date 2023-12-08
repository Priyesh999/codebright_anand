
import 'package:get/get.dart';


class MoreController extends GetxController {
  late RxBool _isDark;
  bool get isDark => _isDark.value;
  set isDark(bool value) => _isDark.value = value;

  late RxString _baseURL;
  String get baseURL => _baseURL.value;
  set baseURL(String value) => _baseURL.value = value;

  @override
  void onInit() {
    super.onInit();
  }
}
