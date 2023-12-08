import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/controllers/page_index_controller.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/enter_details_model.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_data.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_generator.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/repo_test_genarotor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../cbt_model/img_pickholder.dart';

class OnlineTgController extends GetxController {
  final pageIndexController = Get.find<PageIndexController>();

  final RxList<String?> bannerList = <String>[].obs;

  RxString categoryID = "".obs;
  RxString classID = "".obs;
  RxString categoryName = "".obs;
  RxString className = "".obs;
  RxInt currentStep = 0.obs;
  RxInt noOfQ = 0.obs;
  RxInt marksOfQ = 0.obs;
  RxBool isChanged = true.obs;
  RxInt isSelected = 0.obs;

  // final RxString sharedValue = "  विद्यार्थी  ".obs;
  //
  final RxString sharedValue = "  Student  ".obs;
  final RxString onofValue = "  Ofline  ".obs;

  // final RxString onofValue = "  ऑफलाइन  ".obs;
  TextEditingController testMode = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController testType = TextEditingController();

  final Rx<TestGeneratorModel> testData =
      TestGeneratorModel(testDatails: TestDatails()).obs;
  final Rx<PaperGenerationModel> qustionPaperGeneration =
      PaperGenerationModel().obs;
  final Rx<TestGeneratorMainModel> mainTestGeneration =
      TestGeneratorMainModel().obs;
  final RxList<String?> statusListH = <String>[
    "परीक्षण विवरण दर्ज करें",
    // "Select Chapters",
    "अध्याय चुनें",
    "प्रश्न चुनें",
    // "Select Questions",
    // "Validate Marks",
    "मार्क्स मान्य करें",
    // "Preview & Finalise And Save",
    "पूर्वावलोकन करें और अंतिम रूप दें तथा सहेजें",
  ].obs;
  final RxList<String?> statusList = <String>[
    // "परीक्षण विवरण दर्ज करें",
    "Online TG",
    "Select Chapters",
    // "अध्याय चुनें",
    // "प्रश्न चुनें",
    "Select Questions",
    "Validate Marks",
    // "मार्क्स मान्य करें",
    "Preview & Finalise And Save",
    // "पूर्वावलोकन करें और अंतिम रूप दें तथा सहेजें",
  ].obs;

  // final RxList<String?> statusList = <String>[
  //    "Enter Test Details",
  //    "Select Chapters",
  //    "Select Questions",
  //    "Validate Marks",
  //    "Preview & Finalise And Save",
  //  ].obs;

  late BuildContext _context;

  final RxBool isLoading = true.obs;
  final RxInt isSelectedPosition = (-1).obs;

  @override
  void onReady() async {}

  Future<void> setUserDetails() async {
    categoryID.value = (await prefHandler.getCategoryId())!;
    categoryName.value = (await prefHandler.getCategoryName())!;
    className.value = (await prefHandler.getClassName())!;
    classID.value = (await prefHandler.getClassId())!;
  }

  @override
  void onInit() async {
    setUserDetails();

    // await addChapterList();
    // await addQuestionList();
    // await addMainListTest();
    super.onInit();
  }

  onUpdateValue(String value) {
    sharedValue.value = value;
  }

  onUpdateOnOfValue(String value) {
    onofValue.value = value;
  }

  onAttachment(ImgPickHolder imgPickHolder) {}

  bool goNext(int currentStep) {
    isChanged.value = true;
    if (currentStep == 0) {
      if (nameController.text.isEmpty) {
        errorMessage("Please Enter Test Name");
        return false;
      } else if (durationController.text.isEmpty) {
        errorMessage("Please Enter Duration");
        return false;
      }
      /*else if (testMode.text.isEmpty) {
        return false;
      } else if (testType.text.isEmpty) {
        return false;
      }*/
      else {
        isChanged.value = true;
        testData.value.testDatails
          ..testName = nameController.text
          ..testType = testType.text
          ..testMode = testMode.text
          ..testDuuration = durationController.text
          ..image = "";
        return true;
      }
    } else if (currentStep == 1) {
      int count = 0;

      mainTestGeneration.value.prChapters!.forEach((element) {
        if (element.isSelected) {
          count = count + 1;
        }
      });

      if (count > 0) {
        isChanged.value = false;
        return true;
      } else {
        errorMessage("Please Select Chapter And Click to Next");
      }
    } else if (currentStep == 2) {
      int count = 0;
      int value = 0;
      mainTestGeneration.value.prChapters!.forEach((element) {
        element.prQuestionType!.forEach((element) {
          if (element.noOFQuestion! > 0) {
            count = count + 1;

            if (element.marksPerQuestion! > 0) {
              value = value + 1;
            }
          }
        });
      });

      if (count > 0) {
        isChanged.value = false;

        if (value > 0) {
          return true;
        } else {
          errorMessage("Please Enter  Marks And Click to Next");
        }
      } else {
        errorMessage("Please Select Question And Click to Next");
      }
    } else if (currentStep == 3) {
      isChanged.value = false;
      return true;
    } else if (currentStep == 4) {
      isChanged.value = false;
      return true;
    }
    return false;
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

  Future<void> addChapterList() async {
    List<ChapterModel> list = await TestGeneratorRepo().readJson();
  }

  Future<void> addQuestionList() async {
    List<QuestionType> list = await TestGeneratorRepo().readQuestionJson();
  }

  Future<void> addQuestionPaperList() async {
    PaperGenerationModel questionPaper =
        await TestGeneratorRepo().readQuestionPaperJson();
    qustionPaperGeneration.value = questionPaper;
  }

  Future<void> addMainListTest(List<PrChapter> prTestGeneratorData) async {
    var bookId = await prefHandler.getMobile();
    // await TestGeneratorRepo().getCBData(
    //     data: {"PR_CATEGORY_ID": 1, "PR_BOOK_ID": bookId},
    //     urlStr: "http://deepuprakashan.com/school-api/test-generator-data",
    //     onSuccess: (data) {
    //       mainTestGeneration.value = data.resObject!;
    //     },
    //     onError: (error) {},
    //     beforeSend: () {});

    // TestGeneratorMainModel questionPaper =
    //     await TestGeneratorRepo().readJsonTestMain();
    mainTestGeneration.value.prChapters = prTestGeneratorData;
  }

  Future<void> changeChecked(bool? v, int i) async {
    isChanged.value = false;
    mainTestGeneration.value.prChapters![i].isSelected = v!;
    isChanged.value = true;
  }

  Future<void> noQuestion(String v, int i, PrQuestionType chapter) async {
    // noOfQ.value = 0;
    isChanged.value = false;
    // marksOfQ.value = 0;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.noOFQuestion = v.isNotEmpty ? int.tryParse(v) : 0;
            noOfQ.value = noOfQ.value + countElement.noOFQuestion!;
          }
        });
      }
    });
    isChanged.value = true;
    calculateMarks();
  }

  Future<void> markQuestion(String v, int i, PrQuestionType chapter) async {
    isChanged.value = false;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.marksPerQuestion = v.isNotEmpty ? int.tryParse(v) : 0;
            // noOfQ.value = noOfQ.value + countElement.noOFQuestion!;
            // marksOfQ.value = marksOfQ.value +
            //     countElement.marksPerQuestion! * countElement.noOFQuestion!;
          }
        });
      }
    });

    isChanged.value = true;
    calculateMarks();
  }

  int getTotalCountofQuestions(PrQuestionType chapter) {
    int count = 0;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            count = count + countElement.mainQuestion!.length;
          }
        });
      }
    });

    return count;
  }

  calculateMarks() {
    isChanged.value = false;
    noOfQ.value = 0;
    marksOfQ.value = 0;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          countElement.mainQuestion!.forEach((ee) {
            if (ee.isSelected) {
              noOfQ.value = noOfQ.value + 1;
              marksOfQ.value = marksOfQ.value + countElement.marksPerQuestion!;
            }
          });
        });
      }
    });
    // mainTestGeneration.value.prChapters!.forEach((element) {
    //   if (element.isSelected) {
    //     element.prQuestionType!.forEach((countElement) {
    //       if(countElement.isSelected){
    //         noOfQ.value = noOfQ.value + countElement.noOFQuestion!;
    //         marksOfQ.value = marksOfQ.value +
    //             countElement.marksPerQuestion! * countElement.noOFQuestion!;
    //       }
    //     });
    //   }
    // });

    isChanged.value = true;
  }

  List<MainQuestion> getQuestionList(PrQuestionType chapter) {
    List<MainQuestion> questionList = List.empty(growable: true);
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            questionList.addAll(countElement.mainQuestion!);
          }
        });
      }
    });

    return questionList;
  }

  Future<void> changeCheckedMain(bool v, int i, PrQuestionType chapter) async {
    isChanged.value = false;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.mainQuestion![i].isSelected = v;
            countElement.isSelected = true;
          }
        });
      }
    });
    isChanged.value = true;
    calculateMarks();
  }

  Future<void> changeCheckedQuestionMain(
      bool v, int i, PrQuestionType chapter, String question) async {
    isChanged.value = false;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.mainQuestion!.forEach((q) {
              if (q.prQuestion!.toLowerCase() == question.toLowerCase()) {
                q.isSelected = v;
                countElement.isSelected = true;
              }
            });
          }
        });
      }
      calculateMarks();
    });

    mainTestGeneration.value.prChapters!.first.prQuestionType!.forEach((type) {
      int count = 0;
      mainTestGeneration.value.prChapters!.forEach((element) {
        if (element.isSelected) {
          element.prQuestionType!.forEach((countElement) {
            if (countElement.prCode == type.prCode) {
              countElement.mainQuestion!.forEach((q) {
                if (q.isSelected) {
                  count = count + 1;
                }
              });
            }
          });
        }
      });
      if (count > 0) {
        type.noOFQuestion = count;
      }
    });

    isChanged.value = true;
    calculateMarks();
  }

  Future<void> changeCheckedQuestionMain1(
      bool v, int i, PrQuestionType chapter, String question) async {
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.mainQuestion!.forEach((q) {
              if (q.prQuestion!.toLowerCase() == question.toLowerCase()) {
                q.isSelected = v;
              }
            });
          }
        });
      }
    });

    int count = 0;
    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.mainQuestion!.forEach((q) {
              if (q.isSelected) {
                count = count + 1;
                countElement.noOFQuestion = count;
              }
            });
          }
        });
      }
    });

    mainTestGeneration.value.prChapters!.forEach((element) {
      if (element.isSelected) {
        element.prQuestionType!.forEach((countElement) {
          if (countElement.prCode == chapter.prCode) {
            countElement.noOFQuestion = count;
          }
        });
      }
    });

    isChanged.value = true;
    calculateMarks();
  }

  List<PaperQuestion> getPaperQuestion() {
    List<PaperQuestion> paperQuestion = List.empty(growable: true);
    // List<MainQuestion> questionList = List.empty(growable: true);

    mainTestGeneration.value.prChapters!.first.prQuestionType!.forEach((type) {
      List<MainQuestion> questionList = List.empty(growable: true);
      mainTestGeneration.value.prChapters!.forEach((element) {
        if (element.isSelected) {
          element.prQuestionType!.forEach((countElement) {
            if (countElement.prCode == type.prCode) {
              countElement.mainQuestion!.forEach((q) {
                if (q.isSelected) {
                  questionList.add(q);
                }
              });
            }
          });
        }
      });
      if (questionList.isNotEmpty) {
        paperQuestion.add(PaperQuestion(questionList, type));
        // questionList.clear();
      }
    });

    return paperQuestion;
  }

  String getSubSerial(int i) {
    if (i == 1) {
      return "i)";
    } else if (i == 2) {
      return "ii)";
    } else if (i == 3) {
      return "iii)";
    } else if (i == 4) {
      return "iv)";
    } else if (i == 5) {
      return "v)";
    } else if (i == 6) {
      return "vi)";
    } else if (i == 7) {
      return "vii)";
    } else if (i == 8) {
      return "viii)";
    } else if (i == 9) {
      return "ix)";
    } else if (i == 10) {
      return "x)";
    } else if (i == 11) {
      return "xi)";
    } else if (i == 12) {
      return "xii)";
    } else if (i == 13) {
      return "xiii)";
    } else if (i == 14) {
      return "xiv)";
    } else if (i == 15) {
      return "xv)";
    } else if (i == 16) {
      return "xvi)";
    } else if (i == 17) {
      return "xvii)";
    } else if (i == 18) {
      return "xviii)";
    } else if (i == 19) {
      return "xix)";
    } else if (i == 20) {
      return "xx)";
    } else if (i == 21) {
      return "xxi)";
    } else if (i == 22) {
      return "xxii)";
    } else if (i == 23) {
      return "xxiii)";
    } else if (i == 24) {
      return "xxiv)";
    } else if (i == 25) {
      return "xxv)";
    } else if (i == 26) {
      return "xxvi)";
    } else if (i == 27) {
      return "xxvii)";
    } else if (i == 28) {
      return "xxviii)";
    } else if (i == 29) {
      return "xxix)";
    } else if (i == 30) {
      return "xxx)";
    }
    return "";
  }
}
