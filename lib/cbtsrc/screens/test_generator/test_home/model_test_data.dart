class TestGeneratorMainModel {
  int? prBookId;
  String? prCategory;
  String? prClass;
  String? prSubject;
  String? prName;
  String? prCode;
  String? prIcon;
  dynamic prDescription;
  List<PrChapter>? prChapters;
  TestGeneratorMainModel({
    this.prBookId,
    this.prCategory,
    this.prClass,
    this.prSubject,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prChapters,
  });

  factory TestGeneratorMainModel.fromJson(Map<String, dynamic> json) =>
      TestGeneratorMainModel(
        prBookId: json["PR_BOOK_ID"],
        prCategory: json["PR_CATEGORY"],
        prClass: json["PR_CLASS"],
        prSubject: json["PR_SUBJECT"],
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"]!,
        prDescription: json["PR_DESCRIPTION"],
        prChapters: json["PR_CHAPTERS"] == null
            ? []
            : List<PrChapter>.from(
                json["PR_CHAPTERS"]!.map((x) => PrChapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_CATEGORY": prCategory,
        "PR_CLASS": prClass,
        "PR_SUBJECT": prSubject,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_CHAPTERS": prChapters == null
            ? []
            : List<PrChapter>.from(prChapters!.map((x) => x.toJson())),
      };
}

class PrChapter {
  int? prChapterId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  bool isSelected;
  List<PrQuestionType>? prQuestionType;

  PrChapter({
    this.prChapterId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prQuestionType,
    this.isSelected = false,
  });

  factory PrChapter.fromJson(Map<String, dynamic> json) => PrChapter(
        prChapterId: json["PR_CHAPTER_ID"],
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"]!,
        prDescription: json["PR_DESCRIPTION"],
        prQuestionType: json["PR_QUESTION_TYPE"] == null
            ? []
            : List<PrQuestionType>.from(json["PR_QUESTION_TYPE"]!
                .map((x) => PrQuestionType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_CHAPTER_ID": prChapterId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_QUESTION_TYPE": prQuestionType == null
            ? []
            : List<dynamic>.from(prQuestionType!.map((x) => x.toJson())),
      };
}

class PrQuestionType {
  int? prQuestionTypeId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  bool isSelected;
  int? noOFQuestion;
  int? marksPerQuestion;
  List<MainQuestion>? mainQuestion;

  PrQuestionType({
    this.prQuestionTypeId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.mainQuestion,
    this.isSelected = false,
    this.noOFQuestion = 0,
    this.marksPerQuestion = 0,
  });

  factory PrQuestionType.fromJson(Map<String, dynamic> json) => PrQuestionType(
        prQuestionTypeId: json["PR_QUESTION_TYPE_ID"],
        prName: json["PR_NAME"]!,
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"]!,
        prDescription: json["PR_DESCRIPTION"],
        mainQuestion: json["PR_QUESTIONS"] == null
            ? []
            : List<MainQuestion>.from(
                json["PR_QUESTIONS"]!.map((x) => MainQuestion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_QUESTION_TYPE_ID": prQuestionTypeId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_QUESTIONS": mainQuestion == null
            ? []
            : List<dynamic>.from(mainQuestion!.map((x) => x.toJson())),
      };
}

class MainQuestion {
  String? prQuestion;
  String? prDescription;
  String? prFirstOption;
  String? prSecondOption;
  String? prThirdOption;
  String? prFourthOption;
  String? prFifthOption;
  String? prAnswer;
  bool isSelected;

  MainQuestion({
    this.prQuestion,
    this.prDescription,
    this.prFirstOption,
    this.prSecondOption,
    this.prThirdOption,
    this.prFourthOption,
    this.prFifthOption,
    this.prAnswer,
    this.isSelected = false,
  });

  factory MainQuestion.fromJson(Map<String, dynamic> json) => MainQuestion(
        prQuestion: json["PR_QUESTION"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prFirstOption: json["PR_FIRST_OPTION"] ?? "",
        prSecondOption: json["PR_SECOND_OPTION"] ?? "",
        prThirdOption: json["PR_THIRD_OPTION"] ?? "",
        prFourthOption: json["PR_FOURTH_OPTION"] ?? "",
        prFifthOption: json["PR_FIFTH_OPTION"] ?? "",
        prAnswer: json["PR_ANSWER"] ?? "",
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

class PaperQuestion {
  List<MainQuestion> mainQuestion;
  PrQuestionType type;

  PaperQuestion(this.mainQuestion, this.type);
}
