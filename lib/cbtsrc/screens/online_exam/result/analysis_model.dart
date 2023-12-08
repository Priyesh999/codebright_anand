
class AnalysisReport {
  PrUser? prUser;
  int? prTestAttempted;
  int? prCurrectAnswers;
  int? prIncurrectAnswers;
  int? prAttemptedQues;
  int? prUnattemptedQues;
  int? prWatchVideos;
  int? prWatchDoc;

  AnalysisReport({
    this.prUser,
    this.prTestAttempted,
    this.prCurrectAnswers,
    this.prIncurrectAnswers,
    this.prAttemptedQues,
    this.prUnattemptedQues,
    this.prWatchVideos,
    this.prWatchDoc,
  });

  factory AnalysisReport.fromJson(Map<String, dynamic> json) => AnalysisReport(
    prUser: json["PR_USER"] == null ? null : PrUser.fromJson(json["PR_USER"]),
    prTestAttempted: json["PR_TEST_ATTEMPTED"],
    prCurrectAnswers: json["PR_CURRECT_ANSWERS"],
    prIncurrectAnswers: json["PR_INCURRECT_ANSWERS"],
    prAttemptedQues: json["PR_ATTEMPTED_QUES"],
    prUnattemptedQues: json["PR_UNATTEMPTED_QUES"],
    prWatchVideos: json["PR_WATCH_VIDEOS"],
    prWatchDoc: json["PR_WATCH_DOC"],
  );

  Map<String, dynamic> toJson() => {
    "PR_USER": prUser?.toJson(),
    "PR_TEST_ATTEMPTED": prTestAttempted,
    "PR_CURRECT_ANSWERS": prCurrectAnswers,
    "PR_INCURRECT_ANSWERS": prIncurrectAnswers,
    "PR_ATTEMPTED_QUES": prAttemptedQues,
    "PR_UNATTEMPTED_QUES": prUnattemptedQues,
    "PR_WATCH_VIDEOS": prWatchVideos,
    "PR_WATCH_DOC": prWatchDoc,
  };
}

class PrUser {
  int? prUserId;
  String? prName;
  String? prCode;
  String? prEmail;
  String? prPhone;
  String? prPassword;
  String? prToken;
  String? prFcmKey;
  int? prIsActive;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrUser({
    this.prUserId,
    this.prName,
    this.prCode,
    this.prEmail,
    this.prPhone,
    this.prPassword,
    this.prToken,
    this.prFcmKey,
    this.prIsActive,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrUser.fromJson(Map<String, dynamic> json) => PrUser(
    prUserId: json["PR_USER_ID"],
    prName: json["PR_NAME"],
    prCode: json["PR_CODE"],
    prEmail: json["PR_EMAIL"],
    prPhone: json["PR_PHONE"],
    prPassword: json["PR_PASSWORD"],
    prToken: json["PR_TOKEN"],
    prFcmKey: json["PR_FCM_KEY"],
    prIsActive: json["PR_IS_ACTIVE"],
    prStatus: json["PR_STATUS"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
  );

  Map<String, dynamic> toJson() => {
    "PR_USER_ID": prUserId,
    "PR_NAME": prName,
    "PR_CODE": prCode,
    "PR_EMAIL": prEmail,
    "PR_PHONE": prPhone,
    "PR_PASSWORD": prPassword,
    "PR_TOKEN": prToken,
    "PR_FCM_KEY": prFcmKey,
    "PR_IS_ACTIVE": prIsActive,
    "PR_STATUS": prStatus,
    "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
  };
}
