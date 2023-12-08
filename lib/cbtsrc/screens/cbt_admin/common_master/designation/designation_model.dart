
// class DesignationModel {
//   DesignationModel({
//     this.prDesignationId,
//     this.prDesigName,
//     this.prDesigDesc,
//     this.prCreatedAt,
//     this.prModifiedAt,
//     this.prStatus,
//     this.prDepartment,
//     this.isSelected=false,
//   });
//
//   int? prDesignationId;
//   String? prDesigName;
//   String? prDesigDesc;
//   DateTime? prCreatedAt;
//   DateTime? prModifiedAt;
//   int? prStatus;
//   int? prDepartment;
//   bool? isSelected;
//
//   factory DesignationModel.fromJson(Map<String, dynamic> json) => DesignationModel(
//     prDesignationId: json["PR_DESIGNATION_ID"] ?? null,
//     prDesigName: json["PR_DESIG_NAME"] ?? null,
//     prDesigDesc: json["PR_DESIG_DESC"] ?? null,
//     prCreatedAt: json["PR_CREATED_AT"] ??null,
//     prModifiedAt: json["PR_MODIFIED_AT"] ?? null ,
//     prStatus: json["PR_STATUS"] ?? null,
//     prDepartment: json["PR_DEPARTMENT"] ?? null,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_DESIGNATION_ID": prDesignationId ?? null,
//     "PR_DESIG_NAME": prDesigName ?? null,
//     "PR_DESIG_DESC": prDesigDesc ?? null,
//     "PR_CREATED_AT": prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
//     "PR_MODIFIED_AT": prModifiedAt == null ? null : prModifiedAt!.toIso8601String(),
//     "PR_STATUS": prStatus ?? null,
//     "PR_DEPARTMENT": prDepartment ?? null,
//   };
// }


// To parse this JSON data, do
//
//     final mDesignation = mDesignationFromJson(jsonString);

// import 'dart:convert';
//
// MDesignation mDesignationFromJson(String str) => MDesignation.fromJson(json.decode(str));
//
// String mDesignationToJson(MDesignation data) => json.encode(data.toJson());

import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_model.dart';

class DesignationModel {
  DesignationModel({
    this.prDesignationId,
    this.prDepartment,
    this.prDesigName,
    this.prDesigDesc,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prStatus,
    this.isSelected=false,
  });

  int? prDesignationId;
  CbtDepartmentModel? prDepartment;
  String? prDesigName;
  String? prDesigDesc;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prStatus;
  bool isSelected;

  factory DesignationModel.fromJson(Map<String, dynamic> json) => DesignationModel(
    prDesignationId: json["PR_DESIGNATION_ID"] == null ? null : json["PR_DESIGNATION_ID"],
    prDepartment: json["PR_DEPARTMENT"] == null ? null : CbtDepartmentModel.fromJson(json["PR_DEPARTMENT"]),
    prDesigName: json["PR_DESIG_NAME"] == null ? null : json["PR_DESIG_NAME"],
    prDesigDesc: json["PR_DESIG_DESC"] == null ? null : json["PR_DESIG_DESC"],
    prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
    prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
    prStatus: json["PR_STATUS"] == null ? null : json["PR_STATUS"],
  );

  Map<String, dynamic> toJson() => {
    "PR_DESIGNATION_ID": prDesignationId == null ? null : prDesignationId,
    "PR_DEPARTMENT": prDepartment == null ? null : prDepartment!.toJson(),
    "PR_DESIG_NAME": prDesigName == null ? null : prDesigName,
    "PR_DESIG_DESC": prDesigDesc == null ? null : prDesigDesc,
    "PR_CREATED_AT": prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
    "PR_MODIFIED_AT": prModifiedAt == null ? null : prModifiedAt!.toIso8601String(),
    "PR_STATUS": prStatus == null ? null : prStatus,
  };
}


