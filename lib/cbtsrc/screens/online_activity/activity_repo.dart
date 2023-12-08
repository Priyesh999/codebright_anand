import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/screens/online_activity/activity_fill/activity_model.dart';

class CbtActivityRepo {
  Future<void> getActivityData({
    required Map<String, dynamic> param,
    required String url,
    required Function() beforeSend,
    required Function(ApiResponse<List<ActivityModel>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    List<ActivityModel> listActivity = List.empty(growable: true);
    CbtRequest(url: url, data: param, isStandredData: false).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
          try {
            if (data['DATA'] != null) {
              data['DATA'].forEach((v) {
                listActivity.add(ActivityModel.fromJson(v));
              });
            }
          } catch (e) {}
        }
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"],
            resObject: listActivity));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
