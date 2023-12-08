class ChapterModel {
  int? prChapterId;
  PrBook? prBook;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  bool? isSelected;

  ChapterModel({
    this.prChapterId,
    this.prBook,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.isSelected = false,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        prChapterId: json["PR_CHAPTER_ID"],
        prBook:
            json["PR_BOOK"] == null ? null : PrBook.fromJson(json["PR_BOOK"]),
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_CHAPTER_ID": prChapterId,
        "PR_BOOK": prBook?.toJson(),
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class PrBook {
  int? prBookId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prCategory;
  int? prClass;
  int? prSubject;

  PrBook({
    this.prBookId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prCategory,
    this.prClass,
    this.prSubject,
  });

  factory PrBook.fromJson(Map<String, dynamic> json) => PrBook(
        prBookId: json["PR_BOOK_ID"],
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prCategory: json["PR_CATEGORY"],
        prClass: json["PR_CLASS"],
        prSubject: json["PR_SUBJECT"],
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_CATEGORY": prCategory,
        "PR_CLASS": prClass,
        "PR_SUBJECT": prSubject,
      };
}



class QuestionType {
  int? prQuestionTypeId;
  String? prName;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prTotalQuestions;
  int? noOFQuestion;
  int? marksPerQuestion;

  QuestionType({
    this.prQuestionTypeId,
    this.prName,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prTotalQuestions,
    this.noOFQuestion=0,
    this.marksPerQuestion=0,
  });

  factory QuestionType.fromJson(Map<String, dynamic> json) => QuestionType(
    prQuestionTypeId: json["PR_QUESTION_TYPE_ID"],
    prName: json["PR_NAME"],
    prIcon: json["PR_ICON"],
    prDescription: json["PR_DESCRIPTION"],
    prStatus: json["PR_STATUS"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
    prTotalQuestions: json["PR_TOTAL_QUESTIONS"],
  );

  Map<String, dynamic> toJson() => {
    "PR_QUESTION_TYPE_ID": prQuestionTypeId,
    "PR_NAME": prName,
    "PR_ICON": prIcon,
    "PR_DESCRIPTION": prDescription,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
    "PR_TOTAL_QUESTIONS": prTotalQuestions,
  };
}




class PaperGenerationModel {
  String? prSchoolName;
  String? prTestName;
  String? prTestDuration;
  String? prClassName;
  String? prSubjectName;
  String? prBookName;
  int? prTotalQuestions;
  int? prTotalMarks;
  List<PrQuestionTypeDatum>? prQuestionTypeData;

  PaperGenerationModel({
    this.prSchoolName,
    this.prTestName,
    this.prTestDuration,
    this.prClassName,
    this.prSubjectName,
    this.prBookName,
    this.prTotalQuestions,
    this.prTotalMarks,
    this.prQuestionTypeData,
  });

  factory PaperGenerationModel.fromJson(Map<String, dynamic> json) => PaperGenerationModel(
    prSchoolName: json["PR_SCHOOL_NAME"],
    prTestName: json["PR_TEST_NAME"],
    prTestDuration: json["PR_TEST_DURATION"],
    prClassName: json["PR_CLASS_NAME"],
    prSubjectName: json["PR_SUBJECT_NAME"],
    prBookName: json["PR_BOOK_NAME"],
    prTotalQuestions: json["PR_TOTAL_QUESTIONS"],
    prTotalMarks: json["PR_TOTAL_MARKS"],
    prQuestionTypeData: json["PR_QUESTION_TYPE_DATA"] == null ? [] : List<PrQuestionTypeDatum>.from(json["PR_QUESTION_TYPE_DATA"]!.map((x) => PrQuestionTypeDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PR_SCHOOL_NAME": prSchoolName,
    "PR_TEST_NAME": prTestName,
    "PR_TEST_DURATION": prTestDuration,
    "PR_CLASS_NAME": prClassName,
    "PR_SUBJECT_NAME": prSubjectName,
    "PR_BOOK_NAME": prBookName,
    "PR_TOTAL_QUESTIONS": prTotalQuestions,
    "PR_TOTAL_MARKS": prTotalMarks,
    "PR_QUESTION_TYPE_DATA": prQuestionTypeData == null ? [] : List<dynamic>.from(prQuestionTypeData!.map((x) => x.toJson())),
  };
}

class PrQuestionTypeDatum {
  String? prQuestionType;
  int? prTotalQues;
  int? prQuestionMarks;
  List<PrQuestion>? prQuestions;

  PrQuestionTypeDatum({
    this.prQuestionType,
    this.prTotalQues,
    this.prQuestionMarks,
    this.prQuestions,
  });

  factory PrQuestionTypeDatum.fromJson(Map<String, dynamic> json) => PrQuestionTypeDatum(
    prQuestionType: json["PR_QUESTION_TYPE"],
    prTotalQues: json["PR_TOTAL_QUES"],
    prQuestionMarks: json["PR_QUESTION_MARKS"],
    prQuestions: json["PR_QUESTIONS"] == null ? [] : List<PrQuestion>.from(json["PR_QUESTIONS"]!.map((x) => PrQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PR_QUESTION_TYPE": prQuestionType,
    "PR_TOTAL_QUES": prTotalQues,
    "PR_QUESTION_MARKS": prQuestionMarks,
    "PR_QUESTIONS": prQuestions == null ? [] : List<dynamic>.from(prQuestions!.map((x) => x.toJson())),
  };
}

class PrQuestion {
  String? prQuestion;
  String? prDescription;
  String? prFirstOption;
  String? prSecondOption;
  String? prThirdOption;
  String? prFourthOption;
  String? prFifthOption;
  String? prAnswer;

  PrQuestion({
    this.prQuestion,
    this.prDescription,
    this.prFirstOption,
    this.prSecondOption,
    this.prThirdOption,
    this.prFourthOption,
    this.prFifthOption,
    this.prAnswer,
  });

  factory PrQuestion.fromJson(Map<String, dynamic> json) => PrQuestion(
    prQuestion: json["PR_QUESTION"],
    prDescription: json["PR_DESCRIPTION"],
    prFirstOption: json["PR_FIRST_OPTION"],
    prSecondOption: json["PR_SECOND_OPTION"],
    prThirdOption: json["PR_THIRD_OPTION"],
    prFourthOption: json["PR_FOURTH_OPTION"],
    prFifthOption: json["PR_FIFTH_OPTION"],
    prAnswer: json["PR_ANSWER"],
  );

  Map<String, dynamic> toJson() => {
    "PR_QUESTION": prQuestion,
    "PR_DESCRIPTION": prDescription,
    "PR_FIRST_OPTION": prFirstOption,
    "PR_SECOND_OPTION": prSecondOption,
    "PR_THIRD_OPTION": prThirdOption,
    "PR_FOURTH_OPTION": prFourthOption,
    "PR_FIFTH_OPTION": prFifthOption,
    "PR_ANSWER": prAnswer,
  };
}



