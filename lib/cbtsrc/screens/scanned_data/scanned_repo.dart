
import 'package:digigyan/cbtsrc/screens/scanned_data/scanned_model.dart';

import '../../cbt_api/cbt_api.dart';
import '../../cbt_helpers/app_utilities/custom_log.dart';
import '../../cbt_model/response.dart';
import '../../constants/api_urls.dart';

class ScannedRepo {
  List<ScannedModel> watchList = List.empty(growable: true);

  Future<void> getWatchList({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<ScannedModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    watchList.clear();
    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'].length > 0) {
            data['DATA'].forEach((v) {
              watchList.add(ScannedModel.fromJson(v));
            });
          } else {
            watchList = [];
          }
        } catch (e) {
          codebrightLog(e.toString());
          // cbtCommonList = [];
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: watchList));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
