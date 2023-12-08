class VideoModel {
  VideoModel({
    required this.prVideoId,
    required this.prName,
    required this.prCode,
    required this.prType,
    required this.prYoutubeUrl,
    this.prVideoFile,
    this.prThumnail,
    this.prLength,
    this.prStartTime,
    this.prEndTime,
    this.prDescription,
    required this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    // required this.prCategory,
  });

  int prVideoId;
  String prName;
  String prCode;
  String prType;
  String prYoutubeUrl;
  dynamic prVideoFile;
  dynamic prThumnail;
  dynamic prLength;
  dynamic prStartTime;
  dynamic prEndTime;
  dynamic prDescription;
  int prStatus;
  dynamic prCreatedAt;
  dynamic prModifiedAt;
  // int prCategory;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
    prVideoId: json["PR_VIDEO_ID"]??0,
    prName: json["PR_NAME"]??"",
    prCode: json["PR_CODE"]??"",
    prType: json["PR_TYPE"]??"",
    prYoutubeUrl: json["PR_YOUTUBE_URL"]??"",
    prVideoFile: json["PR_VIDEO_FILE"]??"",
    prThumnail: json["PR_THUMNAIL"]??"",
    prLength: json["PR_LENGTH"]??"",
    prStartTime: json["PR_START_TIME"]??"",
    prEndTime: json["PR_END_TIME"]??"",
    prDescription: json["PR_DESCRIPTION"]??"",
    prStatus: json["PR_STATUS"]??"",
    prCreatedAt: json["PR_CREATED_AT"]??"",
    prModifiedAt: json["PR_MODIFIED_AT"]??"",
    // prCategory: json["PR_CATEGORY"]??"",
  );

  Map<String, dynamic> toJson() => {
    "PR_VIDEO_ID": prVideoId,
    "PR_NAME": prName,
    "PR_CODE": prCode,
    "PR_TYPE": prType,
    "PR_YOUTUBE_URL": prYoutubeUrl,
    "PR_VIDEO_FILE": prVideoFile,
    "PR_THUMNAIL": prThumnail,
    "PR_LENGTH": prLength,
    "PR_START_TIME": prStartTime,
    "PR_END_TIME": prEndTime,
    "PR_DESCRIPTION": prDescription,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt,
    "PR_MODIFIED_AT": prModifiedAt,
    // "PR_CATEGORY": prCategory,
  };
}
