import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_model.dart';

class CBTCommonProvider {
  List<CbtDepartmentModel> departMentList = List.empty(growable: true);
  List<DesignationModel> designation = List.empty(growable: true);

  void getDataList({
    required Function() beforeSend,
    required Function(ApiResponse<List<CbtDepartmentModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) {
    CbtRequest(url: ApiUrls.department_list, data: {}, isStandredData: true)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'].length > 0) {
              data['DATA'].forEach((v) {
                departMentList.add(CbtDepartmentModel.fromJson(v));
              });
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: departMentList));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getDesDataList({
    CbtDepartmentModel? departmentModel,
    required Function() beforeSend,
    required Function(ApiResponse<List<DesignationModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) {
    Map<String, dynamic> reqData = departmentModel != null
        ? {"PR_DEPARTMENT_ID": departmentModel.prDepartmentId}
        : {};
    CbtRequest(
            url: ApiUrls.designation_list, data: reqData, isStandredData: true)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'].length > 0) {
              data['DATA'].forEach((v) {
                designation.add(DesignationModel.fromJson(v));
              });
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: designation));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void postDataList({
    required CbtDepartmentModel departmentModel,
    required Function() beforeSend,
    required Function(ApiResponse<List<CbtDepartmentModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) {
    Map<String, dynamic> param = {
      "PR_DEPT_NAME": departmentModel.prDeptName,
      "PR_DEPT_DESC": departmentModel.prDeptDesc,
      "PR_STATUS": departmentModel.prStatus
    };

    CbtRequest(url: ApiUrls.department_add, data: param, isStandredData: true)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'] != null) {
              departMentList.add(CbtDepartmentModel.fromJson(data['DATA']));
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: departMentList));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void deleateData({
    required CbtDepartmentModel departmentModel,
    required Function() beforeSend,
    required Function(ApiResponse<List<CbtDepartmentModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) {
    Map<String, dynamic> param = {
      "PR_DEPT_NAME": departmentModel.prDeptName,
      "PR_DEPT_DESC": departmentModel.prDeptDesc
    };

    CbtRequest(url: ApiUrls.department_add, data: param, isStandredData: true)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'] != null) {
              departMentList.add(CbtDepartmentModel.fromJson(data['DATA']));
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: departMentList));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  //Designation Data

  void postDesignationDataList({
    required DesignationModel designationModel,
    required Function() beforeSend,
    required Function(ApiResponse<List<DesignationModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) {
    Map<String, dynamic> param = {
      "PR_DESIG_NAME": designationModel.prDesigName,
      "PR_DEPARTMENT": designationModel.prDepartment!.prDepartmentId,
      "PR_STATUS": designationModel.prStatus
    };

    CbtRequest(url: ApiUrls.designation_add, data: param, isStandredData: true)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'] != null) {
              designation.add(DesignationModel.fromJson(data['DATA']));
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: designation));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }



}
