class WatchListModel {
  int? prId;
  PrUser? prUser;
  Pr? prCategory;
  Pr? prClass;
  Pr? prSubject;
  PrBook? prBook;
  Pr? prChapter;
  Pr? prTopic;
  String? prName;
  String? prViewType;
  String? prViewUrl;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  WatchListModel({
    this.prId,
    this.prUser,
    this.prCategory,
    this.prClass,
    this.prSubject,
    this.prBook,
    this.prChapter,
    this.prTopic,
    this.prName,
    this.prViewType,
    this.prViewUrl,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory WatchListModel.fromJson(Map<String, dynamic> json) => WatchListModel(
        prId: json["PR_ID"],
        prUser:
            json["PR_USER"] == null ? null : PrUser.fromJson(json["PR_USER"]),
        prCategory: json["PR_CATEGORY"] == null
            ? null
            : Pr.fromJson(json["PR_CATEGORY"]),
        prClass:
            json["PR_CLASS"] == null ? null : Pr.fromJson(json["PR_CLASS"]),
        prSubject:
            json["PR_SUBJECT"] == null ? null : Pr.fromJson(json["PR_SUBJECT"]),
        prBook:
            json["PR_BOOK"] == null ? null : PrBook.fromJson(json["PR_BOOK"]),
        prChapter:
            json["PR_CHAPTER"] == null ? null : Pr.fromJson(json["PR_CHAPTER"]),
        prTopic:
            json["PR_TOPIC"] == null ? null : Pr.fromJson(json["PR_TOPIC"]),
        prName: json["PR_NAME"],
        prViewType: json["PR_VIEW_TYPE"],
        prViewUrl: json["PR_VIEW_URL"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_ID": prId,
        "PR_USER": prUser?.toJson(),
        "PR_CATEGORY": prCategory?.toJson(),
        "PR_CLASS": prClass?.toJson(),
        "PR_SUBJECT": prSubject?.toJson(),
        "PR_BOOK": prBook?.toJson(),
        "PR_CHAPTER": prChapter?.toJson(),
        "PR_TOPIC": prTopic?.toJson(),
        "PR_NAME": prName,
        "PR_VIEW_TYPE": prViewType,
        "PR_VIEW_URL": prViewUrl,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class PrBook {
  int? prBookId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prClass;
  int? prSubject;

  PrBook({
    this.prBookId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prClass,
    this.prSubject,
  });

  factory PrBook.fromJson(Map<String, dynamic> json) => PrBook(
        prBookId: json["PR_BOOK_ID"],
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
        prClass: json["PR_CLASS"],
        prSubject: json["PR_SUBJECT"],
      );

  Map<String, dynamic> toJson() => {
        "PR_BOOK_ID": prBookId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_CLASS": prClass,
        "PR_SUBJECT": prSubject,
      };
}

class Pr {
  int? prCategoryId;
  String? prName;
  String? prCode;
  String? prIcon;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prChapterId;
  int? prBook;
  int? prClassId;
  int? prSubjectId;
  int? prTopicId;
  int? prChapter;

  Pr({
    this.prCategoryId,
    this.prName,
    this.prCode,
    this.prIcon,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prChapterId,
    this.prBook,
    this.prClassId,
    this.prSubjectId,
    this.prTopicId,
    this.prChapter,
  });

  factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        prCategoryId: json["PR_CATEGORY_ID"],
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
        prChapterId: json["PR_CHAPTER_ID"],
        prBook: json["PR_BOOK"],
        prClassId: json["PR_CLASS_ID"],
        prSubjectId: json["PR_SUBJECT_ID"],
        prTopicId: json["PR_TOPIC_ID"],
        prChapter: json["PR_CHAPTER"],
      );

  Map<String, dynamic> toJson() => {
        "PR_CATEGORY_ID": prCategoryId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_ICON": prIcon,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_CHAPTER_ID": prChapterId,
        "PR_BOOK": prBook,
        "PR_CLASS_ID": prClassId,
        "PR_SUBJECT_ID": prSubjectId,
        "PR_TOPIC_ID": prTopicId,
        "PR_CHAPTER": prChapter,
      };
}

class PrUser {
  int? prUserId;
  PrSchool? prSchool;
  PrDepartment? prDepartment;
  PrDesignation? prDesignation;
  String? prName;
  String? prCode;
  String? prEmail;
  String? prPhone;
  String? prPassword;
  String? prDob;
  String? prGender;
  String? prAddress;
  String? prState;
  String? prPincode;
  String? prSaltKey;
  String? prToken;
  String? prFcmKey;
  String? prOtpTime;
  String? prProfilePic;
  String? prAboutMe;
  int? prIsActive;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrUser({
    this.prUserId,
    this.prSchool,
    this.prDepartment,
    this.prDesignation,
    this.prName,
    this.prCode,
    this.prEmail,
    this.prPhone,
    this.prPassword,
    this.prDob,
    this.prGender,
    this.prAddress,
    this.prState,
    this.prPincode,
    this.prSaltKey,
    this.prToken,
    this.prFcmKey,
    this.prOtpTime,
    this.prProfilePic,
    this.prAboutMe,
    this.prIsActive,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrUser.fromJson(Map<String, dynamic> json) => PrUser(
        prUserId: json["PR_USER_ID"],
        prSchool: json["PR_SCHOOL"] == null
            ? null
            : PrSchool.fromJson(json["PR_SCHOOL"]),
        prDepartment: json["PR_DEPARTMENT"] == null
            ? null
            : PrDepartment.fromJson(json["PR_DEPARTMENT"]),
        prDesignation: json["PR_DESIGNATION"] == null
            ? null
            : PrDesignation.fromJson(json["PR_DESIGNATION"]),
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prEmail: json["PR_EMAIL"],
        prPhone: json["PR_PHONE"],
        prPassword: json["PR_PASSWORD"],
        prDob: json["PR_DOB"],
        prGender: json["PR_GENDER"],
        prAddress: json["PR_ADDRESS"],
        prState: json["PR_STATE"],
        prPincode: json["PR_PINCODE"],
        prSaltKey: json["PR_SALT_KEY"],
        prToken: json["PR_TOKEN"],
        prFcmKey: json["PR_FCM_KEY"],
        prOtpTime: json["PR_OTP_TIME"],
        prProfilePic: json["PR_PROFILE_PIC"],
        prAboutMe: json["PR_ABOUT_ME"],
        prIsActive: json["PR_IS_ACTIVE"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_USER_ID": prUserId,
        "PR_SCHOOL": prSchool?.toJson(),
        "PR_DEPARTMENT": prDepartment?.toJson(),
        "PR_DESIGNATION": prDesignation?.toJson(),
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_EMAIL": prEmail,
        "PR_PHONE": prPhone,
        "PR_PASSWORD": prPassword,
        "PR_DOB": prDob,
        "PR_GENDER": prGender,
        "PR_ADDRESS": prAddress,
        "PR_STATE": prState,
        "PR_PINCODE": prPincode,
        "PR_SALT_KEY": prSaltKey,
        "PR_TOKEN": prToken,
        "PR_FCM_KEY": prFcmKey,
        "PR_OTP_TIME": prOtpTime,
        "PR_PROFILE_PIC": prProfilePic,
        "PR_ABOUT_ME": prAboutMe,
        "PR_IS_ACTIVE": prIsActive,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class PrDepartment {
  int? prDepartmentId;
  String? prName;
  String? prDesicription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrDepartment({
    this.prDepartmentId,
    this.prName,
    this.prDesicription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrDepartment.fromJson(Map<String, dynamic> json) => PrDepartment(
        prDepartmentId: json["PR_DEPARTMENT_ID"],
        prName: json["PR_NAME"],
        prDesicription: json["PR_DESICRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_DEPARTMENT_ID": prDepartmentId,
        "PR_NAME": prName,
        "PR_DESICRIPTION": prDesicription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

class PrDesignation {
  int? prDesignationId;
  String? prName;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prDepartment;

  PrDesignation({
    this.prDesignationId,
    this.prName,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prDepartment,
  });

  factory PrDesignation.fromJson(Map<String, dynamic> json) => PrDesignation(
        prDesignationId: json["PR_DESIGNATION_ID"],
        prName: json["PR_NAME"],
        prDescription: json["PR_DESCRIPTION"],
        prStatus: json["PR_STATUS"],
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prDepartment: json["PR_DEPARTMENT"],
      );

  Map<String, dynamic> toJson() => {
        "PR_DESIGNATION_ID": prDesignationId,
        "PR_NAME": prName,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
        "PR_DEPARTMENT": prDepartment,
      };
}

class PrSchool {
  int? prSchoolId;
  String? prName;
  String? prCode;
  String? prEmail;
  String? prPhone;
  String? prAddress;
  String? prCountry;
  String? prState;
  String? prCity;
  String? prPincode;
  String? prOwnerName;
  String? prOwnerEmail;
  String? prOwnerPhone;
  String? prGstNo;
  String? prCinNo;
  String? prEsiNo;
  String? prUanNo;
  String? prBankName;
  String? prBranchName;
  String? prAccountType;
  String? prAccountNo;
  String? prIfscCode;
  String? prToken;
  String? prLogo;
  String? prDescription;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;

  PrSchool({
    this.prSchoolId,
    this.prName,
    this.prCode,
    this.prEmail,
    this.prPhone,
    this.prAddress,
    this.prCountry,
    this.prState,
    this.prCity,
    this.prPincode,
    this.prOwnerName,
    this.prOwnerEmail,
    this.prOwnerPhone,
    this.prGstNo,
    this.prCinNo,
    this.prEsiNo,
    this.prUanNo,
    this.prBankName,
    this.prBranchName,
    this.prAccountType,
    this.prAccountNo,
    this.prIfscCode,
    this.prToken,
    this.prLogo,
    this.prDescription,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
  });

  factory PrSchool.fromJson(Map<String, dynamic> json) => PrSchool(
        prSchoolId: json["PR_SCHOOL_ID"],
        prName: json["PR_NAME"],
        prCode: json["PR_CODE"],
        prEmail: json["PR_EMAIL"],
        prPhone: json["PR_PHONE"],
        prAddress: json["PR_ADDRESS"],
        prCountry: json["PR_COUNTRY"],
        prState: json["PR_STATE"],
        prCity: json["PR_CITY"],
        prPincode: json["PR_PINCODE"],
        prOwnerName: json["PR_OWNER_NAME"],
        prOwnerEmail: json["PR_OWNER_EMAIL"],
        prOwnerPhone: json["PR_OWNER_PHONE"],
        prGstNo: json["PR_GST_NO"],
        prCinNo: json["PR_CIN_NO"],
        prEsiNo: json["PR_ESI_NO"],
        prUanNo: json["PR_UAN_NO"],
        prBankName: json["PR_BANK_NAME"],
        prBranchName: json["PR_BRANCH_NAME"],
        prAccountType: json["PR_ACCOUNT_TYPE"],
        prAccountNo: json["PR_ACCOUNT_NO"],
        prIfscCode: json["PR_IFSC_CODE"],
        prToken: json["PR_TOKEN"],
        prLogo: json["PR_LOGO"],
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
        "PR_SCHOOL_ID": prSchoolId,
        "PR_NAME": prName,
        "PR_CODE": prCode,
        "PR_EMAIL": prEmail,
        "PR_PHONE": prPhone,
        "PR_ADDRESS": prAddress,
        "PR_COUNTRY": prCountry,
        "PR_STATE": prState,
        "PR_CITY": prCity,
        "PR_PINCODE": prPincode,
        "PR_OWNER_NAME": prOwnerName,
        "PR_OWNER_EMAIL": prOwnerEmail,
        "PR_OWNER_PHONE": prOwnerPhone,
        "PR_GST_NO": prGstNo,
        "PR_CIN_NO": prCinNo,
        "PR_ESI_NO": prEsiNo,
        "PR_UAN_NO": prUanNo,
        "PR_BANK_NAME": prBankName,
        "PR_BRANCH_NAME": prBranchName,
        "PR_ACCOUNT_TYPE": prAccountType,
        "PR_ACCOUNT_NO": prAccountNo,
        "PR_IFSC_CODE": prIfscCode,
        "PR_TOKEN": prToken,
        "PR_LOGO": prLogo,
        "PR_DESCRIPTION": prDescription,
        "PR_STATUS": prStatus,
        "PR_CREATED_AT": prCreatedAt?.toIso8601String(),
        "PR_MODIFIED_AT": prModifiedAt?.toIso8601String(),
      };
}

enum TypeScreen { CBT_VIDEO, CBT_PDF, CBT_FLIP, CBT_SIMULATION }
