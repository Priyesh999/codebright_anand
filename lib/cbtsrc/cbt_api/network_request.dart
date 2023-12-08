import 'dart:convert';
import 'dart:io';

import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/custom_log.dart';
import 'package:digigyan/cbtsrc/constants/app_messages.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/method_utils.dart';

enum HttpMethods { GET, POST, PUT, DELETE, BYTE, BYTE_POST }

class NRequest {
  late Dio dio = Dio();

  Future<Map<String, dynamic>> postRequest(
      {required String apiEndpoint,
      required Map<String, dynamic> requestData}) async {
    Map<String, dynamic> apiResponse = {};
    if (await MethodUtils.isInternetPresent()) {
      try {
        late Response response;
        var headers = {
          'Content-Type': 'application/json',
          'x-api-key':
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk',
        };
        codebrightLog(
            "Headers:  $headers, Api: $apiEndpoint, \nrequest Data: $requestData,");

        response = await dio.post(apiEndpoint,
            data: requestData, options: Options(headers: headers));
        codebrightLog("Response body: ${response.data}");
        if (response.statusCode == 200) {
          apiResponse = jsonDecode(response.data);
        } else {
          apiResponse = {
            "STATUS": "FAILURE",
            "MESSAGE": "Server Error, Please try again",
          };
        }
      } catch (e) {
        codebrightLog("Error::PostRequest: $e");
        apiResponse = {
          "STATUS": "FAILURE",
          "MESSAGE": "Something went wrong, try again"
        };
      }
    } else {
      apiResponse = {"STATUS": "FAILURE", "MESSAGE": "No internet connection"};
    }

    return apiResponse;
  }

  Future<Map<String, dynamic>> rawPostRequest(
      {required String apiEndpoint,
      required Map<String, dynamic> requestData}) async {
    Map<String, dynamic> apiResponse = {};
    if (await MethodUtils.isInternetPresent()) {
      try {
        late Response response;
        var headers = {
          'Content-Type': 'application/json',
          'x-api-key':
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk',
        };
        codebrightLog(
            "Headers:  $headers, Api: $apiEndpoint, \nrequest Data: $requestData,");

        response = await dio.post(apiEndpoint, data: jsonEncode(requestData));
        codebrightLog("Response body: ${response.data}");
        if (response.statusCode == 200) {
          apiResponse = jsonDecode(response.data);
        } else {
          apiResponse = {
            "STATUS": "FAILURE",
            "MESSAGE": "Server Error, Please try again",
          };
        }
      } catch (e) {
        codebrightLog("Error::PostRequest: $e");
        apiResponse = {
          "STATUS": "FAILURE",
          "MESSAGE": "Something went wrong, try again"
        };
      }
    } else {
      apiResponse = {"STATUS": "FAILURE", "MESSAGE": "No internet connection"};
    }

    return apiResponse;
  }

  Future<Map<String, dynamic>> formDataRequest(
      {required String apiEndpoint,
      required Map<String, dynamic> fileDataRequest,
      required File? fileToUpload,
      String fileKeyName = "attachment"}) async {
    String randomString = "${DateTime.now().toUtc().millisecondsSinceEpoch}";
    String? uId = await prefHandler.getUserId();
    Map<String, dynamic> apiResponse = {};
    if (await MethodUtils.isInternetPresent()) {
      try {
        print(
            "DETAILS IMAGE UPLoAD -> :: file--> ${fileToUpload?.path}, map: $fileDataRequest, api:-> $apiEndpoint");
        Map<String, dynamic> fileMap = {};
        if (fileToUpload != null) {
          fileDataRequest[fileKeyName] = await MultipartFile.fromFile(
            fileToUpload.path,
            filename: "mego_${uId}_$randomString",
          );
        }

        var formData = FormData.fromMap(fileDataRequest);
        var headers = {
          'Content-Type': 'image/jpeg',
          'x-api-key':
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk',
          'COMPANY_CODE': 'EHS01',
          'APP_KEY': 'NERscs5HlbtswyM'
        };
        codebrightLog(
            "Api: $apiEndpoint, \nrequest Data: fields: $fileDataRequest and files: ${formData.files},");
        var response = await dio.post(apiEndpoint,
            data: formData, options: Options(headers: headers));
        codebrightLog("Response body: ${response.data}");
        if (response.statusCode == 200) {
          apiResponse = jsonDecode(response.data);
          print("BODY -:- --> $apiResponse");
        } else {
          apiResponse = {
            "STATUS": "FAILURE",
            "MESSAGE": "Server Error, Please try again"
          };
        }
      } catch (e) {
        codebrightLog("Error::FormData Request: $e");
        apiResponse = {
          "STATUS": "FAILURE",
          "MESSAGE": "Something went wrong, try again"
        };
      }
    } else {
      apiResponse = {"STATUS": "FAILURE", "MESSAGE": "No internet connection"};
    }

    return apiResponse;
  }

  //=====================HTTP====================//

  Future<Map<String, dynamic>> networkCallPost(
      {required String targetURL,
      required Map<String, dynamic> requestParms}) async {
    var jsonResponse = {};
    try {
      String parameterSETStr = json.encode(requestParms);

      print("REQUEST_URL=> ${targetURL}");
      print("REQUEST_PARMS=> ${parameterSETStr}");

      List<int> bodyBytes = utf8.encode(parameterSETStr);
      HttpClient _httpClient = HttpClient();

      HttpClientRequest request =
          await _httpClient.postUrl(Uri.parse(targetURL));

      request.headers.set('Content-Type', 'application/json');
      request.headers.set('x-api-key',
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk');
      request.add(bodyBytes);

      var resp = await request.close();

      var responseBody = await resp.transform(utf8.decoder).join();

      print("RESPONSE=> ${responseBody}");
      return json.decode(responseBody);
    } catch (e) {
      print("api error respsone $e");
      return <String, dynamic>{};
    } finally {
      print("REQUEST_RESULT=> ${jsonResponse}");
    }
  }

  Future<Map<String, dynamic>> networkCallPostMap1(
      String url, Map<String, dynamic> parameter) async {
    try {
      String jsonString = json.encode(parameter);

      print("=>$jsonString");
      List<int> bodyBytes = utf8.encode(jsonString);
      print("uts data ${utf8.encode(jsonString)}");
      HttpClient _httpClient = HttpClient();
      HttpClientRequest request = await _httpClient.postUrl(Uri.parse(url));
      request.headers.set('Content-Type', 'application/json');
      request.headers.set('x-api-key',
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk');
      request.headers.set('Content-Length', bodyBytes.length.toString());
      request.add(bodyBytes);
      var resp = await request.close();
      var responseBody = await resp.transform(utf8.decoder).join();
      // var responseBody = await resp.stream.bytesToString();

      print(" API: RESP: Url: $url => : $responseBody");

      return json.decode(responseBody);
    } catch (e) {
      print("url:$url ERROR IN API CALL: $e");
      return <String, dynamic>{};
    }
  }

  Future<Map<String, String>> _getConnectionHeader(String _companyCode) async {
    return {
      'x-api-key':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjIiLCJ1c2VybmFtZSI6ImRvZGk',
      'COMPANY_CODE': _companyCode,
      'Cache-Control': "no-cache",
    };
  }

  Future<String> _getCompanyCode(String? useEnteredCode) async {
    String _companyCode = "";
    if (useEnteredCode != null && useEnteredCode.isNotEmpty) {
      _companyCode = useEnteredCode;
    } else {
      //Getting saved company code.
      // _companyCode = await PreferenceHandler().getCB();
      _companyCode = "CBT1";
    }
    return _companyCode;
  }

  Future<Map<String, dynamic>> uploadFile(
    String targetURL,
    String _fileLocalPath,
  ) async {
    // String _companyCode = await getCompanyCode(null);
    // String _finalUrl2Hit = await getCompleteURL(_companyCode, targetURL);
    // Map<String, String> _headers = await getConnectionHeader(_companyCode);

    return await uploadFile1(
      finalUrl2Hit: targetURL,
      // connectionHeader: _headers,
      fileLocalPath: _fileLocalPath,
    );
  }

  Future<Map<String, dynamic>> uploadFile1({
    required String finalUrl2Hit,
    required String fileLocalPath,
  }) async {
    var postUri = Uri.parse(finalUrl2Hit);

    late http.StreamedResponse resp;
    late Map<String, dynamic> errorResp;
    late Map<String, dynamic> successResp;

    int? __STATUS_CODE = 0;

    try {
      var request = http.MultipartRequest("POST", postUri);

      // request.fields['userType'] = userType;
      // request.fields['userId'] = userId;

      // request.headers.addAll(connectionHeader);
      request.files.add(
        await http.MultipartFile.fromPath(
          'PR_FILE',
          fileLocalPath,
          contentType: MediaType('image', 'jpg'),
        ),
      );

      resp = await request.send();

      errorResp = {
        'status': '0',
        'message': 'unable to communicate with server'
      };

      __STATUS_CODE = resp.statusCode;

      String _serverResponse = await resp.stream.bytesToString();

      successResp = json.decode(_serverResponse);

      if (__STATUS_CODE != 200) {}
    } catch (error, stacktrace) {
      errorResp = {
        'status': '0',
        'message': 'unable to communicate with server'
      };
    }
    return (resp.statusCode == 200) ? successResp : errorResp;
  }

//
// Future<Map<String, dynamic>> uploadFile({
//   required String finalUrl2Hit,
//   required Map<String, String> connectionHeader,
//   required String fileLocalPath,
//   required String companyCode,
// }) async {
//   var postUri = Uri.parse(finalUrl2Hit);
//
//   late http.StreamedResponse resp;
//   late Map<String, dynamic> errorResp;
//   late Map<String, dynamic> successResp;
//
//   int? __STATUS_CODE = 0;
//
//   try {
//     var request = new http.MultipartRequest("POST", postUri);
//
//     // request.fields['userType'] = userType;
//     // request.fields['userId'] = userId;
//
//     request.headers.addAll(connectionHeader);
//     request.files.add(
//       await http.MultipartFile.fromPath(
//         'fileKey',
//         fileLocalPath,
//         contentType: new MediaType('image', 'jpg'),
//       ),
//     );
//
//     cboLog(
//       "IMAGE UPLOAD REQUEST:-> ${request.toString()}",
//       fileName: "network_request.dart",
//       logAt: "uploadFile",
//     );
//     resp = await request.send();
//
//     errorResp = {
//       'status': '0',
//       'message': 'unable to communicate with server'
//     };
//
//     __STATUS_CODE = resp.statusCode;
//
//     String _serverResponse = await resp.stream.bytesToString();
//
//     successResp = json.decode(_serverResponse);
//
//     cboLog("IMAGE UPLOAD RESPONSE: $successResp",
//         fileName: "network_request.dart", logAt: "uploadFile");
//
//     if (__STATUS_CODE != 200) {
//       // String htmlRaw = AppMailer.getErrorHTMLBody(
//       //   targetURL: finalUrl2Hit,
//       //   headers: connectionHeader,
//       //   parameters: {},
//       //   errorData: "$_serverResponse",
//       // );
//
//       // AppMailer.sendMail(
//       //     targetEmail: AppAuth.appTraceReceiverEmail,
//       //     mailSubject: "SFA-FILE-UPLOADING-ERROR IN COMPANY : $companyCode",
//       //     mailBody: "NETWORK STATUS CODE : $__STATUS_CODE",
//       //     htmlBody: htmlRaw);
//     }
//   } catch (e) {
//     print("Error while uploading image: $e");
//     errorResp = {
//       'status': '0',
//       'message': 'unable to communicate with server'
//     };
//
//     // String htmlRaw = AppMailer.getErrorHTMLBody(
//     //   targetURL: finalUrl2Hit,
//     //   headers: connectionHeader,
//     //   parameters: {},
//     //   errorData: "${e.toString()}",
//     // );
//
//     // AppMailer.sendMail(
//     //     targetEmail: AppAuth.appTraceReceiverEmail,
//     //     mailSubject:
//     //     "SFA-DATA-ERROR IN COMPANY : ${await PreferenceHandler()().getCompanyCode()}",
//     //     mailBody: "NETWORK STATUS CODE : $__STATUS_CODE",
//     //     htmlBody: htmlRaw);
//   }
//
//   return (resp != null && resp.statusCode == 200) ? successResp : errorResp;
// }

// Future<Map<String, dynamic>> networkCallPostMapWithImage(
//     {required UserModel userData, required String url}) async {
//   // final String userId = "7";
//   try {
//     var postUri = Uri.parse(url);
//
//     var request = new http.MultipartRequest("POST", postUri);
//     String? userId = await PreferenceHandler().getUserId();
//     request.fields['PR_COMPANY_ID'] = "12";
//     request.fields['PR_DEPARTMENT_ID'] = "12";
//     request.fields['PR_DESIGNATION_ID'] = "1";
//
//     request.fields['PR_NAME'] = userData.prName!;
//     if (userData.prEmail != null) {
//       request.fields['PR_EMAIL'] = userData.prEmail!;
//     }
//     request.fields['PR_PHONE'] = userData.prPhone!;
//     request.fields['PR_PRESENT_PINCODE'] =
//         userData.prPresentPincode!.toString();
//     request.fields['PR_PRESENT_ADDRESS'] =
//         userData.prPresentAddress.toString();
//     // request.fields['PR_PANCARD_FILE'] = userData.prPancard!;
//
//     if (userData.prDob != null) {
//       request.fields['PR_DOB'] = getDateFromFun(userData.prDob);
//     }
//     if (userData.prGender != null) {
//       request.fields['PR_GENDER'] = userData.prGender!;
//     }
//
//     if (userId!.isNotEmpty) {
//       request.fields['USER_ID'] = userId!;
//     }
//
//     if (userData.prPancard != null) {
//       http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//           'PR_PANCARD_FILE', userData.prPancard!);
//       request.files.add(multipartFile);
//     }
//
//     if (userData.prAadharCard != null) {
//       http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
//           'PR_AADHAR_CARD_FILE', userData.prAadharCard!);
//       request.files.add(multipartFile1);
//     }
//
//     if (userData.prImage != null) {
//       http.MultipartFile multipartFile2 =
//           await http.MultipartFile.fromPath('PR_IMAGE', userData.prImage!);
//       request.files.add(multipartFile2);
//     }
//
//     print("request: $request");
//     http.StreamedResponse response = await request.send();
//     print("StatusCode: ${response.statusCode}");
//     if (response.statusCode != 200) {
//       throw "Server not responding";
//     }
//     Map<String, dynamic> successResp =
//         json.decode(await response.stream.bytesToString());
//     debugPrint("New Response from Api $successResp");
//     return successResp;
//   } on SocketException {
//     throw "Connection lost";
//   } catch (e) {
//     throw "$e";
//   }
// }
//
// Future<Map<String, dynamic>> networkCallPostMapWithImage1(
//     {required UserModel userData, required String url}) async {
//   // final String userId = "7";
//   try {
//     var postUri = Uri.parse(url);
//
//     var request = new http.MultipartRequest("POST", postUri);
//
//     request.fields['PR_COMPANY_ID'] = "12";
//     request.fields['PR_DEPARTMENT_ID'] = "12";
//     request.fields['PR_DESIGNATION_ID'] = "1";
//     request.fields['PR_NAME'] = userData.prName!;
//     request.fields['PR_EMAIL'] = userData.prEmail!;
//     request.fields['PR_PHONE'] = userData.prPhone!;
//     request.fields['PR_PRESENT_PINCODE'] =
//         userData.prPresentPincode!.toString();
//     request.fields['PR_PRESENT_ADDRESS'] =
//         userData.prPresentAddress.toString();
//     // request.fields['PR_PANCARD_FILE'] = userData.prPancard!;
//     http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
//         'PR_PANCARD_FILE', userData.prPancard!);
//
//     http.MultipartFile multipartFile1 = await http.MultipartFile.fromPath(
//         'PR_AADHAR_CARD_FILE', userData.prAadharCard!);
//
//     request.files.add(multipartFile);
//     request.files.add(multipartFile1);
//
//     print("request: $request");
//     http.StreamedResponse response = await request.send();
//     print("StatusCode: ${response.statusCode}");
//     if (response.statusCode != 200) {
//       throw "Server not responding";
//     }
//     Map<String, dynamic> successResp =
//         json.decode(await response.stream.bytesToString());
//     debugPrint("New Response from Api $successResp");
//     return successResp;
//   } on SocketException {
//     throw "Connection lost";
//   } catch (e) {
//     throw "$e";
//   }
// }
//
// String getDateFromFun(prDob) {
//   DateTime parseDate = new DateFormat("dd/MM/yyyy").parse(prDob);
//   var inputDate = DateTime.parse(parseDate.toString());
//   var outputFormat = DateFormat("yyyy-MM-dd");
//   var outputDate = outputFormat.format(inputDate);
//   return outputDate;
// }
}

class _AppDioClient {
  String get _clientName => "DIO";

  Future<Map<String, dynamic>> networkCallPost({
    required String finalUrl2Hit,
    required Map<String, dynamic> connectionHeader,
    required Map<String, dynamic> parameterSET,
    required String companyCode,
  }) async {
    int __STATUS_CODE = 0;
    Map<String, dynamic> jsonResponse = {};

    try {
      String para = jsonEncode(parameterSET);
      Options _dioOption = Options(
          headers: connectionHeader,
          sendTimeout: Duration(seconds: 60), //60 seconds
          receiveTimeout: Duration(seconds: 60) // 60 seconds
          );

      // incrementCounter(finalUrl2Hit);

      // dio.options.connectTimeout = 5
      final dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };

      Response response =
          await dio.post(finalUrl2Hit, data: para, options: _dioOption);

      __STATUS_CODE = response.statusCode ?? 0;

      if (response.statusCode == 200) {
        jsonResponse = response.data as Map<String, dynamic>;

        codebrightLog("success DIO");

        final sts = jsonResponse['status'];

        if (sts != null && ((sts as String).toUpperCase() != "SUCCESS")) {}
        // resetCounter(finalUrl2Hit);
      } else {
        jsonResponse = {
          'status': 'FAILED',
          'message': AppMessages.server300,
          'errorTrace': '',
        };
      }
    } on SocketException catch (e, st) {
      // if (getCounter(finalUrl2Hit) == 0) {
      await networkCallPost(
        finalUrl2Hit: finalUrl2Hit,
        connectionHeader: connectionHeader,
        parameterSET: parameterSET,
        companyCode: companyCode,
      );
      // }
    } on Exception catch (e, st) {
      print("$e dio:error");
      // if (getCounter(finalUrl2Hit) == 0) {
      await networkCallPost(
        finalUrl2Hit: finalUrl2Hit,
        connectionHeader: connectionHeader,
        parameterSET: parameterSET,
        companyCode: companyCode,
      );
      // }
      jsonResponse = {
        'status': 'FAILED',
        'message': "Please try again. ",
        // 'message': "We're sorry but we encountered an error while processing your request,\nPlease try again after some time",
        'errorTrace': '',
      };
    }

    return jsonResponse;
  }

  Future<double> getFileSizeUrl(String url) async {
    if (url.startsWith("http")) {
      final double mbEquivalentTo1Byte = 0.000001;
      //Dio dio = Dio();
      var res = await Dio().head(url);
      var rawSize = res.headers["content-length"];
      double sizeBytes = double.tryParse(rawSize?.first ?? "") ?? 0;
      codebrightLog("SizeBytes: $sizeBytes and Row size ${rawSize.toString()}");
      double sizeInMB = (sizeBytes * mbEquivalentTo1Byte);
      return sizeInMB;
    } else {
      return 0.0;
    }
  }

  Future<Map<String, dynamic>> uploadFile(
    String targetURL,
    String _fileLocalPath,
  ) async {
    // String _companyCode = await getCompanyCode(null);
    // String _finalUrl2Hit = await getCompleteURL(_companyCode, targetURL);
    // Map<String, String> _headers = await getConnectionHeader(_companyCode);

    return await uploadFile1(
      finalUrl2Hit: targetURL,
      // connectionHeader: _headers,
      fileLocalPath: _fileLocalPath,
    );
  }

  Future<Map<String, dynamic>> uploadFile1({
    required String finalUrl2Hit,
    required String fileLocalPath,
  }) async {
    var postUri = Uri.parse(finalUrl2Hit);

    late http.StreamedResponse resp;
    late Map<String, dynamic> errorResp;
    late Map<String, dynamic> successResp;

    int? __STATUS_CODE = 0;

    try {
      var request = http.MultipartRequest("POST", postUri);

      // request.fields['userType'] = userType;
      // request.fields['userId'] = userId;

      // request.headers.addAll(connectionHeader);
      request.files.add(
        await http.MultipartFile.fromPath(
          'PR_FILE',
          fileLocalPath,
          contentType: MediaType('image', 'jpg'),
        ),
      );

      resp = await request.send();

      errorResp = {
        'status': '0',
        'message': 'unable to communicate with server'
      };

      __STATUS_CODE = resp.statusCode;

      String _serverResponse = await resp.stream.bytesToString();

      successResp = json.decode(_serverResponse);

      if (__STATUS_CODE != 200) {}
    } catch (error, stacktrace) {
      errorResp = {
        'status': '0',
        'message': 'unable to communicate with server'
      };
    }
    return (resp.statusCode == 200) ? successResp : errorResp;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
