import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_input_fields.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/login/login_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/sd_txt.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../cbt_webview/cbt_webview.dart';

class LoginView extends GetView<LoginController> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                if (CBOResponsive.isDesktop(context))
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: CBOResponsive.isDesktop(context) ? 400 : 150,
                          alignment: Alignment.center,
                          child: Image.asset(AppImages.digigyanLogo),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: CBOResponsive.isDesktop(context) ? 100.0 : 20.0,
                          top: CBOResponsive.isDesktop(context) ? 200.0 : 20.0,
                          right:
                              CBOResponsive.isDesktop(context) ? 100.0 : 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!CBOResponsive.isDesktop(context))
                            Container(
                              height: 200,
                              // width: 200,
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppImages.digigyanLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CBTInputText(
                                  hintText: "Email Id / Mobile Number",
                                  valueText: controller.emailController.text,
                                  controller: controller.emailController,
                                  borderRadius: 5,
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(100)
                                  ],
                                  prefixIcon: const Icon(
                                    Icons.verified_user,
                                    color: CodebrightColor.cbtPrimarColor,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Container(
                                  child: CBTInputText(
                                    hintText: "Password",
                                    valueText: controller.passController.text,
                                    controller: controller.passController,
                                    borderRadius: 5,
                                    keyboardType: TextInputType.visiblePassword,
                                    autofocus: false,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(100)
                                    ],
                                    prefixIcon: const Icon(
                                      Icons.password,
                                      color: CodebrightColor.cbtPrimarColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () => {
                                      Get.to(() => CbtWebView(
                                            // url:ApiUrls.baseUrlImage(data['DATA'][0]['PR_PDF_FILE']),
                                            url:
                                                "http://demo.codebright.in/form/forget-password",
                                            //   // pdfUrl:'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                                            title: "Forgot Password",
                                          )),
                                    },
                                    child: const SdRichText(
                                      "Forgot Password?",
                                      text3: "Click here",
                                      txt3Color: CodebrightColor.cbtPrimarColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: size.width,
                                  child: ElevatedButton(
                                      style: MethodUtils.raisedButtonStyle(
                                          Colors.brown),
                                      onPressed: () => controller.login(),
                                      child: DxTextWhite(
                                        "Login",
                                        mBold: true,
                                        mSize: 18,
                                      )),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () =>
                                        {controller.navigateRegister()},
                                    child: const SdRichText(
                                      "Don't have an account?",
                                      text3: "Sign Up",
                                      txt3Color: CodebrightColor.cbtPrimarColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
