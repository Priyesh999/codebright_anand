class ExamQuestionDetails {
  int? prTestPaperId;
  PrBook? prBook;
  String? prName;
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

  ExamQuestionDetails(
      {this.prTestPaperId,
      this.prBook,
      this.prName,
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

  factory ExamQuestionDetails.fromJson(Map<String, dynamic> json) =>
      ExamQuestionDetails(
        prTestPaperId: json["PR_TEST_PAPER_ID"],
        prBook:
            json["PR_BOOK"] == null ? null : PrBook.fromJson(json["PR_BOOK"]),
        prName: json["PR_NAME"],
        prTimeDuration: json["PR_TIME_DURATION"],
        prPaperType: json["PR_PAPER_TYPE"],
        prTotalQuestions: json["PR_TOTAL_QUESTIONS"],
        prTotalMarks: json["PR_TOTAL_MARKS"],
        prDescription: json["PR_DESCRIPTION"],
        prInstruction: json["PR_INSTRUCTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prQuestions: json["PR_QUESTIONS"] == null
            ? []
            : List<PrQuestion>.from(
                json["PR_QUESTIONS"]!.map((x) => PrQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_TEST_PAPER_ID": prTestPaperId,
        "PR_BOOK": prBook?.toJson(),
        "PR_NAME": prName,
        "PR_TIME_DURATION": prTimeDuration,
        "PR_PAPER_TYPE": prPaperType,
        "PR_TOTAL_QUESTIONS": prTotalQuestions,
        "PR_TOTAL_MARKS": prTotalMarks,
        "PR_DESCRIPTION": prDescription,
        "PR_INSTRUCTION": prInstruction,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_QUESTIONS": prQuestions == null
            ? []
            : List<dynamic>.from(prQuestions!.map((x) => x.toJson())),
      };
}

class PrBook {
  int? prBookId;
  Pr? prClass;
  Pr? prSubject;
  int? prTotalTest;
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
    this.prTotalTest,
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
        prClass:
            json["PR_CLASS"] == null ? null : Pr.fromJson(json["PR_CLASS"]),
        prSubject:
            json["PR_SUBJECT"] == null ? null : Pr.fromJson(json["PR_SUBJECT"]),
        prTotalTest: json["PR_TOTAL_TEST"],
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
        "PR_BOOK_ID": prBookId,
        "PR_CLASS": prClass?.toJson(),
        "PR_SUBJECT": prSubject?.toJson(),
        "PR_TOTAL_TEST": prTotalTest,
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
  List<PrSubject>? prSubjects;
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
    this.prSubjects,
    this.prSubjectId,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        prClassId: json["PR_CLASS_ID"],
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
        prSubjects: json["PR_SUBJECTS"] == null
            ? []
            : List<PrSubject>.from(
                json["PR_SUBJECTS"]!.map((x) => PrSubject.fromJson(x))),
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
        "PR_SUBJECTS": prSubjects == null
            ? []
            : List<dynamic>.from(prSubjects!.map((x) => x.toJson())),
        "PR_SUBJECT_ID": prSubjectId,
      };
}

class PrSubject {
  int? prId;
  int? prClass;
  int? prSubject;

  PrSubject({
    this.prId,
    this.prClass,
    this.prSubject,
  });

  factory PrSubject.fromJson(Map<String, dynamic> json) => PrSubject(
        prId: json["PR_ID"],
        prClass: json["PR_CLASS"],
        prSubject: json["PR_SUBJECT"],
      );

  Map<String, dynamic> toJson() => {
        "PR_ID": prId,
        "PR_CLASS": prClass,
        "PR_SUBJECT": prSubject,
      };
}

class PrQuestion {
  int? prQuestionId;
  String? prQuestion;
  String? prImage;
  String? prFirstOption;
  String? prSecondOption;
  String? prThirdOption;
  String? prFourthOption;
  String? prDifficulty;
  String? prMarks;
  String? prNegativeMarks;
  String? prDescription;
  String? chooseAnswer;
  bool isAttempt;

  PrQuestion({
    this.prQuestionId,
    this.prQuestion,
    this.prImage,
    this.prFirstOption,
    this.prSecondOption,
    this.prThirdOption,
    this.prFourthOption,
    this.prDifficulty,
    this.prMarks,
    this.prNegativeMarks,
    this.prDescription,
    this.isAttempt = false,
    this.chooseAnswer = ""
  });

  factory PrQuestion.fromJson(Map<String, dynamic> json) => PrQuestion(
        prQuestionId: json["PR_QUESTION_ID"],
        prQuestion: json["PR_QUESTION"],
        prImage: json["PR_IMAGE"],
        prFirstOption: json["PR_FIRST_OPTION"],
        prSecondOption: json["PR_SECOND_OPTION"],
        prThirdOption: json["PR_THIRD_OPTION"],
        prFourthOption: json["PR_FOURTH_OPTION"],
        prDifficulty: json["PR_DIFFICULTY"],
        prMarks: json["PR_MARKS"],
        prNegativeMarks: json["PR_NEGATIVE_MARKS"],
        prDescription: json["PR_DESCRIPTION"],
      );

  Map<String, dynamic> toJson() => {
        "PR_QUESTION_ID": prQuestionId,
        "PR_QUESTION": prQuestion,
        "PR_IMAGE": prImage,
        "PR_FIRST_OPTION": prFirstOption,
        "PR_SECOND_OPTION": prSecondOption,
        "PR_THIRD_OPTION": prThirdOption,
        "PR_FOURTH_OPTION": prFourthOption,
        "PR_DIFFICULTY": prDifficulty,
        "PR_MARKS": prMarks,
        "PR_NEGATIVE_MARKS": prNegativeMarks,
        "PR_DESCRIPTION": prDescription,
      };
}
