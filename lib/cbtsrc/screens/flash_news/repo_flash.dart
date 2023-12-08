import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/custom_log.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_model.dart';
import 'package:digigyan/cbtsrc/screens/flash_news/flash_model.dart';

class FlashNewsRepo {
  List<FlashNewsModel> flashNews = List.empty(growable: true);
  List<FlashCardGridModel> flashCardGrid = List.empty(growable: true);

  Future<void> getFlashNews({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<FlashNewsModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'].length > 0) {
            data['DATA'].forEach((v) {
              flashNews.add(FlashNewsModel.fromJson(v));
            });
          } else {
            flashNews = [];
          }
        } catch (e) {
          codebrightLog(e.toString());
          // cbtCommonList = [];
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: flashNews));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }



  Future<void> getFlashCardGrid({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<FlashCardGridModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.baseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'].length > 0) {
            data['DATA'].forEach((v) {
              flashCardGrid.add(FlashCardGridModel.fromJson(v));
            });
          } else {
            flashCardGrid = [];
          }
        } catch (e) {
          codebrightLog(e.toString());
          // cbtCommonList = [];
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: flashCardGrid));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
