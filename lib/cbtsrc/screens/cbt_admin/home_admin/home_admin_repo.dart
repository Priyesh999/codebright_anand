import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_drop_down.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';

import '../../../cbt_data/cbt_db/cache/preference_handler.dart';

class HomeAdminProvider {
  List<MenuModel> menuLis = List.empty(growable: true);
  List<CbtDropDown> cbtDropDownList = List.empty(growable: true);

  void getMenuList({
    required Map<String, String> requestData,
    required Function() beforeSend,
    required Function(ApiResponse<List<MenuModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var userId = await prefHandler.getUserToken();
    var data = {"PR_TOKEN": userId/*, "PR_PAGE_NO": 1, "PR_QUERY": ""*/};

    CbtRequest(url: ApiUrls.menu_list, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'].length > 0) {
              data['DATA'].forEach((v) {
                menuLis.add(MenuModel.fromJson(v));
              });
            }
          } catch (e) {
            print(e.toString());
          }
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"] ?? "",
            resObject: menuLis));

        // onSuccess((data as List).map((postJson) => MenuModel.fromJson(postJson['DATA'])).toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getDropDownList({
    required Map<String, String> requestData,
    required Function() beforeSend,
    required Function(ApiResponse<List<CbtDropDown>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) {
    CbtRequest(
            url: ApiUrls.cbt_drop_down,
            data: requestData,
            isStandredData: false)
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'].length > 0) {
              data['DATA'].forEach((v) {
                cbtDropDownList.add(CbtDropDown.fromJson(v));
              });
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: cbtDropDownList));

        // onSuccess((data as List).map((postJson) => MenuModel.fromJson(postJson['DATA'])).toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
