import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/cbt_Image_picker.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_input_fields.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/controller_test_home.dart';
import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:digigyan/cbtsrc/utils/appImages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';

import '../../../cbt_helpers/cbt_loader.dart';

class TestPage extends GetView<TestController> {
  String title;

  TestPage({this.title = "Test Generator"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CbtAppBar(
        title: title,
      ),
      body: Obx(
        () => Container(
          child: StepperPage(controller),
        ),
      ),
    );
  }
}

class StepperPage extends StatefulWidget {
  TestController controller;

  StepperPage(this.controller);

  @override
  _StepperPageState createState() => _StepperPageState(this.controller);
}

class _StepperPageState extends State<StepperPage> {
  int currentStep = 0;
  TestController controller;

  _StepperPageState(this.controller);

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              child: Card(
                color: CodebrightColor.primary,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CBTTextNew(
                    "Previous",
                    style: TStyle.f16_B.styleWith(color: Colors.white),
                  ),
                ),
              ),
              onPressed: () =>
                  {setState(() => currentStep > 0 ? --currentStep : null)}),
          TextButton(
              child: Card(
                color: CodebrightColor.cbtPrimarColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CBTTextNew(
                    "  Next  ",
                    style: TStyle.f16_B.styleWith(color: Colors.white),
                  ),
                ),
              ),
              onPressed: () => {
                    if (controller.goNext(currentStep))
                      {
                        setState(() =>
                            currentStep < controller.statusList.length - 1
                                ? ++currentStep
                                : null)
                      }
                    else
                      {}
                  }),
        ],
      ),
      body: CupertinoPageScaffold(
        child: SafeArea(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              switch (orientation) {
                case Orientation.portrait:
                  return _buildStepper(StepperType.vertical);
                case Orientation.landscape:
                  return _buildStepper(StepperType.horizontal);
                default:
                  throw UnimplementedError(orientation.toString());
              }
            },
          ),
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    // final canCancel = currentStep > 0;
    // final canContinue = currentStep < controller.statusList.length;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      // onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      // onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (var i = 0; i < controller.statusList.length; ++i)
          _buildStep(
            title: CBTTextNew('${controller.statusList.value[i]}'),
            isActive: i == currentStep,
            state: i == currentStep
                ? StepState.editing
                : i < currentStep
                    ? StepState.complete
                    : StepState.indexed,
          ),
        // _buildStep(
        //   title: Text('Error'),
        //   state: StepState.error,
        // ),
        // _buildStep(
        //   title: Text('Disabled'),
        //   state: StepState.disabled,
        // )
      ],
    );
  }

  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text(''),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 120),
                color: Colors.lightGreenAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Container(
                        height: 150,
                        alignment: Alignment.center,
                        child: Image.asset(AppImages.digigyanLogo),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Card(
                  margin: EdgeInsets.only(bottom: 120, left: 8, right: 20),
                  elevation: 10,
                  color: Colors.grey.shade200,
                  child: currentStep == 0
                      ? enterDetails()
                      : currentStep == 1
                          ? selectChapter()
                          : SizedBox(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectChapter() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                    child: CBTTextNew(
                      "Select The Chapter To Include In The Test.",
                      style: TStyle.f18_B
                          .styleWith(fontFamily: AppFontsNeo.leagueBold),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => controller
                              .mainTestGeneration.value.prChapters!.isNotEmpty
                          ? Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(bottom: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  itemCount: controller.mainTestGeneration.value
                                      .prChapters!.length,
                                  itemBuilder: (context, i) {
                                    final chapter = controller
                                        .mainTestGeneration
                                        .value
                                        .prChapters![i];
                                    return Container(
                                      color: Colors.grey.shade50,
                                      margin: EdgeInsets.all(3),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                CBTTextNew(
                                                  " ${i + 1}. ",
                                                  style: TStyle.f18_B.styleWith(
                                                      fontFamily: AppFontsNeo
                                                          .leagueBold),
                                                ),
                                                CBTTextNew(
                                                    chapter!
                                                        .prName!.toTitleCase,
                                                    style: TStyle.f12_B.styleWith(
                                                        fontFamily: AppFontsNeo
                                                            .leagueBold,
                                                        color:
                                                            CodebrightColor.primary)),
                                              ],
                                            ),
                                          ),
                                          Checkbox(
                                              value: chapter.isSelected,
                                              onChanged: (v) => {
                                                    controller.isChanged.value =
                                                        false,
                                                    controller.changeChecked(
                                                        v, i)
                                                  })
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: CBTLoaderProgress(
                                isImage: false,
                                isGif: true,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  enterDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0, top: 20),
                  child: CBTTextNew(
                    "Enter Required Details And Click The Next Button.",
                    style: TStyle.f18_B
                        .styleWith(fontFamily: AppFontsNeo.leagueBold),
                  ),
                ),
                Container(
                  child: CBTInputText(
                    hintText: "Test Name",
                    valueText: controller.nameController.text,
                    controller: controller.nameController,
                    borderRadius: 5,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    inputFormatters: [LengthLimitingTextInputFormatter(200)],
                    prefixIcon: const Icon(
                      Icons.verified_user,
                      color: CodebrightColor.cbtPrimarColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: CBTInputText(
                              hintText: "Create Mode",
                              valueText: controller.testMode.text,
                              controller: controller.testMode,
                              borderRadius: 5,
                              keyboardType: TextInputType.number,
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
                              hintText: "Test Type",
                              valueText: controller.testType.text,
                              controller: controller.testType,
                              borderRadius: 5,
                              keyboardType: TextInputType.number,
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
                              hintText: "Test Duration (In Minute)",
                              valueText: controller.durationController.text,
                              controller: controller.durationController,
                              borderRadius: 5,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(8)
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CBTTextNew(
                            "Add Logo",
                            style: TStyle.f16_B
                                .styleWith(fontFamily: AppFontsNeo.leagueBold),
                          ),
                          CBOImagePicker(
                              // alreadyUploadedUrl: img.isNotEmpty
                              //     ? img.startsWith("http")
                              //     ? img
                              //     : ApiUrls.baseUrlImage(img)
                              //     : "",

                              height: 140,
                              title: "Add Logo",
                              width: 350,
                              uploadUrl: ApiUrls.fileUpload,
                              imgPathCallBack: (imgPickHolder) =>
                                  controller.onAttachment(imgPickHolder),
                              isServerUpload: true,
                              isLineNot: false,
                              isEditable: true,
                              isGallery: true),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
          ),
        )
      ],
    );
  }
}
