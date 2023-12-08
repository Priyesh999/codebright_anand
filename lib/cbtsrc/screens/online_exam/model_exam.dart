
class ExamQuestionList {
  int? prTestPaperId;
  String? prName;
  PrBook? prBook;
  String? prTimeDuration;
  String? prPaperType;
  String? prTotalQuestions;
  String? prTotalMarks;
  String? prDescription;
  String? prInstruction;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  List<PrQuestion>? prQuestions;

  ExamQuestionList({
    this.prTestPaperId,
    this.prName,
    this.prBook,
    this.prTimeDuration,
    this.prPaperType,
    this.prTotalQuestions,
    this.prTotalMarks,
    this.prDescription,
    this.prInstruction,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prQuestions,
  });

  factory ExamQuestionList.fromJson(Map<String, dynamic> json) => ExamQuestionList(
    prTestPaperId: json["PR_TEST_PAPER_ID"],
    prName: json["PR_NAME"],
    prBook: json["PR_BOOK"] == null ? null : PrBook.fromJson(json["PR_BOOK"]),
    prTimeDuration: json["PR_TIME_DURATION"],
    prPaperType: json["PR_PAPER_TYPE"],
    prTotalQuestions: json["PR_TOTAL_QUESTIONS"],
    prTotalMarks: json["PR_TOTAL_MARKS"],
    prDescription: json["PR_DESCRIPTION"],
    prInstruction: json["PR_INSTRUCTION"],
    prStatus: json["PR_STATUS"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
    prQuestions: json["PR_QUESTIONS"] == null ? [] : List<PrQuestion>.from(json["PR_QUESTIONS"]!.map((x) => PrQuestion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "PR_TEST_PAPER_ID": prTestPaperId,
    "PR_NAME": prName,
    "PR_BOOK": prBook?.toJson(),
    "PR_TIME_DURATION": prTimeDuration,
    "PR_PAPER_TYPE": prPaperType,
    "PR_TOTAL_QUESTIONS": prTotalQuestions,
    "PR_TOTAL_MARKS": prTotalMarks,
    "PR_DESCRIPTION": prDescription,
    "PR_INSTRUCTION": prInstruction,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
    "PR_QUESTIONS": prQuestions == null ? [] : List<dynamic>.from(prQuestions!.map((x) => x.toJson())),
  };
}

class PrBook {
  int? prBookId;
  Pr? prClass;
  Pr? prSubject;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrBook({
    this.prBookId,
    this.prClass,
    this.prSubject,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrBook.fromJson(Map<String, dynamic> json) => PrBook(
    prBookId: json["PR_BOOK_ID"],
    prClass: json["PR_CLASS"] == null ? null : Pr.fromJson(json["PR_CLASS"]),
    prSubject: json["PR_SUBJECT"] == null ? null : Pr.fromJson(json["PR_SUBJECT"]),
    prName: json["PR_NAME"],
    prCode: json["PR_CODE"],
    prIcon: json["PR_ICON"],
    prDescription: json["PR_DESCRIPTION"],
    prStatus: json["PR_STATUS"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
  );

  Map<String, dynamic> toJson() => {
    "PR_BOOK_ID": prBookId,
    "PR_CLASS": prClass?.toJson(),
    "PR_SUBJECT": prSubject?.toJson(),
    "PR_NAME": prName,
    "PR_CODE": prCode,
    "PR_ICON": prIcon,
    "PR_DESCRIPTION": prDescription,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
  };
}

class Pr {
  int? prClassId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prSubjectId;

  Pr({
    this.prClassId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prSubjectId,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
    prClassId: json["PR_CLASS_ID"],
    prName: json["PR_NAME"],
    prCode: json["PR_CODE"],
    prIcon: json["PR_ICON"],
    prDescription: json["PR_DESCRIPTION"],
    prStatus: json["PR_STATUS"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
    prSubjectId: json["PR_SUBJECT_ID"],
  );

  Map<String, dynamic> toJson() => {
    "PR_CLASS_ID": prClassId,
    "PR_NAME": prName,
    "PR_CODE": prCode,
    "PR_ICON": prIcon,
    "PR_DESCRIPTION": prDescription,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
    "PR_SUBJECT_ID": prSubjectId,
  };
}

class PrQuestion {
  int? prQuestionId;
  PrDifficulty? prDifficulty;
  String? prQuestion;
  String? prImage;
  String? prFirstOption;
  String? prSecondOption;
  String? prThirdOption;
  String? prFourthOption;
  String? prAnswer;
  String? prMarks;
  String? prNegativeMarks;
  String? prDescription;
  int? prStatus;
  int? prOnlineTestPaper;

  PrQuestion({
    this.prQuestionId,
    this.prDifficulty,
    this.prQuestion,
    this.prImage,
    this.prFirstOption,
    this.prSecondOption,
    this.prThirdOption,
    this.prFourthOption,
    this.prAnswer,
    this.prMarks,
    this.prNegativeMarks,
    this.prDescription,
    this.prStatus,
    this.prOnlineTestPaper,
  });

  factory PrQuestion.fromJson(Map<String, dynamic> json) => PrQuestion(
    prQuestionId: json["PR_QUESTION_ID"],
    prDifficulty: prDifficultyValues.map[json["PR_DIFFICULTY"]]!,
    prQuestion: json["PR_QUESTION"],
    prImage: json["PR_IMAGE"],
    prFirstOption: json["PR_FIRST_OPTION"],
    prSecondOption: json["PR_SECOND_OPTION"],
    prThirdOption: json["PR_THIRD_OPTION"],
    prFourthOption: json["PR_FOURTH_OPTION"],
    prAnswer: json["PR_ANSWER"],
    prMarks: json["PR_MARKS"],
    prNegativeMarks: json["PR_NEGATIVE_MARKS"],
    prDescription: json["PR_DESCRIPTION"],
    prStatus: json["PR_STATUS"],
    prOnlineTestPaper: json["PR_ONLINE_TEST_PAPER"],
  );

  Map<String, dynamic> toJson() => {
    "PR_QUESTION_ID": prQuestionId,
    "PR_DIFFICULTY": prDifficultyValues.reverse[prDifficulty],
    "PR_QUESTION": prQuestion,
    "PR_IMAGE": prImage,
    "PR_FIRST_OPTION": prFirstOption,
    "PR_SECOND_OPTION": prSecondOption,
    "PR_THIRD_OPTION": prThirdOption,
    "PR_FOURTH_OPTION": prFourthOption,
    "PR_ANSWER": prAnswer,
    "PR_MARKS": prMarks,
    "PR_NEGATIVE_MARKS": prNegativeMarks,
    "PR_DESCRIPTION": prDescription,
    "PR_STATUS": prStatus,
    "PR_ONLINE_TEST_PAPER": prOnlineTestPaper,
  };
}

enum PrDifficulty {
  EASY
}

final prDifficultyValues = EnumValues({
  "Easy": PrDifficulty.EASY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

