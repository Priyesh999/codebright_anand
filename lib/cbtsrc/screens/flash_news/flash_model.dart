class FlashNewsModel {
  int? prFlashNewsId;
  String? prTitle;
  String? prDescription;
  String? prUrl;
  String? prType;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  bool selected;

  FlashNewsModel({
    this.prFlashNewsId,
    this.prTitle,
    this.prDescription,
    this.prUrl,
    this.prType,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.selected = false,
  });

  factory FlashNewsModel.fromJson(Map<String, dynamic> json) => FlashNewsModel(
        prFlashNewsId: json["PR_FLASH_NEWS_ID"],
        prTitle: json["PR_TITLE"],
        prDescription: json["PR_DESCRIPTION"],
        prUrl: json["PR_URL"],
        prType: json["PR_TYPE"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_FLASH_NEWS_ID": prFlashNewsId,
        "PR_TITLE": prTitle,
        "PR_DESCRIPTION": prDescription,
        "PR_URL": prUrl,
        "PR_TYPE": prType,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt!.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt!.toIso8601String(),
      };
}
