import 'dart:io';

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
import 'package:permission_handler/permission_handler.dart';

class RegisterController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();
  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController rePinController = TextEditingController();

  Future<void> register(BuildContext mContext) async {
    if (userNameController.text.isEmpty) {
      errorMessage("Please Enter User Name");
      return;
    }

    if (emailIdController.text.isEmpty) {
      errorMessage("Please Enter Email Id");
      return;
    }
    if (mobileNumberController.text.isEmpty) {
      errorMessage("Please Enter Mobile Number");
      return;
    }
    if (pinController.text.isEmpty) {
      errorMessage("Please Enter Password");
      return;
    }
    if (pinController.text != rePinController.text) {
      errorMessage("Password and Confirm Password Not Matched");
      return;
    }

    var tokenFcm = await prefHandler.getFCMToken();
    UserModel _u = UserModel(
        prName: userNameController.text,
        prEmail: emailIdController.text,
        prPhone: mobileNumberController.text,
        prPassword: pinController.text,
        prToken: tokenFcm);

    isLoading.value = true;
    try {
      if (await MethodUtils.isInternetPresent()) {
        RegisterProvider().registerUser(
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
                await prefHandler.setLoginPin(apiResponse.resObject!.prPin!);
                await prefHandler.setCompanyCode(
                    apiResponse.resObject!.prCompany?.prCompanyCode ?? "");
                await prefHandler.setCompanyName(
                    apiResponse.resObject!.prCompany?.prCompanyName ?? "");

                await prefHandler.setCompanyID(
                    apiResponse.resObject!.prCompany?.prCompanyId.toString() ??
                        "");
                await prefHandler
                    .setEmployeeCode(apiResponse.resObject!.prEmployeeCode!);

                await prefHandler.setDesignationId(apiResponse
                    .resObject!.prDesignation!.prDesignationId
                    .toString());

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

  showPermission(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Permission Error",
      message: message,
      confirmText: "Go To Setting",
      onCancel: () => Get.back(),
      onConfirm: () async {
        Get.back();
        openAppSettings();
      },
    );
  }

  navigateRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  navigatePinScreen() {
    Get.toNamed(Routes.PIN);
  }

  int _getDeniedCount(Map<Permission, PermissionStatus> _permissionResp) {
    int _deniedPermissionCount = 0;
    _permissionResp.forEach((key, value) {
      if (!value.isGranted) {
        _deniedPermissionCount = _deniedPermissionCount + 1;
        return;
      }
    });
    return _deniedPermissionCount;
  }
}
