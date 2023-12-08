import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:get/get.dart';

import '../screens/cbt_admin/sub_master/cbt_comman/cbt_lf_controller.dart';

class DigiGyanRepo {
  List<DigiGyanModel> cbtCommonList = List.empty(growable: true);
  late DigiGyanData? cbtData;
  late CbtPrModel? cbtPrModel;

  CbtLFController controller = Get.put(CbtLFController());

  Future<void> getPostsList({
    required MenuModel menuModel,
    required Function() beforeSend,
    required Function(ApiResponse<DigiGyanData> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String codeType = menuModel.prMenuCode!;
    var url = menuModel.prListUrl!.isEmpty
        ? ApiUrls.menuListData
        : ApiUrls.base_url_web1(menuModel.prListUrl!);

    var userId = await prefHandler.getUserId();
    var companyID = await prefHandler.getCompanyID();

    CbtRequest(
            url: url,
            data: {"COMPANY_ID": companyID, "USER_ID": userId, "PR_QUERY": ""})
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'].length > 0) {
            cbtPrModel = CbtPrModel.fromJson(data['DATA']);

            cbtPrModel!.itemData!.forEach((element) {
              cbtCommonList.add(getSearchableModel(element));
            });

            cbtData = DigiGyanData(
                data: cbtCommonList,
                cbtHeaderModel: cbtPrModel!.listHeader![0]);
          }
        } catch (e) {}
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  static DigiGyanModel<T> getSearchableModel<T>(T element) {
    if (element is CbtItemData || element == CbtItemData) {
      final _converted = element as CbtItemData;
      return DigiGyanModel<T>(
          id: "${_converted.id}",
          title: _converted.title.toString(),
          subTitle: _converted.image.toString(),
          originalModel: element,
          cbtRowList: _converted.rowData!,
          image: "",
          selected: false);
    }
    return DigiGyanModel(id: "0", title: "", originalModel: null, image: "");
  }

  Future<void> getPostsFilterList({
    required MenuModel menuModel,
    required Function() beforeSend,
    required Function(ApiResponse<DigiGyanData> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String codeType = menuModel.prMenuCode!;
    var url = menuModel.prListUrl!.isEmpty
        ? ApiUrls.menuListData
        : ApiUrls.base_url_web1(menuModel.prListUrl!);

    var userId = await prefHandler.getUserId();
    var companyID = await prefHandler.getCompanyID();

    CbtRequest(
            url: url,
            data: {"COMPANY_ID": companyID, "USER_ID": userId, "PR_QUERY": ""})
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'].length > 0) {
            cbtPrModel = CbtPrModel.fromJson(data['DATA']);

            cbtPrModel!.itemData!.forEach((element) {
              cbtCommonList.add(getSearchableModel(element));
            });

            cbtData = DigiGyanData(
                data: cbtCommonList,
                cbtHeaderModel: cbtPrModel!.listHeader![0]);
          }
        } catch (e) {}
        // controller_view_all.dart.filterDataResponse.value!.employeeData!.clear();
        // controller_view_all.dart.filterDataResponse.value!.yearData!.clear();
        // controller_view_all.dart.filterDataResponse.value!.monthData!.clear();
        // controller_view_all.dart.filterDataResponse.value!.flag!.clear();
        // controller_view_all.dart.filterDataResponse.value!.statusList!.clear();
        // controller_view_all.dart.filterDataResponse.value!.startDate = false;
        // controller_view_all.dart.filterDataResponse.value!.endDate = false;
        // controller_view_all.dart.filterDataResponse.value = data["DROPDOWN_DATA"] == null
        //     ? CodebrighFilterModel.empty()
        //     : CodebrighFilterModel.fromJson(data["DROPDOWN_DATA"]);

        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
