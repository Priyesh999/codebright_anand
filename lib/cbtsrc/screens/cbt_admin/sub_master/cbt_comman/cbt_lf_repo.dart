import 'package:digigyan/cbtsrc/cbt_api/cbt_api.dart';
import 'package:digigyan/cbtsrc/cbt_data/cbt_db/cache/preference_handler.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/app_utilities/custom_log.dart';
import 'package:digigyan/cbtsrc/cbt_helpers/dailog/custom_alert_dialog.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_common_model.dart';
import 'package:digigyan/cbtsrc/cbt_model/cbt_drop_down.dart';
import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/cbt_model/response.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';
import 'package:digigyan/cbtsrc/constants/ui_controls.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/department/department_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/common_master/designation/designation_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/presentation_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/topic_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/category_lf_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/subject_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/video_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/book_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/class_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/auth/user_model/user_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/banner_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_mobile/dashboard/recent_model.dart';

import '../../../scanned_data/scanned_model.dart';

class CbtLFProvider {
  List<DigiGyanModel> cbtCommonList = List.empty(growable: true);
  List<BannerModel> bannerList = List.empty(growable: true);
  late CBTData? cbtData;
  late CbtPrModel? cbtPrModel;

  DigiGyanRecentModel digigyanData = DigiGyanRecentModel(
    prPdfData: [],
    prVodeoData: [],
  );

  Future<void> getPostsList({
    required MenuModel menuModel,
    required int page,
    required String query,
    required Function() beforeSend,
    required Function(ApiResponse<CBTData> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    String codeType = menuModel.prMenuCode!;
    var url = menuModel.prListUrl!.isEmpty
        ? ApiUrls.menuListData
        : ApiUrls.base_url_web1(menuModel.prListUrl!);

    var userId = await prefHandler.getUserId();
    var token = await prefHandler.getUserToken();

    CbtRequest(url: url /*+ "?page=${page}"*/, data: {
      // "PR_USER_ID": userId,
      "PR_TOKEN": token,
      "PR_QUERY": query,
      "PR_PAGE_NO": page,
    }).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          cbtPrModel = CbtPrModel.fromJson(data['DATA']);
          cbtPrModel!.itemData!.forEach((element) {
            cbtCommonList.add(getSearchableModel(element));
          });

          cbtData = CBTData(
              data: cbtCommonList, cbtHeaderModel: cbtPrModel!.listHeader![0]);
        } catch (e) {
          // cbtCommonList = [];
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData,
            count: data['TOTAL_COUNT'] ?? 0));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> getPostsClickList({
    required String click_url,
    String requestkey = "",
    String requestValue = "",
    required int page,
    required String query,
    required Function() beforeSend,
    required Function(ApiResponse<CBTData> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.base_url_web1(click_url);

    var userId = await prefHandler.getUserId();
    var token = await prefHandler.getUserToken();

    CbtRequest(
            url: url,
            data: requestValue.isEmpty
                ? {
                    "PR_TOKEN": token,
                    "PR_QUERY": query,
                    "PR_PAGE_NO": page,
                  }
                : {
                    "PR_TOKEN": token,
                    "PR_QUERY": query,
                    "PR_PAGE_NO": page,
                    requestkey: requestValue
                  })
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        try {
          cbtPrModel = CbtPrModel.fromJson(data['DATA']);
          cbtPrModel!.itemData!.forEach((element) {
            cbtCommonList.add(getSearchableModel(element));
          });

          cbtData = CBTData(
              data: cbtCommonList, cbtHeaderModel: cbtPrModel!.listHeader![0]);
        } catch (e) {
          // cbtCommonList = [];
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData,
            count: data['TOTAL_COUNT'] ?? 0));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  static DigiGyanModel<T> getSearchableModel<T>(T element) {
    if (element is CbtItemData || element == CbtItemData) {
      final _converted = element as CbtItemData;
      return DigiGyanModel<T>(
          id: "${_converted.id}",
          title: _converted.title.toString(),
          subTitle: _converted.image.toString(),
          originalModel: element,
          cbtRowList: _converted.rowData!,
          image: "",
          selected: false);
    } else if (element is CagtegoryModel || element == CagtegoryModel) {
      final _converted = element as CagtegoryModel;
      return DigiGyanModel<T>(
          id: "${_converted.prCategoryId}",
          title: _converted.prName.toString(),
          subTitle: _converted.prIconPath.toString(),
          originalModel: element,
          cbtRowList: [],
          image: "",
          selected: false);
    } else if (element is ClassModel || element == ClassModel) {
      final _converted = element as ClassModel;
      return DigiGyanModel<T>(
          id: "${_converted.prClassId}",
          title: _converted.prName.toString(),
          subTitle: _converted.prIconPath.toString(),
          originalModel: element,
          cbtRowList: [],
          image: _converted.prIconPath.toString(),
          selected: false);
    } else if (element is TopicModel || element == TopicModel) {
      final _converted = element as TopicModel;
      return DigiGyanModel<T>(
          id: "${_converted.prTopicId}",
          title: _converted.prName.toString(),
          subTitle: _converted.prTopicFile.toString(),
          originalModel: element,
          cbtRowList: [],
          image: _converted.prTopicFile.toString(),
          selected: false);
    } else if (element is BookModel || element == BookModel) {
      final _converted = element as BookModel;
      return DigiGyanModel<T>(
          id: "${_converted.prBookId}",
          title: _converted.prName.toString(),
          subTitle: _converted.prBookFile.toString(),
          originalModel: element,
          cbtRowList: [],
          image: _converted.prBookFile.toString(),
          selected: false);
    } else if (element is VideoModel || element == VideoModel) {
      final _converted = element as VideoModel;
      return DigiGyanModel<T>(
          id: "${_converted.prVideoId}",
          title: _converted.prName.toString(),
          subTitle: _converted.prDescription.toString(),
          originalModel: element,
          cbtRowList: [],
          image: _converted.prVideoFile.toString(),
          selected: false);
    } else if (element is SimulationModel || element == SimulationModel) {
      final _converted = element as SimulationModel;
      return DigiGyanModel<T>(
          id: "${_converted.prSimulationId}",
          title: _converted.prName.toString(),
          subTitle: _converted.prDescription.toString(),
          originalModel: element,
          cbtRowList: [],
          image: _converted.prSimulationFile.toString(),
          selected: false);
    }
    return DigiGyanModel(id: "0", title: "", originalModel: null, image: "");
  }

  Future<void> getPostsListByUrl({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<CBTData> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        try {
          if (data['DATA'].length > 0) {
            if (codeType == SubMenuCode.topicCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(TopicModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.subjectCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(SubjectModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.categoryCode) {
              data['DATA'].forEach((v) {
                cbtCommonList
                    .add(getSearchableModel(CagtegoryModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.classCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(ClassModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.bookCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(BookModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.bookCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(BookModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.departmentCode) {
              data['DATA'].forEach((v) {
                cbtCommonList
                    .add(getSearchableModel(CbtDepartmentModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.dropDownCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(CbtDropDown.fromJson(v)));
              });
            } else if (codeType == SubMenuCode.videoCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(VideoModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.salaryCode) {
              data['DATA'].forEach((v) {
                cbtCommonList.add(getSearchableModel(VideoModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            } else if (codeType == SubMenuCode.simulationCode) {
              data['DATA'].forEach((v) {
                cbtCommonList
                    .add(getSearchableModel(SimulationModel.fromJson(v)));
              });
              cbtData = CBTData(data: cbtCommonList, cbtHeaderModel: []);
            }
          } else {
            cbtData = CBTData(data: [], cbtHeaderModel: []);
          }
        } catch (e) {}
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: cbtData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> getPostsListByUrlBanner({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<List<BannerModel>> posts) onSuccess,
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
              bannerList.add(BannerModel.fromJson(v));
            });
          } else {
            bannerList = [];
          }
        } catch (e) {
          codebrightLog(e.toString());
          // cbtCommonList = [];
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"].length > 0),
            errorCause: data["MESSAGE"] ?? "",
            resObject: bannerList));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> getPostsListByUrlRecent({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<DigiGyanRecentModel> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        if (data["STATUS"] == "SUCCESS") {
        try {
          if (data['DATA'] != null) {
            digigyanData = DigiGyanRecentModel.fromJson(data['DATA']);
          }
        } catch (e) {
          codebrightLog(e.toString());
          // cbtCommonList = [];
        }}else{
          errorMessage(data['MESSAGE']);
        }
        onSuccess(ApiResponse(
            isSuccess: (data["DATA"] != null),
            errorCause: data["MESSAGE"] ?? "",
            resObject: digigyanData));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  errorMessage(String message) {
    CustomAlertDialog.showPresenceAlert(
      title: "Alert",
      message: message,
      onCancel: () =>{},
      onConfirm: () async {
        // Get.back();
        // // Get.toNamed(Routes.HOME_ADMIN);
      },
    );
  }

  Future<void> getClickItemPost({
    String urlData = "",
    String key = "",
    String id = "0",
    required Function() beforeSend,
    required Function(ApiResponse<String> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlData);

    var userId = await prefHandler.getUserToken();

    CbtRequest(
            url: url,
            data: key.isEmpty
                ? {
                    "PR_TOKEN": userId,
                  }
                : {"PR_TOKEN": userId, key: id})
        .postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        // if (data["STATUS"] == "SUCCESS") {
        // try {
        //   cbtPrModel = CbtPrModel.fromJson(data['DATA']);
        //   cbtPrModel!.itemData!.forEach((element) {
        //     cbtCommonList.add(getSearchableModel(element));
        //   });
        //
        //   cbtData = CBTData(
        //       data: cbtCommonList, cbtHeaderModel: cbtPrModel!.listHeader![0]);
        // } catch (e) {
        //   // cbtCommonList = [];
        // }
        onSuccess(ApiResponse(
            isSuccess: true,
            errorCause: data["MESSAGE"] ?? "",
            resObject: data["MESSAGE"] ?? "",
            count: 0));
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  Future<void> getPostQr({
    required Map<String, dynamic> data,
    required String urlStr,
    String codeType = "",
    required Function() beforeSend,
    required Function(ApiResponse<ScannQr> posts) onSuccess,
    required Function(dynamic error) onError,
  }) async {
    var url = ApiUrls.cbtBaseUrl(urlStr);

    CbtRequest(url: url, data: data).postRequest(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        try {
          onSuccess(ApiResponse(
              isSuccess: (data["DATA"].length > 0),
              errorCause: data["MESSAGE"] ?? "",
              resObject: ScannQr()));
        } catch (e) {
          codebrightLog(e.toString());
          // cbtCommonList = [];
        }
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
