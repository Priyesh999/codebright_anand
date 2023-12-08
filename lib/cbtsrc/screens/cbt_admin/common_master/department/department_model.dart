class CbtDepartmentModel {
  CbtDepartmentModel({
    this.prDepartmentId,
    this.prDeptName,
    this.prDeptDesc,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prStatus,
    this.isSelected = false,
  });

  int? prDepartmentId;
  String? prDeptName;
  String? prDeptDesc;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prStatus;
  bool isSelected;

  factory CbtDepartmentModel.fromJson(Map<String, dynamic> json) =>
      CbtDepartmentModel(
        prDepartmentId: json["PR_DEPARTMENT_ID"],
        prDeptName: json["PR_DEPT_NAME"],
        prDeptDesc: json["PR_DEPT_DESC"],
        prCreatedAt: DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: DateTime.parse(json["PR_MODIFIED_AT"]),
        prStatus: json["PR_STATUS"],
      );

  Map<String, dynamic> toJson() => {
        "PR_DEPARTMENT_ID": prDepartmentId,
        "PR_DEPT_NAME": prDeptName,
        "PR_DEPT_DESC": prDeptDesc,
        "PR_CREATED_AT": prCreatedAt!.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt!.toIso8601String(),
        "PR_STATUS": prStatus,
      };
}

