class DigiGyanRecentModel {
  List<PrPdfDatum>? prPdfData;
  List<PrVodeoDatum>? prVodeoData;

  DigiGyanRecentModel({
    this.prPdfData,
    this.prVodeoData,
  });

  factory DigiGyanRecentModel.fromJson(Map<String, dynamic> json) =>
      DigiGyanRecentModel(
        prPdfData: json["PR_PDF_DATA"] == null
            ? []
            : List<PrPdfDatum>.from(
                json["PR_PDF_DATA"]!.map((x) => PrPdfDatum.fromJson(x))),
        prVodeoData: json["PR_VODEO_DATA"] == null
            ? []
            : List<PrVodeoDatum>.from(
                json["PR_VODEO_DATA"]!.map((x) => PrVodeoDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_PDF_DATA": prPdfData == null
            ? []
            : List<dynamic>.from(prPdfData!.map((x) => x.toJson())),
        "PR_VODEO_DATA": prVodeoData == null
            ? []
            : List<dynamic>.from(prVodeoData!.map((x) => x.toJson())),
      };
}

class PrPdfDatum {
  int? prPdfId;
  Pr? prCategory;
  PrBook? prBook;
  String? prName;
  String? prPdfFile;
  String? prDescription;
  String? prType;
  bool? prIsFlash;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrPdfDatum({
    this.prPdfId,
    this.prCategory,
    this.prBook,
    this.prName,
    this.prPdfFile,
    this.prDescription,
    this.prType,
    this.prIsFlash,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrPdfDatum.fromJson(Map<String, dynamic> json) => PrPdfDatum(
        prPdfId: json["PR_PDF_ID"],
        prCategory: json["PR_CATEGORY"] == null
            ? null
            : Pr.fromJson(json["PR_CATEGORY"]),
        prBook:
            json["PR_BOOK"] == null ? null : PrBook.fromJson(json["PR_BOOK"]),
        prName: json["PR_NAME"],
        prPdfFile: json["PR_PDF_FILE"],
        prDescription: json["PR_DESCRIPTION"],
        prType: json["PR_TYPE"],
        prIsFlash: json["PR_IS_FLASH"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_PDF_ID": prPdfId,
        "PR_CATEGORY": prCategory?.toJson(),
        "PR_BOOK": prBook?.toJson(),
        "PR_NAME": prName,
        "PR_PDF_FILE": prPdfFile,
        "PR_DESCRIPTION": prDescription,
        "PR_TYPE": prType,
        "PR_IS_FLASH": prIsFlash,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class PrBook {
  int? prBookId;
  Pr? prClass;
  Pr? prSubject;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrBook({
    this.prBookId,
    this.prClass,
    this.prSubject,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrBook.fromJson(Map<String, dynamic> json) => PrBook(
        prBookId: json["PR_BOOK_ID"],
        prClass:
            json["PR_CLASS"] == null ? null : Pr.fromJson(json["PR_CLASS"]),
        prSubject:
            json["PR_SUBJECT"] == null ? null : Pr.fromJson(json["PR_SUBJECT"]),
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_CLASS": prClass?.toJson(),
        "PR_SUBJECT": prSubject?.toJson(),
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class Pr {
  int? prClassId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prSubjectId;
  int? prCategoryId;
  int? prChapterId;
  int? prBook;
  int? prTopicId;
  int? prChapter;

  Pr({
    this.prClassId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prSubjectId,
    this.prCategoryId,
    this.prChapterId,
    this.prBook,
    this.prTopicId,
    this.prChapter,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        prClassId: json["PR_CLASS_ID"],
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prIcon: json["PR_ICON"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prSubjectId: json["PR_SUBJECT_ID"],
        prCategoryId: json["PR_CATEGORY_ID"],
        prChapterId: json["PR_CHAPTER_ID"],
        prBook: json["PR_BOOK"],
        prTopicId: json["PR_TOPIC_ID"],
        prChapter: json["PR_CHAPTER"],
      );

  Map<String, dynamic> toJson() => {
        "PR_CLASS_ID": prClassId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIconValues.reverse[prIcon],
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_SUBJECT_ID": prSubjectId,
        "PR_CATEGORY_ID": prCategoryId,
        "PR_CHAPTER_ID": prChapterId,
        "PR_BOOK": prBook,
        "PR_TOPIC_ID": prTopicId,
        "PR_CHAPTER": prChapter,
      };
}

enum PrIcon {
  EMPTY,
  MEDIA_DEFAULT_IMG_PNG,
  MEDIA_FILE_DATA_TEXTBOOK_G_E6_JX3_Y_JPG
}

final prIconValues = EnumValues({
  "": PrIcon.EMPTY,
  "/media/default-img.png": PrIcon.MEDIA_DEFAULT_IMG_PNG,
  "/media/file-data/textbook_gE6Jx3Y.jpg":
      PrIcon.MEDIA_FILE_DATA_TEXTBOOK_G_E6_JX3_Y_JPG
});

class PrVodeoDatum {
  int? prVideoId;
  Pr? prCategory;
  PrBook? prBook;
  Pr? prChapter;
  Pr? prTopic;
  String? prName;
  String? prVideoUrl;
  String? prDescription;
  String? prType;
  String? prIcon;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrVodeoDatum({
    this.prVideoId,
    this.prCategory,
    this.prBook,
    this.prChapter,
    this.prTopic,
    this.prName,
    this.prVideoUrl,
    this.prDescription,
    this.prType,
    this.prIcon,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrVodeoDatum.fromJson(Map<String, dynamic> json) => PrVodeoDatum(
        prVideoId: json["PR_VIDEO_ID"],
        prCategory: json["PR_CATEGORY"] == null
            ? null
            : Pr.fromJson(json["PR_CATEGORY"]),
        prBook:
            json["PR_BOOK"] == null ? null : PrBook.fromJson(json["PR_BOOK"]),
        prChapter:
            json["PR_CHAPTER"] == null ? null : Pr.fromJson(json["PR_CHAPTER"]),
        prTopic:
            json["PR_TOPIC"] == null ? null : Pr.fromJson(json["PR_TOPIC"]),
        prName: json["PR_NAME"],
        prVideoUrl: json["PR_VIDEO_URL"],
        prDescription: json["PR_DESCRIPTION"],
        prType: json["PR_TYPE"],
        prIcon: json["PR_ICON"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_VIDEO_ID": prVideoId,
        "PR_CATEGORY": prCategory?.toJson(),
        "PR_BOOK": prBook?.toJson(),
        "PR_CHAPTER": prChapter?.toJson(),
        "PR_TOPIC": prTopic?.toJson(),
        "PR_NAME": prName,
        "PR_VIDEO_URL": prVideoUrl,
        "PR_DESCRIPTION": prDescription,
        "PR_TYPE": prType,
        "PR_ICON": prIcon,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
