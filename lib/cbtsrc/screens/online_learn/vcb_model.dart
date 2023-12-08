import 'package:digigyan/cbtsrc/screens/flash_card/flash_card_list/flash_card_list_model.dart';
import 'package:digigyan/cbtsrc/screens/test_generator/test_home/model_test_data.dart';

//
// class VcbTechModel {
//   String? status;
//   String? message;
//   Data? data;
//
//   VcbTechModel({
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   factory VcbTechModel.fromJson(Map<String, dynamic> json) => VcbTechModel(
//         status: json["STATUS"],
//         message: json["MESSAGE"],
//         data: json["DATA"] == null ? null : Data.fromJson(json["DATA"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "STATUS": status,
//         "MESSAGE": message,
//         "DATA": data?.toJson(),
//       };
// }
//
// class Data {
//   String? prCategory;
//   String? prClass;
//   String? prSubject;
//   int? prBookId;
//   String? prName;
//   String? prCode;
//   String? prIcon;
//   String? prDescription;
//   PrPdf? prPdf;
//   List<PrFlashCard>? prFlashCard;
//   List<VideoDataModel>? prVideoData;
//   List<PrChapter?> prChapter;
//   List<PrChapter>? prTestGeneratorData;
//   List<ActivityData>? activityDataList;
//
//   Data({
//     this.prCategory,
//     this.prClass,
//     this.prSubject,
//     this.prBookId,
//     this.prName,
//     this.prCode,
//     this.prIcon,
//     this.prDescription,
//     this.prPdf,
//     this.prFlashCard,
//     this.activityDataList,
//     required this.prChapter,
//     this.prVideoData,
//     this.prTestGeneratorData,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         prCategory: json["PR_CATEGORY"]["PR_NAME"],
//         prClass: json["PR_CLASS"],
//         prSubject: json["PR_SUBJECT"],
//         prBookId: json["PR_BOOK_ID"],
//         prName: json["PR_NAME"],
//         prCode: json["PR_CODE"],
//         prIcon: json["PR_ICON"],
//         prDescription: json["PR_DESCRIPTION"],
//         prPdf: json["PR_PDF"] == null ? null : PrPdf.fromJson(json["PR_PDF"]),
//         prFlashCard: json["PR_FLASH_CARD"] == null
//             ? []
//             : List<PrFlashCard>.from(
//                 json["PR_FLASH_CARD"]!.map((x) => PrFlashCard.fromJson(x))),
//         activityDataList: json["PR_ACTIVITY_DATA"] == null
//             ? []
//             : List<ActivityData>.from(
//                 json["PR_ACTIVITY_DATA"]!.map((x) => ActivityData.fromJson(x))),
//         prChapter: json["PR_CHAPTER"] == null
//             ? []
//             : List<PrChapter>.from(json["PR_CHAPTER"]!.map((x) => PrChapter.fromJson(x))),
//         prVideoData: json["PR_VIDEO_DATA"] == null
//             ? []
//             : List<VideoDataModel>.from(
//                 json["PR_VIDEO_DATA"]!.map((x) => VideoDataModel.fromJson(x))),
//         prTestGeneratorData: json["PR_TEST_GENERATOR_DATA"] == null
//             ? []
//             : List<PrChapter>.from(
//                 json["PR_TEST_GENERATOR_DATA"]!.map((x) => PrChapter.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_CATEGORY": prCategory,
//         "PR_CLASS": prClass,
//         "PR_SUBJECT": prSubject,
//         "PR_BOOK_ID": prBookId,
//         "PR_NAME": prName,
//         "PR_CODE": prCode,
//         "PR_ICON": prIcon,
//         "PR_DESCRIPTION": prDescription,
//         "PR_PDF": prPdf?.toJson(),
//         "PR_FLASH_CARD": prFlashCard == null
//             ? []
//             : List<dynamic>.from(prFlashCard!.map((x) => x.toJson())),
//         "PR_FLASH_CARD": activityDataList == null
//             ? []
//             : List<dynamic>.from(activityDataList!.map((x) => x.toJson())),
//         "PR_CHAPTER": prChapter == null
//             ? []
//             : List<dynamic>.from(prChapter!.map((x) => x!.toJson())),
//         "PR_VIDEO_DATA": prChapter == null
//             ? []
//             : List<dynamic>.from(prChapter!.map((x) => x!.toJson())),
//         "PR_TEST_GENERATOR_DATA": prTestGeneratorData == null
//             ? []
//             : List<dynamic>.from(prTestGeneratorData!.map((x) => x.toJson())),
//       };
// }
//
// class PrChapter {
//   int? prChapterId;
//   String? prName;
//   String? prCode;
//   String? prIcon;
//   String? prDescription;
//   List<PrVideo>? prVideos;
//   List<PrQuestionType>? prQuestionType;
//
//   PrChapter({
//     this.prChapterId,
//     this.prName,
//     this.prCode,
//     this.prIcon,
//     this.prDescription,
//     this.prVideos,
//     this.prQuestionType,
//   });
//
//   factory PrChapter.fromJson(Map<String, dynamic> json) => PrChapter(
//         prChapterId: json["PR_CHAPTER_ID"],
//         prName: json["PR_NAME"],
//         prCode: json["PR_CODE"],
//         prIcon: json["PR_ICON"],
//         prDescription: json["PR_DESCRIPTION"],
//         prVideos: json["PR_VIDEOS"] == null
//             ? []
//             : List<PrVideo>.from(
//                 json["PR_VIDEOS"]!.map((x) => PrVideo.fromJson(x))),
//         prQuestionType: json["PR_QUESTION_TYPE"] == null
//             ? []
//             : List<PrQuestionType>.from(json["PR_QUESTION_TYPE"]!
//                 .map((x) => PrQuestionType.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_CHAPTER_ID": prChapterId,
//         "PR_NAME": prName,
//         "PR_CODE": prCode,
//         "PR_ICON": prIcon,
//         "PR_DESCRIPTION": prDescription,
//         "PR_VIDEOS": prVideos == null
//             ? []
//             : List<dynamic>.from(prVideos!.map((x) => x.toJson())),
//         "PR_QUESTION_TYPE": prQuestionType == null
//             ? []
//             : List<dynamic>.from(prQuestionType!.map((x) => x.toJson())),
//       };
// }
//
//
// class PrQuestionType {
//   int? prQuestionTypeId;
//   PrName? prName;
//   String? prCode;
//   String? prIcon;
//   String? prDescription;
//   List<PrQuestion>? prQuestions;
//
//   PrQuestionType({
//     this.prQuestionTypeId,
//     this.prName,
//     this.prCode,
//     this.prIcon,
//     this.prDescription,
//     this.prQuestions,
//   });
//
//   factory PrQuestionType.fromJson(Map<String, dynamic> json) => PrQuestionType(
//         prQuestionTypeId: json["PR_QUESTION_TYPE_ID"],
//         prName: prNameValues.map[json["PR_NAME"]]!,
//         prCode: json["PR_CODE"],
//         prIcon: json["PR_ICON"],
//         prDescription: json["PR_DESCRIPTION"],
//         prQuestions: json["PR_QUESTIONS"] == null
//             ? []
//             : List<PrQuestion>.from(
//                 json["PR_QUESTIONS"]!.map((x) => PrQuestion.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_QUESTION_TYPE_ID": prQuestionTypeId,
//         "PR_NAME": prNameValues.reverse[prName],
//         "PR_CODE": prCode,
//         "PR_ICON": prIcon,
//         "PR_DESCRIPTION": prDescription,
//         "PR_QUESTIONS": prQuestions == null
//             ? []
//             : List<dynamic>.from(prQuestions!.map((x) => x.toJson())),
//       };
// }
//
// enum PrName {
//   CIRCLE_THE_FOLLOWING,
//   FILL_IN_THE_BLANK,
//   LONG_ANSWER_TYPE_QUESTIONS,
//   MATCH_THE_FOLLOWING,
//   MISCELLANEOUS,
//   MULTIPLE_CHOICE_QUESTIONS,
//   SHORT_ANSWER_TYPE_QUESTIONS,
//   TRUE_AND_FALSE,
//   UNDERLINE_THE_FOLLOWING
// }
//
// final prNameValues = EnumValues({
//   "CIRCLE THE FOLLOWING": PrName.CIRCLE_THE_FOLLOWING,
//   "FILL IN THE BLANK": PrName.FILL_IN_THE_BLANK,
//   "LONG ANSWER TYPE QUESTIONS": PrName.LONG_ANSWER_TYPE_QUESTIONS,
//   "MATCH THE FOLLOWING": PrName.MATCH_THE_FOLLOWING,
//   "MISCELLANEOUS": PrName.MISCELLANEOUS,
//   "MULTIPLE CHOICE QUESTIONS": PrName.MULTIPLE_CHOICE_QUESTIONS,
//   "SHORT ANSWER TYPE QUESTIONS": PrName.SHORT_ANSWER_TYPE_QUESTIONS,
//   "TRUE AND FALSE": PrName.TRUE_AND_FALSE,
//   "UNDERLINE THE FOLLOWING": PrName.UNDERLINE_THE_FOLLOWING
// });
//
// class PrQuestion {
//   String? prQuestion;
//   String? prQuestionImg;
//   String? prDescription;
//   String? prFirstOption;
//   String? prSecondOption;
//   String? prThirdOption;
//   String? prForthOption;
//   String? prAnswer;
//
//   PrQuestion({
//     this.prQuestion,
//     this.prQuestionImg,
//     this.prDescription,
//     this.prFirstOption,
//     this.prSecondOption,
//     this.prThirdOption,
//     this.prForthOption,
//     this.prAnswer,
//   });
//
//   factory PrQuestion.fromJson(Map<String, dynamic> json) => PrQuestion(
//         prQuestion: json["PR_QUESTION"],
//         prQuestionImg: json["PR_QUESTION_IMG"],
//         prDescription: json["PR_DESCRIPTION"],
//         prFirstOption: json["PR_FIRST_OPTION"],
//         prSecondOption: json["PR_SECOND_OPTION"],
//         prThirdOption: json["PR_THIRD_OPTION"],
//         prForthOption: json["PR_FORTH_OPTION"],
//         prAnswer: json["PR_ANSWER"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_QUESTION": prQuestion,
//         "PR_QUESTION_IMG": prQuestionImg,
//         "PR_DESCRIPTION": prDescription,
//         "PR_FIRST_OPTION": prFirstOption,
//         "PR_SECOND_OPTION": prSecondOption,
//         "PR_THIRD_OPTION": prThirdOption,
//         "PR_FORTH_OPTION": prForthOption,
//         "PR_ANSWER": prAnswer,
//       };
// }
//
class PrVideo {
  int? prVideoId;
  String? prName;
  String? prVideoUrl;
  String? prDescription;
  String? prType;
  String? prIcon;

  PrVideo({
    this.prVideoId,
    this.prName,
    this.prVideoUrl,
    this.prDescription,
    this.prType,
    this.prIcon,
  });

  factory PrVideo.fromJson(Map<String, dynamic> json) => PrVideo(
        prVideoId: json["PR_VIDEO_ID"],
        prName: json["PR_NAME"],
        prVideoUrl: json["PR_VIDEO_URL"],
        prDescription: json["PR_DESCRIPTION"],
        prType: json["PR_TYPE"],
        prIcon: json["PR_ICON"],
      );

  Map<String, dynamic> toJson() => {
        "PR_VIDEO_ID": prVideoId,
        "PR_NAME": prName,
        "PR_VIDEO_URL": prVideoUrl,
        "PR_DESCRIPTION": prDescription,
        "PR_TYPE": prType,
        "PR_ICON": prIcon,
      };
}
//
//
// class PrFlashCard {
//   int? prFlashCardId;
//   String? prImgPath;
//
//   PrFlashCard({
//     this.prFlashCardId,
//     this.prImgPath,
//   });
//
//   factory PrFlashCard.fromJson(Map<String, dynamic> json) => PrFlashCard(
//         prFlashCardId: json["PR_FLASH_CARD_ID"],
//         prImgPath: json["PR_IMG_PATH"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_FLASH_CARD_ID": prFlashCardId,
//         "PR_IMG_PATH": prImgPath,
//       };
// }
//
// class PrPdf {
//   int? prPdfId;
//   String? prName;
//   String? prPdfFile;
//   String? prDescription;
//   String? prType;
//
//   PrPdf({
//     this.prPdfId,
//     this.prName,
//     this.prPdfFile,
//     this.prDescription,
//     this.prType,
//   });
//
//   factory PrPdf.fromJson(Map<String, dynamic> json) => PrPdf(
//         prPdfId: json["PR_PDF_ID"],
//         prName: json["PR_NAME"],
//         prPdfFile: json["PR_PDF_FILE"],
//         prDescription: json["PR_DESCRIPTION"],
//         prType: json["PR_TYPE"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_PDF_ID": prPdfId,
//         "PR_NAME": prName,
//         "PR_PDF_FILE": prPdfFile,
//         "PR_DESCRIPTION": prDescription,
//         "PR_TYPE": prType,
//       };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
//
// class VideoDataModel {
//   int? prChapterId;
//   String? prName;
//   int? prCode;
//   String? prIcon;
//   String? prDescription;
//   PrVideoModel? prVideo;
//   List<dynamic>? prTopic;
//
//   VideoDataModel({
//     this.prChapterId,
//     this.prName,
//     this.prCode,
//     this.prIcon,
//     this.prDescription,
//     this.prVideo,
//     this.prTopic,
//   });
//
//   factory VideoDataModel.fromJson(Map<String, dynamic> json) => VideoDataModel(
//         prChapterId: json["PR_CHAPTER_ID"] ?? 0,
//         prName: json["PR_NAME"] ?? "",
//         // prCode: json["PR_CODE"] ?? 0,
//         prIcon: json["PR_ICON"] ?? "",
//         prDescription: json["PR_DESCRIPTION"] ?? "",
//         prVideo: json["PR_VIDEO"] == null
//             ? null
//             : PrVideoModel.fromJson(json["PR_VIDEO"]),
//         prTopic: json["PR_TOPIC"] == null
//             ? []
//             : List<dynamic>.from(json["PR_TOPIC"]!.map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_CHAPTER_ID": prChapterId,
//         "PR_NAME": prName,
//         // "PR_CODE": prCode,
//         "PR_ICON": prIcon,
//         "PR_DESCRIPTION": prDescription,
//         "PR_VIDEO": prVideo?.toJson(),
//         "PR_TOPIC":
//             prTopic == null ? [] : List<dynamic>.from(prTopic!.map((x) => x)),
//       };
// }
//
// class PrVideoModel {
//   int? prVideoId;
//   String? prName;
//   String? prVideoUrl;
//   String? prDescription;
//   String? prIcon;
//
//   PrVideoModel({
//     this.prVideoId,
//     this.prName,
//     this.prVideoUrl,
//     this.prDescription,
//     this.prIcon,
//   });
//
//   factory PrVideoModel.fromJson(Map<String, dynamic> json) => PrVideoModel(
//         prVideoId: json["PR_VIDEO_ID"] ?? 0,
//         prName: json["PR_NAME"] ?? "",
//         prVideoUrl: json["PR_VIDEO_URL"] ?? "",
//         prDescription: json["PR_DESCRIPTION"] ?? "",
//         prIcon: json["PR_ICON"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "PR_VIDEO_ID": prVideoId,
//         "PR_NAME": prName,
//         "PR_VIDEO_URL": prVideoUrl,
//         "PR_DESCRIPTION": prDescription,
//         "PR_ICON": prIcon,
//       };
// }
//
//
// class ActivityData {
//   int? prChapterId;
//   String? prName;
//   String? prCode;
//   String? prIcon;
//   String? prDescription;
//   List<PrActivityType>? prActivityType;
//
//   ActivityData({
//     this.prChapterId,
//     this.prName,
//     this.prCode,
//     this.prIcon,
//     this.prDescription,
//     this.prActivityType,
//   });
//
//   factory ActivityData.fromJson(Map<String, dynamic> json) => ActivityData(
//     prChapterId: json["PR_CHAPTER_ID"]??0,
//     prName: json["PR_NAME"]??"",
//     prCode: json["PR_CODE"]??"",
//     prIcon: json["PR_ICON"]??"",
//     prDescription: json["PR_DESCRIPTION"]??"",
//     prActivityType: json["PR_ACTIVITY_TYPE"] == null ? [] : List<PrActivityType>.from(json["PR_ACTIVITY_TYPE"]!.map((x) => PrActivityType.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_CHAPTER_ID": prChapterId,
//     "PR_NAME": prName,
//     "PR_CODE": prCode,
//     "PR_ICON": prIcon,
//     "PR_DESCRIPTION": prDescription,
//     "PR_ACTIVITY_TYPE": prActivityType == null ? [] : List<dynamic>.from(prActivityType!.map((x) => x.toJson())),
//   };
// }
//
// class PrActivityType {
//   int? prTypeId;
//   String? prName;
//   String? prCode;
//   List<PrActivity>? prActivity;
//
//   PrActivityType({
//     this.prTypeId,
//     this.prName,
//     this.prCode,
//     this.prActivity,
//   });
//
//   factory PrActivityType.fromJson(Map<String, dynamic> json) => PrActivityType(
//     prTypeId: json["PR_TYPE_ID"]??0,
//     prName: json["PR_NAME"]??"",
//     prCode: json["PR_CODE"]??"",
//     prActivity: json["PR_ACTIVITY"] == null ? [] : List<PrActivity>.from(json["PR_ACTIVITY"]!.map((x) => PrActivity.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_TYPE_ID": prTypeId,
//     "PR_NAME": prName,
//     "PR_CODE": prCode,
//     "PR_ACTIVITY": prActivity == null ? [] : List<dynamic>.from(prActivity!.map((x) => x.toJson())),
//   };
// }
//
// class PrActivity {
//   int? prActivityId;
//   String? prActivityUrl;
//
//   PrActivity({
//     this.prActivityId,
//     this.prActivityUrl,
//   });
//
//   factory PrActivity.fromJson(Map<String, dynamic> json) => PrActivity(
//     prActivityId: json["PR_ACTIVITY_ID"]??0,
//     prActivityUrl: json["PR_ACTIVITY_URL"]??"",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_ACTIVITY_ID": prActivityId,
//     "PR_ACTIVITY_URL": prActivityUrl,
//   };
// }

// To parse this JSON data, do
//
//     final vcbTechModel = vcbTechModelFromJson(jsonString);

// import 'dart:convert';

// VcbTechModel vcbTechModelFromJson(String str) => VcbTechModel.fromJson(json.decode(str));
//
// String vcbTechModelToJson(VcbTechModel data) => json.encode(data.toJson());

class VcbTechModel {
  String? status;
  String? message;
  Data? data;

  VcbTechModel({
    this.status,
    this.message,
    this.data,
  });

  factory VcbTechModel.fromJson(Map<String, dynamic> json) => VcbTechModel(
        status: json["STATUS"],
        message: json["MESSAGE"],
        data: json["DATA"] == null ? null : Data.fromJson(json["DATA"]),
      );

  Map<String, dynamic> toJson() => {
        "STATUS": status,
        "MESSAGE": message,
        "DATA": data?.toJson(),
      };
}

class Data {
  int? prBookId;
  Pr? prCategory;
  Pr? prClass;
  Pr? prSubject;
  String? prName;
  String? prIcon;
  String? prDescription;
  List<dynamic>? prFlashCard;
  List<dynamic>? prPdfData;
  List<PrVideoDatum>? prVideoData;
  List<PrDatum>? prActivityData;
  List<PrChapter>? prTestGeneratorData;

  Data({
    this.prBookId,
    this.prCategory,
    this.prClass,
    this.prSubject,
    this.prName,
    this.prIcon,
    this.prDescription,
    this.prFlashCard,
    this.prPdfData,
    this.prVideoData,
    this.prActivityData,
    this.prTestGeneratorData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        prBookId: json["PR_BOOK_ID"],
        prCategory: json["PR_CATEGORY"] == null
            ? null
            : Pr.fromJson(json["PR_CATEGORY"]),
        prClass:
            json["PR_CLASS"] == null ? null : Pr.fromJson(json["PR_CLASS"]),
        prSubject:
            json["PR_SUBJECT"] == null ? null : Pr.fromJson(json["PR_SUBJECT"]),
        prName: json["PR_NAME"],
        prIcon: json["PR_ICON"],
        prDescription: json["PR_DESCRIPTION"],
        prFlashCard: json["PR_FLASH_CARD"] == null
            ? []
            : List<dynamic>.from(json["PR_FLASH_CARD"]!.map((x) => x)),
        prPdfData: json["PR_PDF_DATA"] == null
            ? []
            : List<dynamic>.from(json["PR_PDF_DATA"]!.map((x) => x)),
        prVideoData: json["PR_VIDEO_DATA"] == null
            ? []
            : List<PrVideoDatum>.from(
                json["PR_VIDEO_DATA"]!.map((x) => PrVideoDatum.fromJson(x))),
        prActivityData: json["PR_ACTIVITY_DATA"] == null
            ? []
            : List<PrDatum>.from(
                json["PR_ACTIVITY_DATA"]!.map((x) => PrDatum.fromJson(x))),
        prTestGeneratorData: json["PR_TEST_GENERATOR_DATA"] == null
            ? []
            : List<PrChapter>.from(json["PR_TEST_GENERATOR_DATA"]!
                .map((x) => PrChapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_CATEGORY": prCategory?.toJson(),
        "PR_CLASS": prClass?.toJson(),
        "PR_SUBJECT": prSubject?.toJson(),
        "PR_NAME": prName,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_FLASH_CARD": prFlashCard == null
            ? []
            : List<dynamic>.from(prFlashCard!.map((x) => x)),
        "PR_PDF_DATA": prPdfData == null
            ? []
            : List<dynamic>.from(prPdfData!.map((x) => x)),
        "PR_VIDEO_DATA": prVideoData == null
            ? []
            : List<dynamic>.from(prVideoData!.map((x) => x.toJson())),
        "PR_ACTIVITY_DATA": prActivityData == null
            ? []
            : List<dynamic>.from(prActivityData!.map((x) => x.toJson())),
        "PR_TEST_GENERATOR_DATA": prTestGeneratorData == null
            ? []
            : List<dynamic>.from(prTestGeneratorData!.map((x) => x.toJson())),
      };
}

class PrDatum {
  int? prChapterId;
  String? prName;
  PrIcon? prIcon;
  String? prDescription;
  List<PrActivityType>? prActivityType;
  List<PrQuestionType>? prQuestionType;

  PrDatum({
    this.prChapterId,
    this.prName,
    this.prIcon,
    this.prDescription,
    this.prActivityType,
    this.prQuestionType,
  });

  factory PrDatum.fromJson(Map<String, dynamic> json) => PrDatum(
        prChapterId: json["PR_CHAPTER_ID"],
        prName: json["PR_NAME"],
        prIcon: prIconValues.map[json["PR_ICON"]]!,
        prDescription: json["PR_DESCRIPTION"],
        prActivityType: json["PR_ACTIVITY_TYPE"] == null
            ? []
            : List<PrActivityType>.from(json["PR_ACTIVITY_TYPE"]!
                .map((x) => PrActivityType.fromJson(x))),
        prQuestionType: json["PR_QUESTION_TYPE"] == null
            ? []
            : List<PrQuestionType>.from(json["PR_QUESTION_TYPE"]!
                .map((x) => PrQuestionType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_CHAPTER_ID": prChapterId,
        "PR_NAME": prName,
        "PR_ICON": prIconValues.reverse[prIcon],
        "PR_DESCRIPTION": prDescription,
        "PR_ACTIVITY_TYPE": prActivityType == null
            ? []
            : List<dynamic>.from(prActivityType!.map((x) => x.toJson())),
        "PR_QUESTION_TYPE": prQuestionType == null
            ? []
            : List<dynamic>.from(prQuestionType!.map((x) => x.toJson())),
      };
}

class PrActivityType {
  int? prTypeId;
  PrActivityTypePrName? prName;
  String? prCode;
  List<dynamic>? prActivity;

  PrActivityType({
    this.prTypeId,
    this.prName,
    this.prCode,
    this.prActivity,
  });

  factory PrActivityType.fromJson(Map<String, dynamic> json) => PrActivityType(
        prTypeId: json["PR_TYPE_ID"],
        prName: prActivityTypePrNameValues.map[json["PR_NAME"]]!,
        prCode: json["PR_CODE"],
        prActivity: json["PR_ACTIVITY"] == null
            ? []
            : List<dynamic>.from(json["PR_ACTIVITY"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "PR_TYPE_ID": prTypeId,
        "PR_NAME": prActivityTypePrNameValues.reverse[prName],
        "PR_CODE": prCode,
        "PR_ACTIVITY": prActivity == null
            ? []
            : List<dynamic>.from(prActivity!.map((x) => x)),
      };
}

enum PrActivityTypePrName { FILL_IN_THE_BLANK, MATCH_PERFECT }

final prActivityTypePrNameValues = EnumValues({
  "Fill In The Blank": PrActivityTypePrName.FILL_IN_THE_BLANK,
  "Match Perfect": PrActivityTypePrName.MATCH_PERFECT
});

enum PrIcon { MEDIA_DEFAULT_IMG_PNG }

final prIconValues =
    EnumValues({"/media/default-img.png": PrIcon.MEDIA_DEFAULT_IMG_PNG});

class PrQuestionType {
  int? prQuestionTypeId;
  PrQuestionTypePrName? prName;
  String? prCode;
  PrIcon? prIcon;
  String? prDescription;
  List<dynamic>? prQuestions;

  PrQuestionType({
    this.prQuestionTypeId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prQuestions,
  });

  factory PrQuestionType.fromJson(Map<String, dynamic> json) => PrQuestionType(
        prQuestionTypeId: json["PR_QUESTION_TYPE_ID"],
        prName: prQuestionTypePrNameValues.map[json["PR_NAME"]]!,
        prCode: json["PR_CODE"],
        prIcon: prIconValues.map[json["PR_ICON"]]!,
        prDescription: json["PR_DESCRIPTION"],
        prQuestions: json["PR_QUESTIONS"] == null
            ? []
            : List<dynamic>.from(json["PR_QUESTIONS"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "PR_QUESTION_TYPE_ID": prQuestionTypeId,
        "PR_NAME": prQuestionTypePrNameValues.reverse[prName],
        "PR_CODE": prCode,
        "PR_ICON": prIconValues.reverse[prIcon],
        "PR_DESCRIPTION": prDescription,
        "PR_QUESTIONS": prQuestions == null
            ? []
            : List<dynamic>.from(prQuestions!.map((x) => x)),
      };
}

enum PrQuestionTypePrName {
  CIRCLE_THE_FOLLOWING,
  FILL_IN_THE_BLANK,
  LONG_ANSWER_TYPE_QUESTIONS,
  MATCH_THE_FOLLOWING,
  MISCELLANEOUS,
  MULTIPLE_CHOICE_QUESTIONS,
  SHORT_ANSWER_TYPE_QUESTIONS,
  TRUE_AND_FALSE,
  UNDERLINE_THE_FOLLOWING
}

final prQuestionTypePrNameValues = EnumValues({
  "CIRCLE THE FOLLOWING": PrQuestionTypePrName.CIRCLE_THE_FOLLOWING,
  "FILL IN THE BLANK": PrQuestionTypePrName.FILL_IN_THE_BLANK,
  "LONG ANSWER TYPE QUESTIONS": PrQuestionTypePrName.LONG_ANSWER_TYPE_QUESTIONS,
  "MATCH THE FOLLOWING": PrQuestionTypePrName.MATCH_THE_FOLLOWING,
  "MISCELLANEOUS": PrQuestionTypePrName.MISCELLANEOUS,
  "MULTIPLE CHOICE QUESTIONS": PrQuestionTypePrName.MULTIPLE_CHOICE_QUESTIONS,
  "SHORT ANSWER TYPE QUESTIONS":
      PrQuestionTypePrName.SHORT_ANSWER_TYPE_QUESTIONS,
  "TRUE AND FALSE": PrQuestionTypePrName.TRUE_AND_FALSE,
  "UNDERLINE THE FOLLOWING": PrQuestionTypePrName.UNDERLINE_THE_FOLLOWING
});

class Pr {
  int? prCategoryId;
  String? prName;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prClassId;
  int? prSubjectId;

  Pr({
    this.prCategoryId,
    this.prName,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prClassId,
    this.prSubjectId,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        prCategoryId: json["PR_CATEGORY_ID"],
        prName: json["PR_NAME"],
        prIcon: json["PR_ICON"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prClassId: json["PR_CLASS_ID"],
        prSubjectId: json["PR_SUBJECT_ID"],
      );

  Map<String, dynamic> toJson() => {
        "PR_CATEGORY_ID": prCategoryId,
        "PR_NAME": prName,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_CLASS_ID": prClassId,
        "PR_SUBJECT_ID": prSubjectId,
      };
}

class PrVideoDatum {
  int? prChapterId;
  String? prName;
  PrIcon? prIcon;
  String? prDescription;
  PrVideo? prVideo;
  List<dynamic>? prTopic;

  PrVideoDatum({
    this.prChapterId,
    this.prName,
    this.prIcon,
    this.prDescription,
    this.prVideo,
    this.prTopic,
  });

  factory PrVideoDatum.fromJson(Map<String, dynamic> json) => PrVideoDatum(
        prChapterId: json["PR_CHAPTER_ID"],
        prName: json["PR_NAME"],
        prIcon: prIconValues.map[json["PR_ICON"]]!,
        prDescription: json["PR_DESCRIPTION"],
        prVideo: json["PR_VIDEO"] == null
            ? null
            : PrVideo.fromJson(json["PR_VIDEO"]),
        prTopic: json["PR_TOPIC"] == null
            ? []
            : List<dynamic>.from(json["PR_TOPIC"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "PR_CHAPTER_ID": prChapterId,
        "PR_NAME": prName,
        "PR_ICON": prIconValues.reverse[prIcon],
        "PR_DESCRIPTION": prDescription,
        "PR_VIDEO": prVideo?.toJson(),
        "PR_TOPIC":
            prTopic == null ? [] : List<dynamic>.from(prTopic!.map((x) => x)),
      };
}

// class PrVideo {
//   PrVideo();
//
//   factory PrVideo.fromJson(Map<String, dynamic> json) => PrVideo(
//   );
//
//   Map<String, dynamic> toJson() => {
//   };
// }

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
