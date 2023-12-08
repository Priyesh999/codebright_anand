import 'package:digigyan/cbtsrc/app_route/app_pages.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/constants/app_messages.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/register/register_provider.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/user_model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> login() async {
    String loginType = "MOBILE";
    if (emailController.text.isEmpty) {
      errorMessage("Please Enter Email Id/Mobile Number");
      return;
    }
    if (emailController.text.contains("@")) {
      loginType = "EMAIL";
    }

    if (passController.text.isEmpty) {
      errorMessage("Please Enter Password");
      return;
    }

    var tokenFcm = await prefHandler.getFCMToken();
    UserModel _u = UserModel(
        prEmail: emailController.text,
        prPassword: passController.text,
        prToken: tokenFcm);

    isLoading.value = true;
    try {
      if (await MethodUtils.isInternetPresent()) {
        // if (Platform.isIOS || Platform.isAndroid) {
        //   final List<Permission> _permissions = <Permission>[
        //     Permission.storage,
        //     Permission.camera,
        //     if (Platform.isAndroid) Permission.phone,
        //     // if (gpsYN) Permission.location,
        //   ];
        //
        //   final _permissionResp = await _permissions.request();
        //
        //   // if (gpsYN) {
        //   //   Permission.location.shouldShowRequestRationale;
        //   // }
        //   _deniedPermissionCount = await _getDeniedCount(_permissionResp);
        //
        //   if (_deniedPermissionCount > 0) {
        //     showPermission(AppMessages.permissionDenied);
        //     return;
        //   }
        // }

        RegisterProvider().loginUser(
          mobileType: loginType,
          userModel: _u,
          beforeSend: () {},
          onSuccess: (apiResponse) async {
            if (apiResponse.isSuccess) {
              try {
                await prefHandler
                    .setUserId(apiResponse.resObject!.prEmployeeId!.toString());
                await prefHandler.setUserName(apiResponse.resObject!.prName!);
                await prefHandler.setUserImage(
                    apiResponse.resObject!.prEmployeeDetails?.prImagePath ??
                        "");
                await prefHandler.setMobile(apiResponse.resObject!.prPhone!);
                await prefHandler.setLoginPin(apiResponse.resObject!.prToken!);
                await prefHandler.setUserToken(apiResponse.resObject!.prToken!);
                await prefHandler.setCompanyCode(
                    apiResponse.resObject!.prCompany?.prCompanyCode ?? "");
                await prefHandler.setCompanyName(
                    apiResponse.resObject!.prCompany?.prCompanyName ?? "");

                await prefHandler.setCompanyID(
                    apiResponse.resObject!.prCompany?.prCompanyId.toString() ??
                        "");
                await prefHandler
                    .setEmployeeCode(apiResponse.resObject!.prEmployeeCode!);

                // await prefHandler.setDesignationId(apiResponse
                //     .resObject!.prDesignation!.prDesignationId
                //     .toString());

                if (GetPlatform.isWeb) {
                  await prefHandler.setLogIn(true);
                  // Get.toNamed(Routes.HOME_ADMIN);
                  Get.toNamed(Routes.SPLASH);
                } else {
                  await prefHandler.setLogIn(true);
                  Get.toNamed(Routes.HOME_MOBILE);
                }
              } catch (e) {
                errorMessage(e.toString());
              }
            } else {
              errorMessage(apiResponse.errorCause);
            }
            isLoading.value = false;
            update();
          },
          onError: (error) {
            isLoading.value = false;
            errorMessage(error.toString());
            update();
          },
        );
      } else {
        errorMessage(AppMessages.getNoInternetMsg);
      }
      isLoading.value = false;
    } catch (e) {
      // CustomToast.errorToast("Error", "Error because : ${e.toString()}");
    }
  }

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        // Get.toNamed(Routes.HOME_ADMIN);
      },
    );
  }

  navigateRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  navigatePinScreen() {
    // Get.toNamed(Routes.BOTTOM_NAVIGATION);
  }
}
