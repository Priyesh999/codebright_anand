import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/exam_details_model.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/model_exam.dart';
import 'package:digigyan/cbtsrc/screens/online_exam/result/analysis_model.dart';

class ExamProvider {
  Future<void> getExamQuestionList({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<ExamQuestionList>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late List<ExamQuestionList> cbtData = List.empty(growable: true);
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        try {
          data['DATA'].forEach((v) {
            cbtData.add(ExamQuestionList.fromJson(v));
          });
        } catch (e) {}
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> submitExam({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<int> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        var data1 = data["DATA"]['PR_TEST_DATA_ID'];
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"] ?? "",
            resObject: data["DATA"]['PR_TEST_DATA_ID']));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> resultPartialExam({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<AnalysisReport> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess(ApiResponse(
            isSuccess: (data["STATUS"] == "SUCCESS"),
            errorCause: data["MESSAGE"] ?? "",
            resObject: AnalysisReport.fromJson(data['DATA'])));
        },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> getExamPaperQuestionList({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<ExamQuestionList>> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late List<ExamQuestionList> cbtData = List.empty(growable: true);
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        try {
          data['DATA'].forEach((v) {
            cbtData.add(ExamQuestionList.fromJson(v));
          });
        } catch (e) {}
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> getExamQuestionListDet({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<ExamQuestionDetails> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    late ExamQuestionDetails cbtData;
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        try {
          cbtData = ExamQuestionDetails.fromJson(data['DATA']);

          // cbtData.add(PrQuestion.fromJson(data['DATA']['PR_QUESTIONS']));
        } catch (e) {}
        onSuccess(ApiResponse(
            isSuccess: (data['DATA']['PR_QUESTIONS'].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
