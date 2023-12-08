import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/custom_log.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/my_watch_list/watch_list_model.dart';

class ViewListRepo {
  List<WatchListModel> watchList = List.empty(growable: true);

  Future<void> getWatchList({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<WatchListModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.baseUrl(urlStr);

    watchList.clear();
    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'].length > 0) {
            data['DATA'].forEach((v) {
              watchList.add(WatchListModel.fromJson(v));
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
