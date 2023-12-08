import 'package:digigyan/cbtsrc/constants/app_messages.dart';

class DataResponse<T> {
  T? data;
  bool isSuccess;
  bool isWarning;
  bool updateRequired;
  String msg;

  DataResponse({
    required this.isSuccess,
    required this.data,
    required this.msg,
    this.updateRequired = false,
    this.isWarning = false,
  });

  factory DataResponse.warning(T data, {String msg = ""}) => DataResponse(
        isSuccess: true,
        isWarning: true,
        data: data,
        msg: msg,
      );

  factory DataResponse.success(T data) => DataResponse(
        isSuccess: true,
        isWarning: false,
        data: data,
        msg: "",
      );

  factory DataResponse.failure(String errorMsg) => DataResponse(
        isSuccess: false,
        isWarning: false,
        data: null,
        msg: errorMsg,
      );

  factory DataResponse.noInternet() => DataResponse.failure(
        AppMessages.getNoInternetMsg,
      );

  factory DataResponse.dataNotFound() => DataResponse.failure(
        AppMessages.emptyData,
      );
}
//
// class DataResponseList<T> {
//   List<T>? resObject;
//   bool isSuccess;
//   bool updateRequired;
//   String errorCause;
//
//   DataResponseList({
//     required this.isSuccess,
//     required this.resObject,
//     required this.errorCause,
//     this.updateRequired = false,
//   });
//
//   factory DataResponseList.success(List<T> data) => DataResponseList(
//     isSuccess: true,
//     resObject: data,
//     errorCause: "",
//   );
//
//   factory DataResponseList.failure(String errorMsg) => DataResponseList(
//     isSuccess: false,
//     resObject: null,
//     errorCause: errorMsg,
//   );
// }
