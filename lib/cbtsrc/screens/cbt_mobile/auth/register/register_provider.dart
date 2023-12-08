import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/custom_log.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/user_model/user_model.dart';

class RegisterProvider {
  UserModel? userDataResponse;

  void registerUser({
    required UserModel userModel,
    required Function() beforeSend,
    required Function(ApiResponse<UserModel> userModel) onSuccess,
    required Function(dynamic error) onError,
  }) {
    Map<String, dynamic> param = {
      "PR_NAME": userModel.prName ?? "",
      "PR_EMAIL": userModel.prEmail ?? "",
      "PR_PASSWORD": userModel.prPassword ?? "",
      "PR_SCHOOL": 1, //userModel.pin,
      "PR_PHONE": userModel.prPhone, //userModel.pin,
      "PR_DEPARTMENT": "1",
      "PR_DESIGNATION": "4",
      "PR_TOKEN": userModel.prToken,
    };

    CbtRequest(url: ApiUrls.register, data: param, isStandredData: false)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            userDataResponse = UserModel.fromJson(data["DATA"]);
          } catch (e) {
            codebrightLog("employee parsing error...$e");
          }
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: userDataResponse));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> loginUser({
    required String mobileType,
    required UserModel userModel,
    required Function() beforeSend,
    required Function(ApiResponse<UserModel> userModel) onSuccess,
    required Function(dynamic error) onError,
  })async {
    Map<String, dynamic> param = {
      "PR_USERNAME": userModel.prEmail ?? "",
      "PR_PASSWORD": userModel.prPassword ?? "",
      "PR_TYPE": mobileType,
      "PR_TOKEN": userModel.prToken,
    };

    CbtRequest(url: ApiUrls.login, data: param, isStandredData: false)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            userDataResponse = UserModel.fromJson(data["DATA"]);
          } catch (e) {
            codebrightLog("employee parsing error...$e");
          }
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: userDataResponse));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
