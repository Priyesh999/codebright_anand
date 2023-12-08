import 'package:digigyan/cbtsrc/screens/online_learn/vcb_model.dart';

import '../../cbt_api/cbt_api.dart';
import '../../cbt_model/response.dart';

class OnLineLearnRepo{
  Future<void> getCBData({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<VcbTechModel> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    // var url = ApiUrls.baseUrl(urlStr);

    CbtRequest(url: urlStr, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess(ApiResponse(
            isSuccess: true,
            errorCause: data["MESSAGE"] ?? "",
            resObject: VcbTechModel.fromJson(data)));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}