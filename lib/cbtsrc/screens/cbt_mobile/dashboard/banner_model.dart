class BannerModel {
  int? prBannerId;
  String? prTitle;
  String? prCode;
  String? prUrl;
  String? prDescription;
  String? prBackgroundColor;
  String? prPossion;
  String? prBannerType;
  int? prStatus;
  dynamic prCreatedAt;
  dynamic prModifiedAt;

  BannerModel({
    this.prBannerId,
    this.prTitle,
    this.prCode,
    this.prUrl,
    this.prDescription,
    this.prBackgroundColor,
    this.prPossion,
    this.prBannerType,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        prBannerId: json["PR_BANNER_ID"],
        prTitle: json["PR_TITLE"],
        prCode: json["PR_CODE"],
        prUrl: json["PR_BANNER_FILE"],
        prDescription: json["PR_DESCRIPTION"],
        prBackgroundColor: json["PR_BACKGROUND_COLOR"],
        prPossion: json["PR_POSSION"],
        prBannerType: json["PR_BANNER_TYPE"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_BANNER_ID": prBannerId,
        "PR_TITLE": prTitle,
        "PR_CODE": prCode,
        "PR_URL": prUrl,
        "PR_DESCRIPTION": prDescription,
        "PR_BACKGROUND_COLOR": prBackgroundColor,
        "PR_POSSION": prPossion,
        "PR_BANNER_TYPE": prBannerType,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt,
        "PR_MODIFIED_AT": prModifiedAt,
      };
}
