class ClassModel {
  ClassModel({
    required this.prClassId,
    required this.prName,
    required this.prIconPath,
    required this.prDescription,
    required this.prStatus,
    required this.prCreatedAt,
    required this.prModifiedAt,
  });

  int prClassId;
  String prName;
  String prIconPath;
  String prDescription;
  int prStatus;
  dynamic prCreatedAt;
  dynamic prModifiedAt;

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        prClassId: json["PR_CLASS_ID"] ?? 0,
        prName: json["PR_NAME"] ?? "",
        prIconPath: json["PR_ICON_PATH"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"],
        prModifiedAt: json["PR_MODIFIED_AT"],
      );

  Map<String, dynamic> toJson() => {
        "PR_CLASS_ID": prClassId,
        "PR_NAME": prName,
        "PR_ICON_PATH": prIconPath,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt,
        "PR_MODIFIED_AT": prModifiedAt,
      };
}
