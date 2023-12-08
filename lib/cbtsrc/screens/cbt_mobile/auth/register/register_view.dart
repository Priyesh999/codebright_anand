import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbo_responsive.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_input_fields.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/style/app_color.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/register/register_controller.dart';
import 'package:digigyan/cbtsrc/screens/widgets/sd_txt.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
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
                          top: CBOResponsive.isDesktop(context) ? 200.0 : 50.0,
                          right:
                              CBOResponsive.isDesktop(context) ? 100.0 : 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!CBOResponsive.isDesktop(context))
                            Column(
                              children: [
                                Container(
                                  height: 200,
                                  // width: 200,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppImages.digigyanLogo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          Container(
                            child: CBTInputText(
                              hintText: "User Name",
                              valueText: controller.userNameController.text,
                              controller: controller.userNameController,
                              borderRadius: 10,
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
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            child: CBTInputText(
                              hintText: "Email Id",
                              valueText: controller.emailIdController.text,
                              controller: controller.emailIdController,
                              borderRadius: 5,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100)
                              ],
                              prefixIcon: const Icon(
                                Icons.person,
                                color: CodebrightColor.cbtPrimarColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            child: CBTInputText(
                              hintText: "Mobile Number",
                              valueText: controller.mobileNumberController.text,
                              controller: controller.mobileNumberController,
                              borderRadius: 5,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              prefixIcon: const Icon(
                                Icons.person,
                                color: CodebrightColor.cbtPrimarColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            child: CBTInputText(
                              hintText: "Password",
                              valueText: controller.pinController.text,
                              controller: controller.pinController,
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
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            child: CBTInputText(
                              hintText: "Confirm Password",
                              valueText: controller.rePinController.text,
                              controller: controller.rePinController,
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
                          SizedBox(
                            height: 50,
                            width: size.width,
                            child: ElevatedButton(
                                style:
                                    MethodUtils.raisedButtonStyle(Colors.red),
                                onPressed: () => controller.register(context),
                                child: DxTextWhite(
                                  "Register",
                                  mBold: true,
                                  mSize: 18,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () => {controller.navigateRegister()},
                              child: const SdRichText(
                                "Already have an Account?",
                                text3: "Sign In",
                                txt3Color: CodebrightColor.cbtPrimarColor,
                              ),
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
