
class ActivityModel {
  int? prQueId;
  String? prQueHeading;
  String? prQueName;
  String? prQueImage;
  String? prFirstOption;
  String? prSecondOption;
  String? prThirdOption;
  String? prForthOption;
  String? prAnswer;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prCategory;
  int? prBook;
  int? prChapter;
  int? prQueType;

  ActivityModel({
    this.prQueId,
    this.prQueHeading,
    this.prQueName,
    this.prQueImage,
    this.prFirstOption,
    this.prSecondOption,
    this.prThirdOption,
    this.prForthOption,
    this.prAnswer,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prCategory,
    this.prBook,
    this.prChapter,
    this.prQueType,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
    prQueId: json["PR_QUE_ID"],
    prQueHeading: json["PR_QUE_HEADING"],
    prQueName: json["PR_QUE_NAME"],
    prQueImage: json["PR_QUE_IMAGE"],
    prFirstOption: json["PR_FIRST_OPTION"],
    prSecondOption: json["PR_SECOND_OPTION"],
    prThirdOption: json["PR_THIRD_OPTION"],
    prForthOption: json["PR_FORTH_OPTION"],
    prAnswer: json["PR_ANSWER"],
    prStatus: json["PR_STATUS"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
    prCategory: json["PR_CATEGORY"],
    prBook: json["PR_BOOK"],
    prChapter: json["PR_CHAPTER"],
    prQueType: json["PR_QUE_TYPE"],
  );

  Map<String, dynamic> toJson() => {
    "PR_QUE_ID": prQueId,
    "PR_QUE_HEADING": prQueHeading,
    "PR_QUE_NAME": prQueName,
    "PR_QUE_IMAGE": prQueImage,
    "PR_FIRST_OPTION": prFirstOption,
    "PR_SECOND_OPTION": prSecondOption,
    "PR_THIRD_OPTION": prThirdOption,
    "PR_FORTH_OPTION": prForthOption,
    "PR_ANSWER": prAnswer,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
    "PR_CATEGORY": prCategory,
    "PR_BOOK": prBook,
    "PR_CHAPTER": prChapter,
    "PR_QUE_TYPE": prQueType,
  };
}
