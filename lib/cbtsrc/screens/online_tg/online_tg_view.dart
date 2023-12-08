import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_video/player_type_enum.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_data.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/app_color.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import '../../cbt_helpers/cbt_Image_picker.dart';
import '../../cbt_helpers/cbt_loader.dart';
import '../../cbt_helpers/dxwidget/codebright_input_fields.dart';
import '../../constants/api_urls.dart';
import '../test_generator/test_home/examples.dart';
import '../widgets/default_app_baar.dart';
import 'live_online.dart';
import 'online_tg_controller.dart';

class OnLineTgView extends GetView<OnlineTgController> {
  String title;
  List<PrChapter> prTestGeneratorData;
  CBTTGLanguage cbttgLanguage;
  String bookId;
  String categoryID;
  OnLineTgView({this.title = "Test Generator", required this.prTestGeneratorData,this.cbttgLanguage=CBTTGLanguage.CBTENGLISH,required this.bookId,required this.categoryID});

  late Size size;

  RxList<Widget> widgetData = <Widget>[].obs;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    widgetData.clear();
    widgetData.value.add(enterDetails(context));
    widgetData.value.add(selectChapter());
    widgetData.value.add(selectManulalQuestion());
    widgetData.value.add(selectQuestion());
    widgetData.value.add(generateDocument1());
    controller.addMainListTest(prTestGeneratorData!);

    return Obx(
        () => controller.isChanged.value ? _widgetScaf() : _widgetScaf());
  }

  selectChapter() {
    return Obx(
        () => controller.isChanged.value ? chapterQidget() : chapterQidget());
  }

  selectQuestion() {
    return Obx(() => controller.isChanged.value
        ? Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0, top: 20),
                                child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                  "Enter The Number Of Question To Be Included In Each Category.Change The Marks Per Question,if Required":
                                  "प्रत्येक श्रेणी में शामिल किए जाने वाले प्रश्नों की संख्या दर्ज करें। यदि आवश्यक हो तो प्रति प्रश्न अंक बदलें",
                                  style: TStyle.f18_B.styleWith(
                                      fontFamily: AppFontsNeo.leagueBold),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CBTTextNew(cbttgLanguage==CBTTGLanguage.CBT_HINDI?
                                    "कुल प्रश्न : ${controller.noOfQ.value}":
                                "Total Question : ${controller.noOfQ.value}"),
                                CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                    "Total Marks : ${controller.marksOfQ.value}":
                                    "कुल मार्क : ${controller.marksOfQ.value}"),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Obx(
                            () => controller
                                    .mainTestGeneration
                                    .value
                                    .prChapters!
                                    .first
                                    .prQuestionType!
                                    .isNotEmpty
                                ? Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    CBTTextNew(
                                                      " ",
                                                      style: TStyle.f18_B
                                                          .styleWith(
                                                              fontFamily:
                                                                  AppFontsNeo
                                                                      .leagueBold),
                                                    ),
                                                    CBTTextNew("",
                                                        style: TStyle.f7_B.styleWith(
                                                            fontFamily:
                                                                AppFontsNeo
                                                                    .leagueBold,
                                                            color: CodebrightColor
                                                                .cbtPrimarColor)),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: SizedBox(
                                                  width: 50,
                                                  child: CBTTextNew(
                                                    maxLine: 5,cbttgLanguage==CBTTGLanguage.CBT_HINDI?
                                                    "प्रश्न\n की\n संख्या":
                                                    "No \nOf \nQuestion",
                                                    style: TStyle.f7_B.styleWith(
                                                        fontFamily: AppFontsNeo
                                                            .leagueSemiBold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: SizedBox(
                                                  width: 50,
                                                  child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                                    "Marks \nPer\n Question":
                                                    "प्रति\n प्रश्न\n अंक",
                                                    maxLine: 5,
                                                    style: TStyle.f7_B.styleWith(
                                                        fontFamily: AppFontsNeo
                                                            .leagueSemiBold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: controller
                                                  .mainTestGeneration
                                                  .value
                                                  .prChapters!
                                                  .first
                                                  .prQuestionType!
                                                  .length,
                                              itemBuilder: (context, i) {
                                                final chapter = controller
                                                    .mainTestGeneration
                                                    .value
                                                    .prChapters!
                                                    .first
                                                    .prQuestionType![i];
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
                                                              style: TStyle
                                                                  .f18_B
                                                                  .styleWith(
                                                                      fontFamily:
                                                                          AppFontsNeo
                                                                              .leagueBold),
                                                            ),
                                                            CBTTextNew(
                                                                "${chapter.prName!.toTitleCase}( ${controller.getTotalCountofQuestions(chapter)} )",
                                                                style: TStyle.f12_B.styleWith(
                                                                    fontFamily:
                                                                        AppFontsNeo
                                                                            .leagueBold,
                                                                    color: CodebrightColor
                                                                        .cbtPrimarColor)),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 50,
                                                          child: CBTInputText(
                                                            hintText: "",
                                                            valueText:
                                                                "${chapter.noOFQuestion}",
                                                            enabled: false,
                                                            isEditable: false,
                                                            // controller: controller.nameController,
                                                            borderRadius: 5,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            autofocus: false,
                                                            onChanged: (v) {
                                                              controller
                                                                      .isChanged
                                                                      .value =
                                                                  false;
                                                              controller
                                                                  .noQuestion(
                                                                      v,
                                                                      i,
                                                                      chapter);
                                                            },
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  3)
                                                            ],
                                                            // prefixIcon: const Icon(
                                                            //   Icons.verified_user,
                                                            //   color: materialPrimaryColor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 30,
                                                          child: CBTInputText(
                                                            hintText: "",
                                                            valueText:
                                                                "${chapter.marksPerQuestion}",
                                                            // controller: controller.nameController,
                                                            borderRadius: 5,
                                                            // enabled: false,
                                                            // isEditable: false,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged: (v) {
                                                              controller
                                                                      .isChanged
                                                                      .value =
                                                                  false;
                                                              controller
                                                                  .markQuestion(
                                                                      v,
                                                                      i,
                                                                      chapter);
                                                            },
                                                            autofocus: false,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  6)
                                                            ],
                                                            // prefixIcon: const Icon(
                                                            //   Icons.verified_user,
                                                            //   color: materialPrimaryColor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
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
          )
        : Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0, top: 20),
                                child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                  "Enter The Number Of Question To Be Included In Each Category. Change The Marks Per Question,if Required":
                                  "प्रत्येक श्रेणी में शामिल किए जाने वाले प्रश्नों की संख्या दर्ज करें। यदि आवश्यक हो तो प्रति प्रश्न अंक बदलें",
                                  style: TStyle.f18_B.styleWith(
                                      fontFamily: AppFontsNeo.leagueBold),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CBTTextNew(cbttgLanguage==CBTTGLanguage.CBT_HINDI?
                                    "कुल प्रश्न : ${controller.noOfQ.value}":
                                "Total Question : ${controller.noOfQ.value}"),
                                CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                    "Total Marks : ${controller.marksOfQ.value}":
                                    "कुल मार्क : ${controller.marksOfQ.value}"),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Obx(
                            () => controller
                                    .mainTestGeneration
                                    .value
                                    .prChapters!
                                    .first
                                    .prQuestionType!
                                    .isNotEmpty
                                ? Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    CBTTextNew(
                                                      " ",
                                                      style: TStyle.f18_B
                                                          .styleWith(
                                                              fontFamily:
                                                                  AppFontsNeo
                                                                      .leagueBold),
                                                    ),
                                                    CBTTextNew("",
                                                        style: TStyle.f7_B.styleWith(
                                                            fontFamily:
                                                                AppFontsNeo
                                                                    .leagueBold,
                                                            color: CodebrightColor
                                                                .cbtPrimarColor)),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: SizedBox(
                                                  width: 50,
                                                  child: CBTTextNew(
                                                    maxLine: 5,cbttgLanguage==CBTTGLanguage.CBT_HINDI?
                                                    "प्रश्न\n की\n संख्या":
                                                    "No \nOf \nQuestion",
                                                    style: TStyle.f7_B.styleWith(
                                                        fontFamily: AppFontsNeo
                                                            .leagueSemiBold),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: SizedBox(
                                                  width: 50,
                                                  child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                                    "Marks \nPer\n Question":
                                                    "प्रति\n प्रश्न\n अंक",
                                                    maxLine: 5,
                                                    style: TStyle.f7_B.styleWith(
                                                        fontFamily: AppFontsNeo
                                                            .leagueSemiBold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: controller
                                                  .mainTestGeneration
                                                  .value
                                                  .prChapters!
                                                  .first
                                                  .prQuestionType!
                                                  .length,
                                              itemBuilder: (context, i) {
                                                final chapter = controller
                                                    .mainTestGeneration
                                                    .value
                                                    .prChapters!
                                                    .first
                                                    .prQuestionType![i];
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
                                                              style: TStyle
                                                                  .f18_B
                                                                  .styleWith(
                                                                      fontFamily:
                                                                          AppFontsNeo
                                                                              .leagueBold),
                                                            ),
                                                            CBTTextNew(
                                                                "${chapter.prName!.toTitleCase}( ${controller.getTotalCountofQuestions(chapter)} )",
                                                                style: TStyle.f12_B.styleWith(
                                                                    fontFamily:
                                                                        AppFontsNeo
                                                                            .leagueBold,
                                                                    color: CodebrightColor
                                                                        .cbtPrimarColor)),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 50,
                                                          child: CBTInputText(
                                                            hintText: "",
                                                            valueText:
                                                                "${chapter.noOFQuestion}",
                                                            enabled: false,
                                                            isEditable: false,
                                                            // controller: controller.nameController,
                                                            borderRadius: 5,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            autofocus: false,
                                                            onChanged: (v) {
                                                              controller
                                                                      .isChanged
                                                                      .value =
                                                                  false;
                                                              controller
                                                                  .noQuestion(
                                                                      v,
                                                                      i,
                                                                      chapter);
                                                            },
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  3)
                                                            ],
                                                            // prefixIcon: const Icon(
                                                            //   Icons.verified_user,
                                                            //   color: materialPrimaryColor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 30,
                                                          child: CBTInputText(
                                                            hintText: "",
                                                            valueText:
                                                                "${chapter.marksPerQuestion}",
                                                            // controller: controller.nameController,
                                                            borderRadius: 5,
                                                            // enabled: false,
                                                            // isEditable: false,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged: (v) {
                                                              controller
                                                                      .isChanged
                                                                      .value =
                                                                  false;
                                                              controller
                                                                  .markQuestion(
                                                                      v,
                                                                      i,
                                                                      chapter);
                                                            },
                                                            autofocus: false,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  3)
                                                            ],
                                                            // prefixIcon: const Icon(
                                                            //   Icons.verified_user,
                                                            //   color: materialPrimaryColor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
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
          ));
  }

  selectManulalQuestion() {
    return Obx(() => controller.isChanged.value
        ? _selectManualQuestion()
        : _selectManualQuestion());
  }

  enterDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0, top: 10),
            child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
              "Enter Required Details And Click The Next Button.":
              "आवश्यक विवरण दर्ज करें और अगले बटन पर क्लिक करें।",
              style: TStyle.f14_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
            ),
          ),
          CBTInputText(
            hintText:cbttgLanguage==CBTTGLanguage.CBTENGLISH? "Test Name": "परीक्षण का नाम",
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
          SizedBox(
            height: size.height * 0.01,
          ),
          CBTInputText(hintText:cbttgLanguage==CBTTGLanguage.CBTENGLISH? "Test Duration (In Minute)":
            "परीक्षण अवधि (मिनट में)",
            valueText: controller.durationController.text,
            controller: controller.durationController,
            borderRadius: 5,
            keyboardType: TextInputType.number,
            autofocus: false,
            inputFormatters: [LengthLimitingTextInputFormatter(8)],
            prefixIcon: const Icon(
              Icons.person,
              color: CodebrightColor.cbtPrimarColor,
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          tabsWidget(context),
          SizedBox(
            height: size.height * 0.01,
          ),
          tabsONOFWidget(context),
          SizedBox(
            height: size.height * 0.01,
          ),
          CBTTextNew(cbttgLanguage==CBTTGLanguage.CBT_HINDI?
            "लोगो जोड़ें":
            "Add Logo",
            style: TStyle.f16_B.styleWith(fontFamily: AppFontsNeo.leagueBold),
          ),
          CBOImagePicker(
              // alreadyUploadedUrl: img.isNotEmpty
              //     ? img.startsWith("http")
              //     ? img
              //     : ApiUrls.baseUrlImage(img)
              //     : "",

              height: 140,
              title: cbttgLanguage==CBTTGLanguage.CBTENGLISH?"Add Logo":"लोगो जोड़ें",
              // title: "Add Logo",
              width: 350,
              uploadUrl: ApiUrls.fileUpload,
              imgPathCallBack: (imgPickHolder) =>
                  controller.onAttachment(imgPickHolder),
              isServerUpload: true,
              isLineNot: false,
              isEditable: true,
              isGallery: true),
          SizedBox(
            height: size.height * 0.01,
          ),
        ],
      ),
    );
  }

  Widget tabsWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () => CupertinoSegmentedControl<String>(
              children: tabs([
                // "  विद्यार्थी  ",
                "  Student  ",
                // "  अध्यापक  ",
                "  Teacher  ",
                // "  MULTI CITY  ",
              ]),
              // padding: EdgeInsets.only(bottom: 8,top: 8),
              borderColor: Colors.grey,
              selectedColor: Colors.teal,
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              pressedColor: Colors.teal,
              unselectedColor: Colors.white,
              onValueChanged: (String val) {
                controller.sharedValue.value = val;
                controller.onUpdateValue(val);
              },
              groupValue: controller.sharedValue.value,
            ),
          )),
    );
  }

  Map<String, Widget> tabs(List<String> getDcs) {
    Map<String, Widget> data = {};
    for (var i = 0; i < getDcs.length; i++) {
      data[getDcs[i]] = getDcs[i] == controller.sharedValue.value
          ? CBTTextNew(
              getDcs[i],
              style: TStyle.f12_B.styleWith(color: Colors.white),
            )
          : CBTTextNew(
              getDcs[i],
              style:
                  TStyle.f12_B.styleWith(color: CodebrightColor.cbtPrimarColor),
            );
    }
    return data;
  }

  Widget tabsONOFWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Obx(
            () => CupertinoSegmentedControl<String>(
              children: tabsonOf([
                // "  ऑफलाइन  ",
                "  Ofline  ",
                // "  ऑनलाइन  ",
                "  Online  ",
                // "  MULTI CITY  ",
              ]),
              // padding: EdgeInsets.only(bottom: 8,top: 8),
              borderColor: Colors.grey,
              selectedColor: Colors.teal,
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              pressedColor: Colors.teal,
              unselectedColor: Colors.white,
              onValueChanged: (String val) {
                controller.onofValue.value = val;
                controller.onUpdateOnOfValue(val);
              },
              groupValue: controller.onofValue.value,
            ),
          )),
    );
  }

  Map<String, Widget> tabsonOf(List<String> getDcs) {
    Map<String, Widget> data = {};
    for (var i = 0; i < getDcs.length; i++) {
      data[getDcs[i]] = getDcs[i] == controller.onofValue.value
          ? CBTTextNew(
              getDcs[i],
              style: TStyle.f12_B.styleWith(color: Colors.white),
            )
          : CBTTextNew(
              getDcs[i],
              style:
                  TStyle.f12_B.styleWith(color: CodebrightColor.cbtPrimarColor),
            );
    }
    return data;
  }

  generateDocument1() {
    // return SizedBox();
    return Container(
        child: PdfPreview(
      maxPageWidth: 700,

      build: (format) => TestPaperPdfOnline(controller.nameController.text,
              'live_online.dart', generateDocumentLiveOnline)
          // 'document.dart', generateDocumentLive)
          .builder(format, controller.qustionPaperGeneration.value, controller),
      // TestPaperPdf('DOCUMENT', 'document.dart', generateTestPaper).builder(
      //     format, controller.qustionPaperGeneration.value, controller),
    ));
  }

  getQuestionList(PrQuestionType type) {
    // List<Widget> listWiget = List.empty(growable: true);

    return ListView.builder(itemBuilder: (context, i) {
      List<MainQuestion> listQuestion = controller.getQuestionList(type);
      return ListTile(
        title: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  CBTTextNew(
                    " ${i + 1}. ",
                    style: TStyle.f18_B
                        .styleWith(fontFamily: AppFontsNeo.leagueBold),
                  ),
                  CBTTextNew(listQuestion[i].prQuestion!.toTitleCase,
                      style: TStyle.f12_B.styleWith(
                          fontFamily: AppFontsNeo.leagueBold,
                          color: CodebrightColor.cbtPrimarColor)),
                ],
              ),
            ),
            Checkbox(
                value: listQuestion[i].isSelected,
                onChanged: (v) => {
                      controller.isChanged.value = false,
                      controller.changeCheckedQuestionMain(
                          v!, i, type, listQuestion[i].prQuestion!)
                    })
          ],
        ),
      );
    });

    // List<MainQuestion> listQuestion = controller.getQuestionList(type);
    //
    // for (int i = 0; i < listQuestion.length; i++) {
    //   listWiget.add(Expanded(
    //     child: ListTile(
    //       title: Container(
    //         color: Colors.white,
    //         child: Column(
    //           children: [
    //             Expanded(
    //               child: Row(
    //                 children: [
    //                   CBTTextNew(
    //                     " ${i + 1}. ",
    //                     style: TStyle.f18_B
    //                         .styleWith(fontFamily: AppFontsNeo.leagueBold),
    //                   ),
    //                   CBTTextNew(listQuestion[i].prQuestion!.toTitleCase,
    //                       style: TStyle.f12_B.styleWith(
    //                           fontFamily: AppFontsNeo.leagueBold,
    //                           color: CodebrightColor.cbtPrimarColor)),
    //                 ],
    //               ),
    //             ),
    //             Checkbox(
    //                 value: listQuestion[i].isSelected,
    //                 onChanged: (v) => {
    //                       controller.isChanged.value = false,
    //                       controller.changeCheckedQuestionMain(
    //                           v!, i, type, listQuestion[i].prQuestion!)
    //                     })
    //           ],
    //         ),
    //       ),
    //     ),
    //   ));
    // }
    //
    // return listWiget;
  }

  Widget chapterQidget() {
    return Container(
        child: Column(
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
                  child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBT_HINDI?
                    "परीक्षण में शामिल करने के लिए अध्याय का चयन करें।":
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
                                      .mainTestGeneration.value.prChapters![i];
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
                                                    fontFamily:
                                                        AppFontsNeo.leagueBold),
                                              ),
                                              CBTTextNew(
                                                  chapter.prName!.toTitleCase,
                                                  style: TStyle.f12_B.styleWith(
                                                      fontFamily: AppFontsNeo
                                                          .leagueBold,
                                                      color: CodebrightColor
                                                          .cbtPrimarColor)),
                                            ],
                                          ),
                                        ),
                                        Checkbox(
                                            value: chapter.isSelected,
                                            onChanged: (v) => {
                                                  controller.changeChecked(v, i)
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
    ));
  }

  _widgetScaf() {
    return Scaffold(
      appBar: CbtAppBar(
        title: '${controller.statusList.value[0]}',
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ShakeWidget(
            child: TextButton(
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                      "Previous":
                      "Back",
                      style: TStyle.f16_B.styleWith(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () => {Get.back()}),
          ),
          ShakeWidget(
            child: TextButton(
                child: Card(
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                      "Previous":
                      "पहले का",
                      style: TStyle.f16_B.styleWith(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () => {
                      controller.isChanged.value = false,
                      if (controller.currentStep.value <
                          controller.statusList.length)
                        {
                          if (controller.currentStep.value != 0)
                            {
                              controller.isSelected.value -= 1,
                              controller.currentStep.value =
                                  --controller.currentStep.value,
                              controller.isChanged.value = true,
                            }
                        }
                    }),
          ),
          ShakeWidget(
            child: Visibility(
              visible: controller.currentStep.value != 4,
              child: TextButton(
                  child: Card(
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBT_HINDI?
                        "  अगला  ":
                        "  Next  ",
                        style: TStyle.f16_B.styleWith(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () => {
                        controller.isChanged.value = false,
                        if (controller.goNext(controller.currentStep.value))
                          {
                            if (controller.currentStep.value <
                                controller.statusList.length - 1)
                              {
                                controller.isSelected.value += 1,
                                controller.currentStep.value =
                                    ++controller.currentStep.value,
                              }
                          }
                      }),
            ),
          ),
        ],
      ),
      body: Obx(
        () => controller.isChanged.value
            ? Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: widgetData[controller.isSelected.value],
              )
            : Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: widgetData[controller.isSelected.value],
              ),
      ),
    );
  }

  _selectManualQuestion() {
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
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0, top: 20),
                          child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                            "Enter The Number Of Question To Be Included In Each Category. Change The Marks Per Question,if Required":
                            "प्रत्येक श्रेणी में शामिल किए जाने वाले प्रश्नों की संख्या दर्ज करें। यदि आवश्यक हो तो प्रति प्रश्न अंक बदलें",
                            style: TStyle.f18_B
                                .styleWith(fontFamily: AppFontsNeo.leagueBold),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                              "Total Question : ${controller.noOfQ.value}":
                              "कुल प्रश्न : ${controller.noOfQ.value}"),
                          CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                              "Total Marks : ${controller.marksOfQ.value}":
                              "कुल मार्क : ${controller.marksOfQ.value}"),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Obx(
                      () => controller.mainTestGeneration.value.prChapters!
                              .first.prQuestionType!.isNotEmpty
                          ? Container(
                              color: Colors.white,
                              margin: EdgeInsets.only(bottom: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              CBTTextNew(
                                                " ",
                                                style: TStyle.f18_B.styleWith(
                                                    fontFamily:
                                                        AppFontsNeo.leagueBold),
                                              ),
                                              CBTTextNew("",
                                                  style: TStyle.f7_B.styleWith(
                                                      fontFamily: AppFontsNeo
                                                          .leagueBold,
                                                      color: CodebrightColor
                                                          .cbtPrimarColor)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: SizedBox(
                                            width: 50,
                                            child: CBTTextNew(
                                              maxLine: 5,cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                              "No \nOf \nQuestion":
                                              "प्रश्न\n की\n संख्या",
                                              style: TStyle.f7_B.styleWith(
                                                  fontFamily: AppFontsNeo
                                                      .leagueSemiBold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: SizedBox(
                                            width: 50,
                                            child: CBTTextNew(cbttgLanguage==CBTTGLanguage.CBTENGLISH?
                                              "Marks \nPer\n Question":
                                              "प्रति\n प्रश्न\n अंक",
                                              maxLine: 5,
                                              style: TStyle.f7_B.styleWith(
                                                  fontFamily: AppFontsNeo
                                                      .leagueSemiBold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: SizedBox(
                                            width: 50,
                                            child: CBTTextNew(
                                              " \n\n ",
                                              maxLine: 5,
                                              style: TStyle.f7_B.styleWith(
                                                  fontFamily: AppFontsNeo
                                                      .leagueSemiBold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: controller
                                            .mainTestGeneration
                                            .value
                                            .prChapters!
                                            .first
                                            .prQuestionType!
                                            .length,
                                        itemBuilder: (context, i) {
                                          final chapter = controller
                                              .mainTestGeneration
                                              .value
                                              .prChapters!
                                              .first
                                              .prQuestionType![i];
                                          return InkWell(
                                            onTap: () {
                                              Get.to(() => SelectMQ(
                                                    controller: controller,
                                                    type: chapter,
                                                  ));
                                              // Get.bottomSheet(getQuestionList(chapter));
                                            },
                                            child: Container(
                                              color: Colors.grey.shade50,
                                              margin: EdgeInsets.all(3),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            CBTTextNew(
                                                              " ${i + 1}. ",
                                                              style: TStyle
                                                                  .f18_B
                                                                  .styleWith(
                                                                      fontFamily:
                                                                          AppFontsNeo
                                                                              .leagueBold),
                                                            ),
                                                            CBTTextNew(
                                                                "${chapter.prName!.toTitleCase}( ${controller.getTotalCountofQuestions(chapter)} )",
                                                                style: TStyle.f12_B.styleWith(
                                                                    fontFamily:
                                                                        AppFontsNeo
                                                                            .leagueBold,
                                                                    color: CodebrightColor
                                                                        .cbtPrimarColor)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SizedBox(
                                                          height: 30,
                                                          width: 50,
                                                          child: CBTInputText(
                                                            hintText: "",
                                                            enabled: false,
                                                            isEditable: false,
                                                            valueText:
                                                                "${chapter.noOFQuestion}",
                                                            // controller: controller.nameController,
                                                            borderRadius: 5,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            autofocus: false,
                                                            onChanged: (v) {
                                                              controller
                                                                      .isChanged
                                                                      .value =
                                                                  false;
                                                              controller
                                                                  .noQuestion(
                                                                      v,
                                                                      i,
                                                                      chapter);
                                                            },
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  3)
                                                            ],
                                                            // prefixIcon: const Icon(
                                                            //   Icons.verified_user,
                                                            //   color: materialPrimaryColor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2.0),
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 30,
                                                          child: CBTInputText(
                                                            hintText: "",
                                                            valueText:
                                                                "${chapter.marksPerQuestion}",
                                                            // controller: controller.nameController,
                                                            borderRadius: 5,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            onChanged: (v) {
                                                              if (chapter
                                                                      .noOFQuestion! >
                                                                  0) {
                                                                controller
                                                                        .isChanged
                                                                        .value =
                                                                    false;

                                                                controller
                                                                    .markQuestion(
                                                                        v,
                                                                        i,
                                                                        chapter);
                                                              } else {
                                                                controller
                                                                    .errorMessage(
                                                                        "you can not empty no of quetion");
                                                              }
                                                            },
                                                            autofocus: false,
                                                            inputFormatters: [
                                                              LengthLimitingTextInputFormatter(
                                                                  3)
                                                            ],
                                                            // prefixIcon: const Icon(
                                                            //   Icons.verified_user,
                                                            //   color: materialPrimaryColor,
                                                            // ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              // child: ExpansionTile(
                                              //   title: Column(
                                              //     children: [
                                              //       Row(
                                              //         children: [
                                              //           Expanded(
                                              //             child: Row(
                                              //               children: [
                                              //                 CBTTextNew(
                                              //                   " ${i + 1}. ",
                                              //                   style: TStyle
                                              //                       .f18_B
                                              //                       .styleWith(
                                              //                       fontFamily:
                                              //                       AppFontsNeo.leagueBold),
                                              //                 ),
                                              //                 CBTTextNew(
                                              //                     "${chapter.prName!.toTitleCase}( ${controller.getTotalCountofQuestions(chapter)} )",
                                              //                     style: TStyle.f12_B.styleWith(
                                              //                         fontFamily:
                                              //                         AppFontsNeo
                                              //                             .leagueBold,
                                              //                         color: CodebrightColor
                                              //                             .cbtPrimarColor)),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //       Row(
                                              //         crossAxisAlignment: CrossAxisAlignment.end,
                                              //         mainAxisAlignment: MainAxisAlignment.end,
                                              //         children: [
                                              //           Padding(
                                              //             padding:
                                              //             const EdgeInsets
                                              //                 .all(2.0),
                                              //             child: SizedBox(
                                              //               height: 30,
                                              //               width: 50,
                                              //               child: CBTInputText(
                                              //                 hintText: "",
                                              //                 enabled: false,
                                              //                 isEditable: false,
                                              //                 valueText:
                                              //                 "${chapter.noOFQuestion}",
                                              //                 // controller: controller.nameController,
                                              //                 borderRadius: 5,
                                              //                 keyboardType:
                                              //                 TextInputType
                                              //                     .number,
                                              //                 autofocus: false,
                                              //                 onChanged: (v) {
                                              //                   controller
                                              //                       .isChanged
                                              //                       .value =
                                              //                   false;
                                              //                   controller
                                              //                       .noQuestion(
                                              //                       v,
                                              //                       i,
                                              //                       chapter);
                                              //                 },
                                              //                 inputFormatters: [
                                              //                   LengthLimitingTextInputFormatter(
                                              //                       3)
                                              //                 ],
                                              //                 // prefixIcon: const Icon(
                                              //                 //   Icons.verified_user,
                                              //                 //   color: materialPrimaryColor,
                                              //                 // ),
                                              //               ),
                                              //             ),
                                              //           ),
                                              //           SizedBox(
                                              //             width: 10,
                                              //           ),
                                              //           Padding(
                                              //             padding:
                                              //             const EdgeInsets
                                              //                 .all(2.0),
                                              //             child: SizedBox(
                                              //               width: 50,
                                              //               height: 30,
                                              //               child: CBTInputText(
                                              //                 hintText: "",
                                              //                 valueText:
                                              //                 "${chapter.marksPerQuestion}",
                                              //                 // controller: controller.nameController,
                                              //                 borderRadius: 5,
                                              //                 keyboardType:
                                              //                 TextInputType
                                              //                     .number,
                                              //                 onChanged: (v) {
                                              //                   if (chapter
                                              //                       .noOFQuestion! >
                                              //                       0) {
                                              //                     controller
                                              //                         .isChanged
                                              //                         .value = false;
                                              //
                                              //                     controller
                                              //                         .markQuestion(
                                              //                         v,
                                              //                         i,
                                              //                         chapter);
                                              //                   } else {
                                              //                     controller
                                              //                         .errorMessage(
                                              //                         "you can not empty no of quetion");
                                              //                   }
                                              //                 },
                                              //                 autofocus: false,
                                              //                 inputFormatters: [
                                              //                   LengthLimitingTextInputFormatter(
                                              //                       3)
                                              //                 ],
                                              //                 // prefixIcon: const Icon(
                                              //                 //   Icons.verified_user,
                                              //                 //   color: materialPrimaryColor,
                                              //                 // ),
                                              //               ),
                                              //             ),
                                              //           ),
                                              //         ],),
                                              //
                                              //     ],
                                              //   ),
                                              //   // children: <Widget>[
                                              //   //   Obx(() => controller
                                              //   //       .isChanged.value
                                              //   //       ? Column(
                                              //   //       children:
                                              //   //       getQuestionList(chapter))
                                              //   //       : Column(
                                              //   //       children:
                                              //   //       getQuestionList(
                                              //   //           chapter)))
                                              //   // ],
                                              // ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
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
}

class SelectMQ extends StatelessWidget {
  OnlineTgController controller;
  PrQuestionType type;

  SelectMQ({required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isChanged.value
        ? Scaffold(
            appBar: CbtAppBar(
              title: "Select Question",
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                )),
            body: ListView.builder(itemBuilder: (context, i) {
              List<MainQuestion> listQuestion =
                  controller.getQuestionList(type);
              return Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CBTTextNew(
                          " ${i + 1}. ",
                          style: TStyle.f18_B
                              .styleWith(fontFamily: AppFontsNeo.leagueBold),
                        ),
                        CBTTextNew(listQuestion[i].prQuestion!.toTitleCase,
                            style: TStyle.f12_B.styleWith(
                                fontFamily: AppFontsNeo.leagueBold,
                                color: CodebrightColor.cbtPrimarColor)),
                      ],
                    ),
                  ),
                  Checkbox(
                      value: listQuestion[i].isSelected,
                      onChanged: (v) => {
                            controller.isChanged.value = false,
                            controller.changeCheckedQuestionMain(
                                v!, i, type, listQuestion[i].prQuestion!)
                          })
                ],
              );
            }),
          )
        : Scaffold(
            appBar: CbtAppBar(
              title: "Select Question",
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                )),
            body: ListView.builder(itemBuilder: (context, i) {
              List<MainQuestion> listQuestion =
                  controller.getQuestionList(type);
              return Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CBTTextNew(
                          " ${i + 1}. ",
                          style: TStyle.f18_B
                              .styleWith(fontFamily: AppFontsNeo.leagueBold),
                        ),
                        CBTTextNew(listQuestion[i].prQuestion!.toTitleCase,
                            style: TStyle.f12_B.styleWith(
                                fontFamily: AppFontsNeo.leagueBold,
                                color: CodebrightColor.cbtPrimarColor)),
                      ],
                    ),
                  ),
                  Checkbox(
                      value: listQuestion[i].isSelected,
                      onChanged: (v) => {
                            controller.isChanged.value = false,
                            controller.changeCheckedQuestionMain(
                                v!, i, type, listQuestion[i].prQuestion!)
                          })
                ],
              );
            }),
          ));
  }
}
