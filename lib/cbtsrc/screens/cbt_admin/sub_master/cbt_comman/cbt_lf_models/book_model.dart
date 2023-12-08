import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/category_lf_model.dart';
import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/cbt_lf_models/class_model.dart';

class BookModel {
  BookModel({
    required this.prBookId,
    this.prCategory,
    required this.prClass,
    // required this.prSubject,
    required this.prName,
    required this.prCode,
    required this.prBookFile,
    this.prPrice,
    required this.prQuantity,
    required this.prIsbn,
    required this.prDescription,
    required this.prStatus,
  });

  int prBookId;

  // int? prCategory;
  CagtegoryModel? prCategory;
  ClassModel prClass;

  // SubjectModel prSubject;
  String prName;
  String prCode;
  String prBookFile;
  dynamic prPrice;
  String prQuantity;
  String prIsbn;
  String prDescription;
  int prStatus;

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        prBookId: json["PR_BOOK_ID"] ?? "",
        prCategory: json["PR_CATEGORY"] == null
            ? null
            : CagtegoryModel.fromJson(json["PR_CATEGORY"]),
        // prCategory:json["PR_CATEGORY"]??0,
        prClass: ClassModel.fromJson(json["PR_CLASS"]),
        // prSubject: SubjectModel.fromJson(json["PR_SUBJECT"]),
        prName: json["PR_NAME"] ?? "",
        prCode: json["PR_CODE"] ?? "",
        prBookFile: json["PR_ICON"] ?? "",
        prPrice: json["PR_PRICE"] ?? "",
        prQuantity: json["PR_QUANTITY"] ?? "",
        prIsbn: json["PR_ISBN"] ?? "",
        prDescription: json["PR_DESCRIPTION"] ?? "",
        prStatus: json["PR_STATUS"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_CATEGORY": prCategory!,
        "PR_CLASS": prClass.toJson(),
        // "PR_SUBJECT": prSubject.toJson(),
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_BOOK_FILE": prBookFile,
        "PR_PRICE": prPrice,
        "PR_QUANTITY": prQuantity,
        "PR_ISBN": prIsbn,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
      };
}
