class CagtegoryModel {
  CagtegoryModel({
    required this.prCategoryId,
    required this.prName,
    required this.prIconPath,
    required this.prDescription,
    required this.prStatus,
    required this.prCreatedAt,
    required this.prModifiedAt,
  });

  int prCategoryId;
  String prName;
  String prIconPath;
  String prDescription;
  int prStatus;
  dynamic prCreatedAt;
  dynamic prModifiedAt;


  factory CagtegoryModel.fromJson(Map<String, dynamic> json) => CagtegoryModel(
        prCategoryId: json["PR_CATEGORY_ID"] ?? 0,
        prName: json["PR_NAME"] ?? "",
        prIconPath: json["PR_ICON_PATH"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"] ?? "",
        prModifiedAt: json["PR_MODIFIED_AT"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PR_CATEGORY_ID": prCategoryId,
        "PR_NAME": prName,
        "PR_ICON_PATH": prIconPath,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt,
        "PR_MODIFIED_AT": prModifiedAt,
      };
}
