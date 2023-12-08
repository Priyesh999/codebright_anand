import 'dart:convert';

import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_data.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_generator.dart';
import 'package:flutter/services.dart';

class TestGeneratorRepo {
  Future<List<ChapterModel>> readJson() async {
    List<ChapterModel> chapterList = List.empty(growable: true);
    final String response =
        await rootBundle.loadString('assets/cbt_json/chapter.json');
    final data = await json.decode(response);

    for (int i = 0; i < data["DATA"].length; i++) {
      chapterList.add(ChapterModel.fromJson(data["DATA"][i]));
    }
    return chapterList;
  }

  Future<List<QuestionType>> readQuestionJson() async {
    List<QuestionType> questionList = List.empty(growable: true);
    final String response =
        await rootBundle.loadString('assets/cbt_json/question.json');
    final data = await json.decode(response);

    for (int i = 0; i < data["DATA"].length; i++) {
      questionList.add(QuestionType.fromJson(data["DATA"][i]));
    }
    return questionList;
  }

  Future<PaperGenerationModel> readQuestionPaperJson() async {
    final String response =
        await rootBundle.loadString('assets/cbt_json/question_paper.json');
    final data = await json.decode(response);

    return PaperGenerationModel.fromJson(data["DATA"]);
  }

  Future<TestGeneratorMainModel> readJsonTestMain() async {
    final String response =
        // await rootBundle.loadString('assets/cbt_json/vedanta_english_6564.json');
        // await rootBundle.loadString('assets/cbt_json/vedanta_hindi_stuti_4.json');
        await rootBundle
            .loadString('assets/cbt_json/math-1.json');
    // await rootBundle.loadString('assets/cbt_json/vedanta_math_4.json');
    // await rootBundle.loadString('assets/cbt_json/vedanta_math_5.json');
    final data = await json.decode(response);
    return TestGeneratorMainModel.fromJson(data["DATA"]);
  }

  Future<void> getCBData({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<TestGeneratorMainModel> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    // var url = ApiUrls.baseUrl(urlStr);

    CbtRequest(url: urlStr, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess(ApiResponse(
            isSuccess: true,
            errorCause: data["MESSAGE"] ?? "",
            resObject: TestGeneratorMainModel.fromJson(data['DATA'])));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
