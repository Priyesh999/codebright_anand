// import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/app_theme.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/cbt_Image_picker.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_input_fields.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/dxwidget/codebright_text.dart';
// import 'package:digigyan/cbtsrc/cbt_helpers/utils_barrel.dart';
// import 'package:digigyan/cbtsrc/constants/api_urls.dart';
// import 'package:digigyan/cbtsrc/screens/test_generator/data.dart';
// import 'package:digigyan/cbtsrc/screens/test_generator/examples/document.dart';
// import 'package:digigyan/cbtsrc/screens/test_generator/examples/invoice.dart';
// import 'package:digigyan/cbtsrc/screens/test_generator/examples/test_paper.dart';
// import 'package:digigyan/cbtsrc/screens/test_generator/test_home/controller_test_home.dart';
// import 'package:digigyan/cbtsrc/screens/test_generator/test_home/examples.dart';
// import 'package:digigyan/cbtsrc/screens/widgets/default_app_baar.dart';
// import 'package:digigyan/cbtsrc/screens/widgets/styles/fonts.dart';
// import 'package:digigyan/cbtsrc/screens/widgets/styles/text_style.dart';
// import 'package:digigyan/cbtsrc/utils/appImages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:cupertino_stepper/cupertino_stepper.dart';
// import 'package:printing/printing.dart';
//
// import '../../../cbt_helpers/cbt_loader.dart';
//
// class TestPage extends GetView<TestController> {
//   String title;
//
//   TestPage({this.title = "Test Generator"});
//
//   late Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: CbtAppBar(
//         title: 'Test Generator',
//       ),
//       floatingActionButton: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           TextButton(
//               child: Card(
//                 color: materialPrimaryColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CBTTextNew(
//                     "Previous",
//                     style: TStyle.f16_B.styleWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//               onPressed: () => {
//                     controller.currentStep.value > 0
//                         ? --controller.currentStep.value
//                         : null
//                   }),
//           TextButton(
//               child: Card(
//                 color: materialPrimaryColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CBTTextNew(
//                     "  Next  ",
//                     style: TStyle.f16_B.styleWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//               onPressed: () => {
//                     if (controller.goNext(controller.currentStep.value))
//                       {
//                         controller.currentStep.value <
//                                 controller.statusList.length - 1
//                             ? ++controller.currentStep.value
//                             : null
//                       }
//                   }),
//         ],
//       ),
//       body: CupertinoPageScaffold(
//         child: SafeArea(
//           child: OrientationBuilder(
//             builder: (BuildContext context, Orientation orientation) {
//               switch (orientation) {
//                 case Orientation.portrait:
//                   return _buildStepper(StepperType.vertical, context);
//                 case Orientation.landscape:
//                   return _buildStepper(StepperType.horizontal, context);
//                 default:
//                   throw UnimplementedError(orientation.toString());
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
//
//   CupertinoStepper _buildStepper(StepperType type, BuildContext context) {
//     // final canCancel = currentStep > 0;
//     // final canContinue = currentStep < controller.statusList.length;
//     return CupertinoStepper(
//       type: type,
//       currentStep: controller.currentStep.value,
//       onStepTapped: (step) => controller.currentStep.value = step,
//       // onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
//       // onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
//       steps: [
//         for (var i = 0; i < controller.statusList.length; ++i)
//           _buildStep(
//             title: CBTTextNew('${controller.statusList.value[i]}'),
//             isActive: i == controller.currentStep.value,
//             state: i == controller.currentStep.value
//                 ? StepState.editing
//                 : i < controller.currentStep.value
//                     ? StepState.complete
//                     : StepState.indexed,
//             context: context,
//           ),
//         // _buildStep(
//         //   title: Text('Error'),
//         //   state: StepState.error,
//         // ),
//         // _buildStep(
//         //   title: Text('Disabled'),
//         //   state: StepState.disabled,
//         // )
//       ],
//     );
//   }
//
//   Step _buildStep(
//       {required Widget title,
//       StepState state = StepState.indexed,
//       bool isActive = false,
//       required BuildContext context}) {
//     return Step(
//       title: title,
//       subtitle: Text(''),
//       state: state,
//       isActive: isActive,
//       content: LimitedBox(
//         maxWidth: MediaQuery.of(context).size.width,
//         maxHeight: MediaQuery.of(context).size.height,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 50),
//           child: Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(bottom: 120),
//                 color: Colors.lightGreenAccent,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20.0),
//                       child: Container(
//                         height: 150,
//                         alignment: Alignment.center,
//                         child: Image.asset(AppImages.digigyanLogo),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Obx(
//                   () => controller
//                           .mainTestGeneration.value.prChapters!.isNotEmpty
//                       ? Card(
//                           margin:
//                               EdgeInsets.only(bottom: 120, left: 8, right: 20),
//                           elevation: 10,
//                           color: Colors.grey.shade200,
//                           child: controller.currentStep.value == 0
//                               ? enterDetails()
//                               : controller.currentStep.value == 1
//                                   ? Obx(() => controller.isChanged.value
//                                       ? selectChapter()
//                                       : selectChapter())
//                                   : controller.currentStep.value == 2 ||
//                                           controller.currentStep.value == 3
//                                       ? Obx(() => controller.isChanged.value
//                                           ? selectQuestion()
//                                           : selectQuestion())
//                                       : controller.currentStep.value == 4
//                                           ? generateDocument1()
//                                           : SizedBox(),
//                         )
//                       : Expanded(
//                           flex: 1,
//                           child: CBTLoaderProgress(
//                             isImage: false,
//                             isGif: true,
//                           ),
//                         ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   selectChapter() {
//     return Obx(() => controller.isChanged.value
//         ? Container(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 20.0, top: 20),
//                           child: CBTTextNew(
//                             "Select The Chapter To Include In The Test.",
//                             style: TStyle.f18_B
//                                 .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                           ),
//                         ),
//                         Expanded(
//                           child: Obx(
//                             () => controller.mainTestGeneration.value
//                                     .prChapters!.isNotEmpty
//                                 ? Container(
//                                     color: Colors.white,
//                                     margin: EdgeInsets.only(bottom: 8),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: ListView.builder(
//                                         itemCount: controller.mainTestGeneration
//                                             .value.prChapters!.length,
//                                         itemBuilder: (context, i) {
//                                           final chapter = controller
//                                               .mainTestGeneration
//                                               .value
//                                               .prChapters![i];
//                                           return Container(
//                                             color: Colors.grey.shade50,
//                                             margin: EdgeInsets.all(3),
//                                             child: Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Row(
//                                                     children: [
//                                                       CBTTextNew(
//                                                         " ${i + 1}. ",
//                                                         style: TStyle.f18_B
//                                                             .styleWith(
//                                                                 fontFamily:
//                                                                     AppFontsNeo
//                                                                         .leagueBold),
//                                                       ),
//                                                       CBTTextNew(
//                                                           chapter!.prName!
//                                                               .toTitleCase,
//                                                           style: TStyle
//                                                               .f12_B
//                                                               .styleWith(
//                                                                   fontFamily:
//                                                                       AppFontsNeo
//                                                                           .leagueBold,
//                                                                   color:
//                                                                       materialPrimaryColor)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Checkbox(
//                                                     value: chapter.isSelected,
//                                                     onChanged: (v) => {
//                                                           controller.isChanged
//                                                               .value = false,
//                                                           controller
//                                                               .changeChecked(
//                                                                   v, i)
//                                                         })
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     flex: 1,
//                                     child: CBTLoaderProgress(
//                                       isImage: false,
//                                       isGif: true,
//                                     ),
//                                   ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 20.0, top: 20),
//                           child: CBTTextNew(
//                             "Select The Chapter To Include In The Test.",
//                             style: TStyle.f18_B
//                                 .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                           ),
//                         ),
//                         Expanded(
//                           child: Obx(
//                             () => controller.mainTestGeneration.value
//                                     .prChapters!.isNotEmpty
//                                 ? Container(
//                                     color: Colors.white,
//                                     margin: EdgeInsets.only(bottom: 8),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: ListView.builder(
//                                         itemCount: controller.mainTestGeneration
//                                             .value.prChapters!.length,
//                                         itemBuilder: (context, i) {
//                                           final chapter = controller
//                                               .mainTestGeneration
//                                               .value
//                                               .prChapters![i];
//                                           return Container(
//                                             color: Colors.grey.shade50,
//                                             margin: EdgeInsets.all(3),
//                                             child: Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Row(
//                                                     children: [
//                                                       CBTTextNew(
//                                                         " ${i + 1}. ",
//                                                         style: TStyle.f18_B
//                                                             .styleWith(
//                                                                 fontFamily:
//                                                                     AppFontsNeo
//                                                                         .leagueBold),
//                                                       ),
//                                                       CBTTextNew(
//                                                           chapter!.prName!
//                                                               .toTitleCase,
//                                                           style: TStyle
//                                                               .f12_B
//                                                               .styleWith(
//                                                                   fontFamily:
//                                                                       AppFontsNeo
//                                                                           .leagueBold,
//                                                                   color:
//                                                                       materialPrimaryColor)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Checkbox(
//                                                     value: chapter.isSelected,
//                                                     onChanged: (v) => {
//                                                           controller
//                                                               .changeChecked(
//                                                                   v, i)
//                                                         })
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     flex: 1,
//                                     child: CBTLoaderProgress(
//                                       isImage: false,
//                                       isGif: true,
//                                     ),
//                                   ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ));
//   }
//
//   selectQuestion() {
//     return Obx(() => controller.isChanged.value
//         ? Container(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 20.0, top: 20),
//                           child: CBTTextNew(
//                             "Enter The Number Of Question To Be Included In Each Category. Change The Marks Per Question,if Required",
//                             style: TStyle.f18_B
//                                 .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                           ),
//                         ),
//                         Expanded(
//                           child: Obx(
//                             () => controller
//                                     .mainTestGeneration
//                                     .value
//                                     .prChapters!
//                                     .first
//                                     .prQuestionType!
//                                     .isNotEmpty
//                                 ? Container(
//                                     color: Colors.white,
//                                     margin: EdgeInsets.only(bottom: 8),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               Expanded(
//                                                 child: Row(
//                                                   children: [
//                                                     CBTTextNew(
//                                                       " ",
//                                                       style: TStyle.f18_B
//                                                           .styleWith(
//                                                               fontFamily:
//                                                                   AppFontsNeo
//                                                                       .leagueBold),
//                                                     ),
//                                                     CBTTextNew("",
//                                                         style: TStyle.f7_B.styleWith(
//                                                             fontFamily:
//                                                                 AppFontsNeo
//                                                                     .leagueBold,
//                                                             color:
//                                                                 materialPrimaryColor)),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(2.0),
//                                                 child: SizedBox(
//                                                   width: 50,
//                                                   child: CBTTextNew(
//                                                     maxLine: 5,
//                                                     "No \nOf \nQuestion",
//                                                     style: TStyle.f7_B.styleWith(
//                                                         fontFamily: AppFontsNeo
//                                                             .leagueSemiBold),
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(2.0),
//                                                 child: SizedBox(
//                                                   width: 50,
//                                                   child: CBTTextNew(
//                                                     "Marks \nPer\n Question",
//                                                     maxLine: 5,
//                                                     style: TStyle.f7_B.styleWith(
//                                                         fontFamily: AppFontsNeo
//                                                             .leagueSemiBold),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Expanded(
//                                             child: ListView.builder(
//                                               itemCount: controller.mainTestGeneration.value.prChapters!.first.prQuestionType!.length,
//                                               itemBuilder: (context, i) {
//                                                 final chapter =controller.mainTestGeneration.value.prChapters!.first.prQuestionType[i];
//                                                 return Container(
//                                                   color: Colors.grey.shade50,
//                                                   margin: EdgeInsets.all(3),
//                                                   child: Row(
//                                                     children: [
//                                                       Expanded(
//                                                         child: Row(
//                                                           children: [
//                                                             CBTTextNew(
//                                                               " ${i + 1}. ",
//                                                               style: TStyle
//                                                                   .f18_B
//                                                                   .styleWith(
//                                                                       fontFamily:
//                                                                           AppFontsNeo
//                                                                               .leagueBold),
//                                                             ),
//                                                             CBTTextNew(
//                                                                 chapter.prName!
//                                                                         .toTitleCase +
//                                                                     "( ${chapter.prTotalQuestions} )",
//                                                                 style: TStyle.f12_B.styleWith(
//                                                                     fontFamily:
//                                                                         AppFontsNeo
//                                                                             .leagueBold,
//                                                                     color:
//                                                                         materialPrimaryColor)),
//                                                           ],
//                                                         ),
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(2.0),
//                                                         child: SizedBox(
//                                                           height: 30,
//                                                           width: 50,
//                                                           child: CBTInputText(
//                                                             hintText: "",
//                                                             valueText:
//                                                                 "${chapter.noOFQuestion}",
//                                                             // controller: controller.nameController,
//                                                             borderRadius: 5,
//                                                             keyboardType:
//                                                                 TextInputType
//                                                                     .number,
//                                                             autofocus: false,
//                                                             onChanged: (v) {
//                                                               // controller
//                                                               //         .isChanged
//                                                               //         .value =
//                                                               //     false;
//                                                               // controller
//                                                               //     .noQuestion(
//                                                               //         v, i,chapter);
//                                                             },
//                                                             inputFormatters: [
//                                                               LengthLimitingTextInputFormatter(
//                                                                   3)
//                                                             ],
//                                                             // prefixIcon: const Icon(
//                                                             //   Icons.verified_user,
//                                                             //   color: materialPrimaryColor,
//                                                             // ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       SizedBox(
//                                                         width: 10,
//                                                       ),
//                                                       Padding(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .all(2.0),
//                                                         child: SizedBox(
//                                                           width: 50,
//                                                           height: 30,
//                                                           child: CBTInputText(
//                                                             hintText: "",
//                                                             valueText:
//                                                                 "${chapter.marksPerQuestion}",
//                                                             // controller: controller.nameController,
//                                                             borderRadius: 5,
//                                                             keyboardType:
//                                                                 TextInputType
//                                                                     .number,
//                                                             onChanged: (v) {
//                                                               // controller
//                                                               //         .isChanged
//                                                               //         .value =
//                                                               //     false;
//                                                               // controller
//                                                               //     .markQuestion(
//                                                               //         v, i);
//                                                             },
//                                                             autofocus: false,
//                                                             inputFormatters: [
//                                                               LengthLimitingTextInputFormatter(
//                                                                   3)
//                                                             ],
//                                                             // prefixIcon: const Icon(
//                                                             //   Icons.verified_user,
//                                                             //   color: materialPrimaryColor,
//                                                             // ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     flex: 1,
//                                     child: CBTLoaderProgress(
//                                       isImage: false,
//                                       isGif: true,
//                                     ),
//                                   ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 20.0, top: 20),
//                           child: CBTTextNew(
//                             "Select The Chapter To Include In The Test.",
//                             style: TStyle.f18_B
//                                 .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                           ),
//                         ),
//                         Expanded(
//                           child: Obx(
//                             () => controller.chapterList.isNotEmpty
//                                 ? Container(
//                                     color: Colors.white,
//                                     margin: EdgeInsets.only(bottom: 8),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: ListView.builder(
//                                         itemCount:
//                                             controller.chapterList.value.length,
//                                         itemBuilder: (context, i) {
//                                           final chapter =
//                                               controller.chapterList.value[i];
//                                           return Container(
//                                             color: Colors.grey.shade50,
//                                             margin: EdgeInsets.all(3),
//                                             child: Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Row(
//                                                     children: [
//                                                       CBTTextNew(
//                                                         " ${i + 1}. ",
//                                                         style: TStyle.f18_B
//                                                             .styleWith(
//                                                                 fontFamily:
//                                                                     AppFontsNeo
//                                                                         .leagueBold),
//                                                       ),
//                                                       CBTTextNew(
//                                                           chapter!.prName!
//                                                               .toTitleCase,
//                                                           style: TStyle
//                                                               .f12_B
//                                                               .styleWith(
//                                                                   fontFamily:
//                                                                       AppFontsNeo
//                                                                           .leagueBold,
//                                                                   color:
//                                                                       materialPrimaryColor)),
//                                                     ],
//                                                   ),
//                                                 ),
//                                                 Checkbox(
//                                                     value: chapter.isSelected,
//                                                     onChanged: (v) => {
//                                                           controller
//                                                               .changeChecked(
//                                                                   v, i)
//                                                         })
//                                               ],
//                                             ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     flex: 1,
//                                     child: CBTLoaderProgress(
//                                       isImage: false,
//                                       isGif: true,
//                                     ),
//                                   ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ));
//   }
//
//   enterDetails() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           flex: 2,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 50.0, top: 20),
//                   child: CBTTextNew(
//                     "Enter Required Details And Click The Next Button.",
//                     style: TStyle.f18_B
//                         .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                   ),
//                 ),
//                 Container(
//                   child: CBTInputText(
//                     hintText: "Test Name",
//                     valueText: controller.nameController.text,
//                     controller: controller.nameController,
//                     borderRadius: 5,
//                     keyboardType: TextInputType.text,
//                     autofocus: false,
//                     inputFormatters: [LengthLimitingTextInputFormatter(200)],
//                     prefixIcon: const Icon(
//                       Icons.verified_user,
//                       color: materialPrimaryColor,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.01,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         children: [
//                           Container(
//                             child: CBTInputText(
//                               hintText: "Create Mode",
//                               valueText: controller.testMode.text,
//                               controller: controller.testMode,
//                               borderRadius: 5,
//                               keyboardType: TextInputType.number,
//                               autofocus: false,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(100)
//                               ],
//                               prefixIcon: const Icon(
//                                 Icons.person,
//                                 color: materialPrimaryColor,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.01,
//                           ),
//                           Container(
//                             child: CBTInputText(
//                               hintText: "Test Type",
//                               valueText: controller.testType.text,
//                               controller: controller.testType,
//                               borderRadius: 5,
//                               keyboardType: TextInputType.number,
//                               autofocus: false,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(100)
//                               ],
//                               prefixIcon: const Icon(
//                                 Icons.person,
//                                 color: materialPrimaryColor,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.01,
//                           ),
//                           Container(
//                             child: CBTInputText(
//                               hintText: "Test Duration (In Minute)",
//                               valueText: controller.durationController.text,
//                               controller: controller.durationController,
//                               borderRadius: 5,
//                               keyboardType: TextInputType.text,
//                               autofocus: false,
//                               inputFormatters: [
//                                 LengthLimitingTextInputFormatter(8)
//                               ],
//                               prefixIcon: const Icon(
//                                 Icons.person,
//                                 color: materialPrimaryColor,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: size.height * 0.01,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           CBTTextNew(
//                             "Add Logo",
//                             style: TStyle.f16_B
//                                 .styleWith(fontFamily: AppFontsNeo.leagueBold),
//                           ),
//                           CBOImagePicker(
//                               // alreadyUploadedUrl: img.isNotEmpty
//                               //     ? img.startsWith("http")
//                               //     ? img
//                               //     : ApiUrls.baseUrlImage(img)
//                               //     : "",
//
//                               height: 140,
//                               title: "Add Logo",
//                               width: 350,
//                               uploadUrl: ApiUrls.fileUpload,
//                               imgPathCallBack: (imgPickHolder) =>
//                                   controller.onAttachment(imgPickHolder),
//                               isServerUpload: true,
//                               isLineNot: false,
//                               isEditable: true,
//                               isGallery: true),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//           ),
//         )
//       ],
//     );
//   }
//
//   generateDocument1() {
//     return Container(
//         child: PdfPreview(
//       maxPageWidth: 700,
//       build: (format) =>
//           TestPaperPdf('DOCUMENT', 'document.dart', generateTestPaper).builder(
//               format, controller.qustionPaperGeneration.value!, controller),
//       // build: (format) =>
//       // Example('DOCUMENT', 'document.dart', generateInvoice)
//       //     .builder(format, CustomData()),
//       // actions: actions,
//       // onPrinted: _showPrintedToast,
//       // onShared: _showSharedToast,
//     ));
//   }
// }
