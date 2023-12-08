class SubjectModel {
  SubjectModel({
    required this.prSubjectId,
    required this.prName,
    required this.prIconPath,
    required this.prDescription,
    required this.prStatus,
    required this.prCreatedAt,
    required this.prModifiedAt,
  });

  int prSubjectId;
  String prName;
  String prIconPath;
  String prDescription;
  int prStatus;
  dynamic prCreatedAt;
  dynamic prModifiedAt;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        prSubjectId: json["PR_SUBJECT_ID"] ?? 0,
        prName: json["PR_NAME"] ?? "",
        prIconPath: json["PR_ICON_PATH"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"]??"",
        prModifiedAt: json["PR_MODIFIED_AT"]??"",
      );

  Map<String, dynamic> toJson() => {
        "PR_SUBJECT_ID": prSubjectId,
        "PR_NAME": prName,
        "PR_ICON_PATH": prIconPath,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt,
        "PR_MODIFIED_AT": prModifiedAt,
      };
}
