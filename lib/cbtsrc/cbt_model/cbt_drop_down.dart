// // To parse this JSON data, do
// //
// //     final cbtDropDown = cbtDropDownFromJson(jsonString);
//
// import 'dart:convert';
//
// CbtDropDown cbtDropDownFromJson(String str) => CbtDropDown.fromJson(json.decode(str));
//
// String cbtDropDownToJson(CbtDropDown data) => json.encode(data.toJson());

class CbtDropDown {
  CbtDropDown(
      {this.prId,
      this.prType,
      this.prName,
      this.prImagePath,
      this.prFilePath,
      this.prUrl,
      this.prStatus,
      this.prCreatedAt,
      this.prModifiedAt,
      this.parrentId});

  int? prId;
  int? parrentId;
  String? prType;
  String? prName;
  String? prImagePath;
  String? prFilePath;
  String? prUrl;
  String? prStatus;
  dynamic? prCreatedAt;
  dynamic? prModifiedAt;

  factory CbtDropDown.fromJson(Map<String, dynamic> json) => CbtDropDown(
        prId: json["PR_ID"] ?? 0,
        parrentId: json["PR_PARENT_ID"] ?? 0,
        prType: json["PR_TYPE"] ?? "",
        prName: json["PR_NAME"] ?? "",
        prFilePath: json["PR_FILE_PATH"] ?? "",
        prUrl: json["PR_URL"] ?? "",
        prImagePath: json["PR_ICON_PATH"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"] ?? "",
        prModifiedAt: json["PR_MODIFIED_AT"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PR_ID": prId,
        "PR_PARENT_ID": parrentId,
        "PR_TYPE": prType,
        "PR_NAME": prName,
        "PR_IMAGE_PATH": prImagePath,
        "PR_FILE_PATH": prFilePath,
        "PR_URL": prUrl,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt,
        "PR_MODIFIED_AT": prModifiedAt,
      };

  factory CbtDropDown.fromPreferenceMap(Map<String, dynamic> json) =>
      CbtDropDown(
        prId: json["PR_ID"] ?? 0,
        parrentId: json["PR_PARENT_ID"] ?? 0,
        prType: json["PR_TYPE"] ?? "",
        prName: json["PR_NAME"] ?? "",
        prFilePath: json["PR_FILE_PATH"] ?? "",
        prUrl: json["PR_URL"] ?? "",
        prImagePath: json["PR_ICON_PATH"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
        prCreatedAt: json["PR_CREATED_AT"] ?? "",
        prModifiedAt: json["PR_MODIFIED_AT"] ?? "",
      );

  Map<String, dynamic> toMapForPreference() => {
        "PR_ID": prId,
        "PR_PARENT_ID": parrentId,
        "PR_TYPE": prType,
        "PR_NAME": prName,
        "PR_IMAGE_PATH": prImagePath,
        "PR_FILE_PATH": prFilePath,
        "PR_URL": prUrl,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt,
        "PR_MODIFIED_AT": prModifiedAt,
      };
}
