import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/style/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog {
  static confirmAdmin({
    required String title,
    required String message,
    required void Function() onConfirm,
    required void Function() onCancel,
    required TextEditingController controller,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  message,
                  style: TextStyle(
                    color: AppColor.secondarySoft,
                    height: 150 / 100,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onCancel,
                    child: Text(
                      "cancel",
                      style: TextStyle(color: AppColor.secondarySoft),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      primary: AppColor.primaryExtraSoft,
                      elevation: 0,
                      onPrimary: AppColor.primary,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 6,
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    child: Text("confirm"),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.primary,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static showPresenceAlert({
    required String title,
    required String message,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    required void Function() onConfirm,
    required void Function() onCancel,
  }) {
    Get.defaultDialog(
      title: "",
      contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      radius: 8,
      titlePadding: EdgeInsets.zero,
      titleStyle: TextStyle(fontSize: 0),
      content: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 32, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CBTTextNew(
                  title,
                  style: TStyle.f16_B
                      .styleWith(fontFamily: AppFontsNeo.leagueBold),
                ),
                SizedBox(height: 16),
                Text(
                  message,
                  style: TextStyle(
                      color: AppColor.secondarySoft,
                      height: 150 / 100,
                      fontFamily: AppFontsNeo.leagueSemiBold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Visibility(
                  visible: cancelText.isNotEmpty,
                  child: Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: onCancel,
                      child: Text(
                        cancelText,
                        style: TextStyle(color: AppColor.secondarySoft),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        primary: AppColor.primaryExtraSoft,
                        elevation: 0,
                        onPrimary: AppColor.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Visibility(
                  visible: confirmText.isNotEmpty,
                  child: Expanded(
                    flex: 6,
                    child: ElevatedButton(
                      onPressed: onConfirm,
                      child: Text(confirmText),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.primary,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
