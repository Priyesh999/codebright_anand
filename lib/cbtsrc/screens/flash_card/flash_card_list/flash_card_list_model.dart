class FlashCardGridModel {
  int? prBookId;
  Pr? prCategory;
  Pr? prClass;
  Pr? prSubject;
  String? prName;
  String? prCode;
  String? prBookFile;
  dynamic prPrice;
  String? prQuantity;
  String? prIsbn;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  List<PrFlashCardDatum>? prFlashCardData;

  FlashCardGridModel({
    this.prBookId,
    this.prCategory,
    this.prClass,
    this.prSubject,
    this.prName,
    this.prCode,
    this.prBookFile,
    this.prPrice,
    this.prQuantity,
    this.prIsbn,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prFlashCardData,
  });

  factory FlashCardGridModel.fromJson(Map<String, dynamic> json) =>
      FlashCardGridModel(
        prBookId: json["PR_BOOK_ID"],
        prCategory: json["PR_CATEGORY"] == null
            ? null
            : Pr.fromJson(json["PR_CATEGORY"]),
        prClass:
            json["PR_CLASS"] == null ? null : Pr.fromJson(json["PR_CLASS"]),
        prSubject:
            json["PR_SUBJECT"] == null ? null : Pr.fromJson(json["PR_SUBJECT"]),
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prBookFile: json["PR_BOOK_FILE"],
        prPrice: json["PR_PRICE"],
        prQuantity: json["PR_QUANTITY"],
        prIsbn: json["PR_ISBN"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        // prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
        // prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
        prFlashCardData: json["PR_FLASH_CARD_DATA"] == null
            ? []
            : List<PrFlashCardDatum>.from(json["PR_FLASH_CARD_DATA"]!
                .map((x) => PrFlashCardDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_CATEGORY": prCategory?.toJson(),
        "PR_CLASS": prClass?.toJson(),
        "PR_SUBJECT": prSubject?.toJson(),
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_BOOK_FILE": prBookFile,
        "PR_PRICE": prPrice,
        "PR_QUANTITY": prQuantity,
        "PR_ISBN": prIsbn,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_FLASH_CARD_DATA": prFlashCardData == null
            ? []
            : List<dynamic>.from(prFlashCardData!.map((x) => x.toJson())),
      };
}

class Pr {
  int? prCategoryId;
  String? prName;
  String? prIconPath;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prClassId;
  int? prOrdered;
  int? prSubjectId;

  Pr({
    this.prCategoryId,
    this.prName,
    this.prIconPath,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prClassId,
    this.prOrdered,
    this.prSubjectId,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        prCategoryId: json["PR_CATEGORY_ID"],
        prName: json["PR_NAME"],
        prIconPath: json["PR_ICON_PATH"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prClassId: json["PR_CLASS_ID"],
        prOrdered: json["PR_ORDERED"],
        prSubjectId: json["PR_SUBJECT_ID"],
      );

  Map<String, dynamic> toJson() => {
        "PR_CATEGORY_ID": prCategoryId,
        "PR_NAME": prName,
        "PR_ICON_PATH": prIconPath,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_CLASS_ID": prClassId,
        "PR_ORDERED": prOrdered,
        "PR_SUBJECT_ID": prSubjectId,
      };
}

class PrFlashCardDatum {
  int? prFlashCardId;
  String? prImgPath;
  int? prStatus;

  // DateTime? prCreatedAt;
  // DateTime? prModifiedAt;
  int? prCategory;
  int? prBook;
  int? prPdf;

  PrFlashCardDatum({
    this.prFlashCardId = 0,
    this.prImgPath,
    this.prStatus,
    // this.prCreatedAt,
    // this.prModifiedAt,
    this.prCategory=0,
    this.prBook=0,
    this.prPdf=0,
  });

  factory PrFlashCardDatum.fromJson(Map<String, dynamic> json) =>
      PrFlashCardDatum(
        prFlashCardId: json["PR_FLASH_CARD_ID"],
        prImgPath: json["PR_IMG_PATH"],
        prStatus: json["PR_STATUS"],
        // prCreatedAt: json["PR_CREATED_AT"] == null ? null : DateTime.parse(json["PR_CREATED_AT"]),
        // prModifiedAt: json["PR_MODIFIED_AT"] == null ? null : DateTime.parse(json["PR_MODIFIED_AT"]),
        prCategory: json["PR_CATEGORY"],
        prBook: json["PR_BOOK"],
        prPdf: json["PR_PDF"],
      );

  Map<String, dynamic> toJson() => {
        "PR_FLASH_CARD_ID": prFlashCardId,
        "PR_IMG_PATH": prImgPath,
        "PR_STATUS": prStatus,
        // "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        // "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_CATEGORY": prCategory,
        "PR_BOOK": prBook,
        "PR_PDF": prPdf,
      };
}
