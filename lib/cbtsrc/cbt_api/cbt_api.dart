import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/screens/splash/splash_view.dart';
import 'package:digigyan/cbtsrc/screens/widgets/cbt_toast/cbt_toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CbtRequest {
  final String url;
  final bool isStandredData;
  final Map<String, dynamic> data;

  CbtRequest({
    required this.url,
    required this.data,
    this.isStandredData = false,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
      'X-Requested-With': 'XMLHttpRequest',
      // Required for CORS support to work
      "Access-Control-Allow-Credentials": true,
      // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST,OPTIONS"
    }));
  }

  void get({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  void postRequest({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    _dio().post(this.url, data: data).then((res) {
      if (onSuccess != null) {
        if (res.data["MESSAGE"] == "You aren't valid!!") {
          CboToast.showText(text: "Session Expired!!");
          prefHandler.logout();
          Get.to(() => SplashView());
        } else {
          onSuccess(res.data);
        }
      }
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }

  getRequestData() async {
    return {
      "CBT_REQUEST_DATA": data,
      "REQUEST_TRACKING": {
        "PR_EMPLOYEE": await prefHandler.getUserId(),
        "PR_LOCATION": "",
        "PR_ID_ADDRESS": "",
        "PR_LAT_LONG": "asdas",
        "PR_BATTERY": "rewrw",
        "PR_OS": "dewrewr",
        "PR_PHONE_BRAND": ""
      }
    };
  }
}
