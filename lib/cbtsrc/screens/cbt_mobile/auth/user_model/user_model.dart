//
//
// class UserModel {
//   UserModel({
//     this.prEmployeeId,
//     this.prEmployeeCode,
//     this.prName,
//     this.prCompany,
//     this.prDepartment,
//     this.prDesignation,
//     this.prReportingManager,
//     this.prEmail,
//     this.prCompanyEmail,
//     this.prPhone,
//     this.prPassword,
//     this.prPasswordHint,
//     this.prPin,
//     this.prImei,
//     this.prPhoneBrand,
//     this.prOs,
//     this.prAppVersion,
//     this.prBattery,
//     this.prToken,
//     this.prLocation,
//     this.prQrCode,
//     this.prQrCodeText,
//     this.prBarcode,
//     this.prBarcodeText,
//     this.prStatus,
//     this.prCreatedAt,
//     this.prUpdatedAt,
//     this.prEmployeeDetails,
//     this.prParsentAddress,
//     this.prPermanentAddress,
//   });
//
//   int? prEmployeeId;
//   String? prEmployeeCode;
//   String? prName;
//   PrCompany? prCompany;
//   int? prDepartment;
//   int? prDesignation;
//   int? prReportingManager;
//   String? prEmail;
//   String? prCompanyEmail;
//   String? prPhone;
//   String? prPassword;
//   String? prPasswordHint;
//   String? prPin;
//   String? prImei;
//   String? prPhoneBrand;
//   String? prOs;
//   String? prAppVersion;
//   String? prBattery;
//   String? prToken;
//   String? prLocation;
//   String? prQrCode;
//   String? prQrCodeText;
//   String? prBarcode;
//   String? prBarcodeText;
//   String? prStatus;
//   DateTime? prCreatedAt;
//   DateTime? prUpdatedAt;
//   PrEmployeeDetails? prEmployeeDetails;
//   PrPentAddress? prParsentAddress;
//   PrPentAddress? prPermanentAddress;
//
//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     prEmployeeId: json["PR_EMPLOYEE_ID"],
//     prEmployeeCode: json["PR_EMPLOYEE_CODE"],
//     prName: json["PR_NAME"],
//     prCompany: PrCompany.fromJson(json["PR_COMPANY"]),
//     prDepartment: json["PR_DEPARTMENT"],
//     prDesignation: json["PR_DESIGNATION"],
//     prReportingManager: json["PR_REPORTING_MANAGER"],
//     prEmail: json["PR_EMAIL"],
//     prCompanyEmail: json["PR_COMPANY_EMAIL"],
//     prPhone: json["PR_PHONE"],
//     prPassword: json["PR_PASSWORD"],
//     prPasswordHint: json["PR_PASSWORD_Hint"],
//     prPin: json["PR_PIN"],
//     prImei: json["PR_IMEI"],
//     prPhoneBrand: json["PR_PHONE_BRAND"],
//     prOs: json["PR_OS"],
//     prAppVersion: json["PR_APP_VERSION"],
//     prBattery: json["PR_BATTERY"],
//     prToken: json["PR_TOKEN"],
//     prLocation: json["PR_LOCATION"],
//     prQrCode: json["PR_QR_CODE"],
//     prQrCodeText: json["PR_QR_CODE_TEXT"],
//     prBarcode: json["PR_BARCODE"],
//     prBarcodeText: json["PR_BARCODE_TEXT"],
//     prStatus: json["PR_STATUS"],
//     prCreatedAt: DateTime.parse(json["PR_CREATED_AT"]),
//     prUpdatedAt: DateTime.parse(json["PR_UPDATED_AT"]),
//     prEmployeeDetails: PrEmployeeDetails.fromJson(json["PR_EMPLOYEE_DETAILS"]),
//     prParsentAddress: PrPentAddress.fromJson(json["PR_PARSENT_ADDRESS"]),
//     prPermanentAddress: PrPentAddress.fromJson(json["PR_PERMANENT_ADDRESS"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_EMPLOYEE_ID": prEmployeeId,
//     "PR_EMPLOYEE_CODE": prEmployeeCode,
//     "PR_NAME": prName,
//     "PR_COMPANY": prCompany!.toJson(),
//     "PR_DEPARTMENT": prDepartment,
//     "PR_DESIGNATION": prDesignation,
//     "PR_REPORTING_MANAGER": prReportingManager,
//     "PR_EMAIL": prEmail,
//     "PR_COMPANY_EMAIL": prCompanyEmail,
//     "PR_PHONE": prPhone,
//     "PR_PASSWORD": prPassword,
//     "PR_PASSWORD_Hint": prPasswordHint,
//     "PR_PIN": prPin,
//     "PR_IMEI": prImei,
//     "PR_PHONE_BRAND": prPhoneBrand,
//     "PR_OS": prOs,
//     "PR_APP_VERSION": prAppVersion,
//     "PR_BATTERY": prBattery,
//     "PR_TOKEN": prToken,
//     "PR_LOCATION": prLocation,
//     "PR_QR_CODE": prQrCode,
//     "PR_QR_CODE_TEXT": prQrCodeText,
//     "PR_BARCODE": prBarcode,
//     "PR_BARCODE_TEXT": prBarcodeText,
//     "PR_STATUS": prStatus,
//     "PR_CREATED_AT": prCreatedAt!.toIso8601String(),
//     "PR_UPDATED_AT": prUpdatedAt!.toIso8601String(),
//     "PR_EMPLOYEE_DETAILS": prEmployeeDetails!.toJson(),
//     "PR_PARSENT_ADDRESS": prParsentAddress!.toJson(),
//     "PR_PERMANENT_ADDRESS": prPermanentAddress!.toJson(),
//   };
// }
//
// class PrCompany {
//   PrCompany({
//     this.prCompanyId,
//     this.prCompanyCode,
//     this.prCompanyName,
//   });
//
//   int? prCompanyId;
//   String? prCompanyCode;
//   String? prCompanyName;
//
//   factory PrCompany.fromJson(Map<String, dynamic> json) => PrCompany(
//     prCompanyId: json["PR_COMPANY_ID"],
//     prCompanyCode: json["PR_COMPANY_CODE"],
//     prCompanyName: json["PR_COMPANY_NAME"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "PR_COMPANY_ID": prCompanyId,
//     "PR_COMPANY_CODE": prCompanyCode,
//     "PR_COMPANY_NAME": prCompanyName,
//   };
// }
//
//
//
//
//
//
//
//
// class PrEmployeeDetails {
//   PrEmployeeDetails({
//     this.id,
//     this.prSaltKey,
//     this.prBloodGroup,
//     this.prGender,
//     this.prHeight,
//     this.prBodyMark,
//     this.prLanguage,
//     this.prImage,
//     this.prReligion,
//     this.prCategory,
//     this.prQualification,
//     this.prMariedStatus,
//     this.prDob,
//     this.prMariageDate,
//     this.prEmergencyContactNo,
//     this.prPancard,
//     this.prPancardFile,
//     this.prAadharCard,
//     this.prAadharCardFile,
//     this.prDrivingLicenceNo,
//     this.prDrivingLicenceFile,
//     this.prPassportNo,
//     this.prPassportFile,
//     this.prPfApplicableInLast,
//     this.prPfNo,
//     this.prEsiApplicableInLast,
//     this.prEsiNo,
//     this.prUanNo,
//     this.prBankAccountNo,
//     this.prIfscCode,
//     this.prBankName,
//     this.prBranchName,
//     this.prAccountType,
//     this.prDateOfJoining,
//     this.prProbationalDate,
//     this.prProbationalNoOfDays,
//     this.prSignature,
//     this.prSpecialization,
//     this.prStatus,
//     this.prCreatedAt,
//     this.prModifiedAt,
//     this.prEmployee,
//   });
//
//   int? id;
//   String? prSaltKey;
//   String? prBloodGroup;
//   String? prGender;
//   String? prHeight;
//   String? prBodyMark;
//   String? prLanguage;
//   String? prImage;
//   String? prReligion;
//   String? prCategory;
//   String? prQualification;
//   String? prMariedStatus;
//   dynamic? prDob;
//   dynamic? prMariageDate;
//   String? prEmergencyContactNo;
//   String? prPancard;
//   String? prPancardFile;
//   String? prAadharCard;
//   String? prAadharCardFile;
//   String? prDrivingLicenceNo;
//   String? prDrivingLicenceFile;
//   String? prPassportNo;
//   String? prPassportFile;
//   String? prPfApplicableInLast;
//   String? prPfNo;
//   String? prEsiApplicableInLast;
//   String? prEsiNo;
//   String? prUanNo;
//   String? prBankAccountNo;
//   String? prIfscCode;
//   String? prBankName;
//   String? prBranchName;
//   String? prAccountType;
//   String? prDateOfJoining;
//   String? prProbationalDate;
//   String? prProbationalNoOfDays;
//   String? prSignature;
//   String? prSpecialization;
//   String? prStatus;
//   DateTime? prCreatedAt;
//   DateTime? prModifiedAt;
//   int? prEmployee;
//
//   factory PrEmployeeDetails.fromJson(Map<String, dynamic> json) => PrEmployeeDetails(
//     id: json["id"],
//     prSaltKey: json["PR_SALT_KEY"],
//     prBloodGroup: json["PR_BLOOD_GROUP"],
//     prGender: json["PR_GENDER"],
//     prHeight: json["PR_HEIGHT"],
//     prBodyMark: json["PR_BODY_MARK"],
//     prLanguage: json["PR_LANGUAGE"],
//     prImage: json["PR_IMAGE"],
//     prReligion: json["PR_RELIGION"],
//     prCategory: json["PR_CATEGORY"],
//     prQualification: json["PR_QUALIFICATION"],
//     prMariedStatus: json["PR_MARIED_STATUS"],
//     prDob: json["PR_DOB"],
//     prMariageDate: json["PR_MARIAGE_DATE"],
//     prEmergencyContactNo: json["PR_EMERGENCY_CONTACT_NO"],
//     prPancard: json["PR_PANCARD"],
//     prPancardFile: json["PR_PANCARD_FILE"],
//     prAadharCard: json["PR_AADHAR_CARD"],
//     prAadharCardFile: json["PR_AADHAR_CARD_FILE"],
//     prDrivingLicenceNo: json["PR_DRIVING_LICENCE_NO"],
//     prDrivingLicenceFile: json["PR_DRIVING_LICENCE_FILE"],
//     prPassportNo: json["PR_PASSPORT_NO"],
//     prPassportFile: json["PR_PASSPORT_FILE"],
//     prPfApplicableInLast: json["PR_PF_APPLICABLE_IN_LAST"],
//     prPfNo: json["PR_PF_NO"],
//     prEsiApplicableInLast: json["PR_ESI_APPLICABLE_IN_LAST"],
//     prEsiNo: json["PR_ESI_NO"],
//     prUanNo: json["PR_UAN_NO"],
//     prBankAccountNo: json["PR_BANK_ACCOUNT_NO"],
//     prIfscCode: json["PR_IFSC_CODE"],
//     prBankName: json["PR_BANK_NAME"],
//     prBranchName: json["PR_BRANCH_NAME"],
//     prAccountType: json["PR_ACCOUNT_TYPE"],
//     prDateOfJoining: json["PR_DATE_OF_JOINING"],
//     prProbationalDate: json["PR_PROBATIONAL_DATE"],
//     prProbationalNoOfDays: json["PR_PROBATIONAL_NO_OF_DAYS"],
//     prSignature: json["PR_SIGNATURE"],
//     prSpecialization: json["PR_SPECIALIZATION"],
//     prStatus: json["PR_STATUS"],
//     prCreatedAt: DateTime.parse(json["PR_CREATED_AT"]),
//     prModifiedAt: DateTime.parse(json["PR_MODIFIED_AT"]),
//     prEmployee: json["PR_EMPLOYEE"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "PR_SALT_KEY": prSaltKey,
//     "PR_BLOOD_GROUP": prBloodGroup,
//     "PR_GENDER": prGender,
//     "PR_HEIGHT": prHeight,
//     "PR_BODY_MARK": prBodyMark,
//     "PR_LANGUAGE": prLanguage,
//     "PR_IMAGE": prImage,
//     "PR_RELIGION": prReligion,
//     "PR_CATEGORY": prCategory,
//     "PR_QUALIFICATION": prQualification,
//     "PR_MARIED_STATUS": prMariedStatus,
//     "PR_DOB": prDob,
//     "PR_MARIAGE_DATE": prMariageDate,
//     "PR_EMERGENCY_CONTACT_NO": prEmergencyContactNo,
//     "PR_PANCARD": prPancard,
//     "PR_PANCARD_FILE": prPancardFile,
//     "PR_AADHAR_CARD": prAadharCard,
//     "PR_AADHAR_CARD_FILE": prAadharCardFile,
//     "PR_DRIVING_LICENCE_NO": prDrivingLicenceNo,
//     "PR_DRIVING_LICENCE_FILE": prDrivingLicenceFile,
//     "PR_PASSPORT_NO": prPassportNo,
//     "PR_PASSPORT_FILE": prPassportFile,
//     "PR_PF_APPLICABLE_IN_LAST": prPfApplicableInLast,
//     "PR_PF_NO": prPfNo,
//     "PR_ESI_APPLICABLE_IN_LAST": prEsiApplicableInLast,
//     "PR_ESI_NO": prEsiNo,
//     "PR_UAN_NO": prUanNo,
//     "PR_BANK_ACCOUNT_NO": prBankAccountNo,
//     "PR_IFSC_CODE": prIfscCode,
//     "PR_BANK_NAME": prBankName,
//     "PR_BRANCH_NAME": prBranchName,
//     "PR_ACCOUNT_TYPE": prAccountType,
//     "PR_DATE_OF_JOINING": prDateOfJoining,
//     "PR_PROBATIONAL_DATE": prProbationalDate,
//     "PR_PROBATIONAL_NO_OF_DAYS": prProbationalNoOfDays,
//     "PR_SIGNATURE": prSignature,
//     "PR_SPECIALIZATION": prSpecialization,
//     "PR_STATUS": prStatus,
//     "PR_CREATED_AT": prCreatedAt!.toIso8601String(),
//     "PR_MODIFIED_AT": prModifiedAt!.toIso8601String(),
//     "PR_EMPLOYEE": prEmployee,
//   };
// }
//
// class PrPentAddress {
//   PrPentAddress({
//     this.id,
//     this.prPincode,
//     this.prAddress,
//     this.prStatus,
//     this.prCreatedAt,
//     this.prUpdatedAt,
//     this.prEmployee,
//     this.prCountry,
//     this.prState,
//     this.prCity,
//   });
//
//   int? id;
//   String? prPincode;
//   String? prAddress;
//   String? prStatus;
//   DateTime? prCreatedAt;
//   DateTime? prUpdatedAt;
//   int? prEmployee;
//   dynamic? prCountry;
//   dynamic? prState;
//   dynamic? prCity;
//
//   factory PrPentAddress.fromJson(Map<String, dynamic> json) => PrPentAddress(
//     id: json["id"],
//     prPincode: json["PR_PINCODE"],
//     prAddress: json["PR_ADDRESS"],
//     prStatus: json["PR_STATUS"],
//     prCreatedAt: DateTime.parse(json["PR_CREATED_AT"]),
//     prUpdatedAt: DateTime.parse(json["PR_UPDATED_AT"]),
//     prEmployee: json["PR_EMPLOYEE"],
//     prCountry: json["PR_COUNTRY"],
//     prState: json["PR_STATE"],
//     prCity: json["PR_CITY"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "PR_PINCODE": prPincode,
//     "PR_ADDRESS": prAddress,
//     "PR_STATUS": prStatus,
//     "PR_CREATED_AT": prCreatedAt!.toIso8601String(),
//     "PR_UPDATED_AT": prUpdatedAt!.toIso8601String(),
//     "PR_EMPLOYEE": prEmployee,
//     "PR_COUNTRY": prCountry,
//     "PR_STATE": prState,
//     "PR_CITY": prCity,
//   };
// }

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';
//
// UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
//
// String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.prEmployeeId,
    this.prEmployeeCode,
    this.prName,
    this.prCompany,
    this.prDepartment,
    this.prDesignation,
    this.prReportingManager,
    this.prEmail,
    this.prCompanyEmail,
    this.prPhone,
    this.prPassword,
    this.prPasswordHint,
    this.prPin,
    this.prImei,
    this.prPhoneBrand,
    this.prOs,
    this.prAppVersion,
    this.prBattery,
    this.prToken,
    this.prLocation,
    this.prQrCode,
    this.prQrCodeText,
    this.prBarcode,
    this.prBarcodeText,
    this.prStatus,
    this.prCreatedAt,
    this.prUpdatedAt,
    this.prEmployeeDetails,
    this.prParsentAddress,
    this.prPermanentAddress,
    this.prViewPassword,
    this.userToken,
  });

  int? prEmployeeId;
  String? prEmployeeCode;
  String? prName;
  PrCompany? prCompany;
  PrDepartment? prDepartment;
  PrDesignation? prDesignation;
  int? prReportingManager;
  String? prEmail;
  String? prCompanyEmail;
  String? prPhone;
  String? prPassword;
  String? prPasswordHint;
  String? prPin;
  String? userToken;
  String? prImei;
  String? prPhoneBrand;
  String? prOs;
  String? prAppVersion;
  String? prBattery;
  String? prToken;
  String? prLocation;
  String? prQrCode;
  String? prQrCodeText;
  String? prViewPassword;
  String? prBarcode;
  String? prBarcodeText;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prUpdatedAt;
  PrEmployeeDetails? prEmployeeDetails;
  PrPentAddress? prParsentAddress;
  PrPentAddress? prPermanentAddress;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        prEmployeeId: json["PR_USER_ID"] ?? 0,
        prViewPassword: json["PR_VIEW_PASSWORD"] ?? "",
        prEmployeeCode: json["PR_EMPLOYEE_CODE"] ?? "",
        prName: json["PR_NAME"] ?? "",
        prCompany: json["PR_COMPANY"] == null
            ? null
            : PrCompany.fromJson(json["PR_COMPANY"]),
        prDepartment: json["PR_DEPARTMENT"] == null
            ? null
            : PrDepartment.fromJson(json["PR_DEPARTMENT"]),
        prDesignation: json["PR_DESIGNATION"] == null
            ? null
            : PrDesignation.fromJson(json["PR_DESIGNATION"]),
        prReportingManager: json["PR_REPORTING_MANAGER"] ?? 0,
        prEmail: json["PR_EMAIL"] ?? "",
        prCompanyEmail: json["PR_COMPANY_EMAIL"] ?? "",
        prPhone: json["PR_PHONE"] ?? "",
        prPassword: json["PR_PASSWORD"] ?? "",
        prPasswordHint: json["PR_PASSWORD_Hint"] ?? "",
        prPin: json["PR_PIN"] ?? "",
        prImei: json["PR_IMEI"] ?? "",
        prPhoneBrand: json["PR_PHONE_BRAND"] ?? "",
        prOs: json["PR_OS"] ?? "",
        prAppVersion: json["PR_APP_VERSION"] ?? "",
        prBattery: json["PR_BATTERY"] ?? "",
        prToken: json["PR_TOKEN"] ?? "",
        userToken: json["PR_TOKEN"] ?? "",
        prLocation: json["PR_LOCATION"] ?? "",
        prQrCode: json["PR_QR_CODE"] ?? "",
        prQrCodeText: json["PR_QR_CODE_TEXT"] ?? "",
        prBarcode: json["PR_BARCODE"] ?? "",
        prBarcodeText: json["PR_BARCODE_TEXT"] ?? "",
        prStatus: json["PR_STATUS"] ?? "",
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prUpdatedAt: json["PR_UPDATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_UPDATED_AT"]),
        prEmployeeDetails: json["PR_EMPLOYEE_DETAILS"] == null
            ? null
            : PrEmployeeDetails.fromJson(json["PR_EMPLOYEE_DETAILS"]),
        prParsentAddress: json["PR_PARSENT_ADDRESS"] == null
            ? null
            : PrPentAddress.fromJson(json["PR_PARSENT_ADDRESS"]),
        prPermanentAddress: json["PR_PERMANENT_ADDRESS"] == null
            ? null
            : PrPentAddress.fromJson(json["PR_PERMANENT_ADDRESS"]),
      );

  Map<String, dynamic> toJson() => {
        "PR_EMPLOYEE_ID": prEmployeeId ?? 0,
        "PR_EMPLOYEE_CODE": prEmployeeCode ?? "",
        "PR_NAME": prName ?? "",
        "PR_COMPANY": prCompany == null ? null : prCompany!.toJson(),
        "PR_DEPARTMENT": prDepartment == null ? null : prDepartment!.toJson(),
        "PR_DESIGNATION":
            prDesignation == null ? null : prDesignation!.toJson(),
        "PR_REPORTING_MANAGER": prReportingManager ?? 0,
        "PR_EMAIL": prEmail ?? "",
        "PR_COMPANY_EMAIL": prCompanyEmail ?? "",
        "PR_PHONE": prPhone ?? "",
        "PR_PASSWORD": prPassword ?? "",
        "PR_PASSWORD_Hint": prPasswordHint ?? "",
        "PR_PIN": prPin ?? "",
        "PR_IMEI": prImei ?? "",
        "PR_PHONE_BRAND": prPhoneBrand ?? "",
        "PR_OS": prOs ?? "",
        "PR_APP_VERSION": prAppVersion ?? "",
        "PR_BATTERY": prBattery ?? "",
        "PR_TOKEN": prToken ?? "",
        "PR_LOCATION": prLocation ?? "",
        "PR_QR_CODE": prQrCode ?? "",
        "PR_QR_CODE_TEXT": prQrCodeText ?? "",
        "PR_BARCODE": prBarcode ?? "",
        "PR_BARCODE_TEXT": prBarcodeText ?? "",
        "PR_STATUS": prStatus ?? "",
        "PR_CREATED_AT":
            prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
        "PR_UPDATED_AT":
            prUpdatedAt == null ? null : prUpdatedAt!.toIso8601String(),
        "PR_EMPLOYEE_DETAILS":
            prEmployeeDetails == null ? null : prEmployeeDetails!.toJson(),
        "PR_PARSENT_ADDRESS":
            prParsentAddress == null ? null : prParsentAddress!.toJson(),
        "PR_PERMANENT_ADDRESS":
            prPermanentAddress == null ? null : prPermanentAddress!.toJson(),
      };
}

class PrCompany {
  PrCompany({
    this.prCompanyId,
    this.prCompanyCode,
    this.prCompanyName,
    this.prCompanyEmail,
    this.prDatabase,
    this.prDbPassword,
    this.prDbUsername,
    this.prPassword,
    this.prPasswordHint,
    this.prPhone,
    this.prSaltKey,
    this.prToken,
    this.prUanNo,
    this.prModifiedBy,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prStatus,
  });

  int? prCompanyId;
  String? prCompanyCode;
  String? prCompanyName;
  String? prCompanyEmail;
  dynamic prDatabase;
  dynamic prDbPassword;
  dynamic prDbUsername;
  dynamic prPassword;
  dynamic prPasswordHint;
  dynamic prPhone;
  dynamic prSaltKey;
  dynamic prToken;
  dynamic prUanNo;
  String? prModifiedBy;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prStatus;

  factory PrCompany.fromJson(Map<String, dynamic> json) => PrCompany(
        prCompanyId: json["PR_COMPANY_ID"] ?? 0,
        prCompanyCode: json["PR_COMPANY_CODE"] ?? "",
        prCompanyName: json["PR_COMPANY_NAME"] ?? "",
        prCompanyEmail: json["PR_COMPANY_EMAIL"] ?? "",
        prDatabase: json["PR_DATABASE"],
        prDbPassword: json["PR_DB_PASSWORD"],
        prDbUsername: json["PR_DB_USERNAME"],
        prPassword: json["PR_PASSWORD"],
        prPasswordHint: json["PR_PASSWORD_HINT"],
        prPhone: json["PR_PHONE"],
        prSaltKey: json["PR_SALT_KEY"],
        prToken: json["PR_TOKEN"],
        prUanNo: json["PR_UAN_NO"],
        prModifiedBy: json["PR_MODIFIED_BY"] ?? "",
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prStatus: json["PR_STATUS"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PR_COMPANY_ID": prCompanyId ?? 0,
        "PR_COMPANY_CODE": prCompanyCode ?? "",
        "PR_COMPANY_NAME": prCompanyName ?? "",
        "PR_COMPANY_EMAIL": prCompanyEmail ?? "",
        "PR_DATABASE": prDatabase,
        "PR_DB_PASSWORD": prDbPassword,
        "PR_DB_USERNAME": prDbUsername,
        "PR_PASSWORD": prPassword,
        "PR_PASSWORD_HINT": prPasswordHint,
        "PR_PHONE": prPhone,
        "PR_SALT_KEY": prSaltKey,
        "PR_TOKEN": prToken,
        "PR_UAN_NO": prUanNo,
        "PR_MODIFIED_BY": prModifiedBy ?? "",
        "PR_CREATED_AT":
            prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
        "PR_MODIFIED_AT":
            prModifiedAt == null ? null : prModifiedAt!.toIso8601String(),
        "PR_STATUS": prStatus ?? "",
      };
}

class PrDepartment {
  PrDepartment({
    this.prDepartmentId,
    this.prDeptName,
    this.prDeptDesc,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prStatus,
  });

  int? prDepartmentId;
  String? prDeptName;
  String? prDeptDesc;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prStatus;

  factory PrDepartment.fromJson(Map<String, dynamic> json) => PrDepartment(
        prDepartmentId: json["PR_DEPARTMENT_ID"] ?? "",
        prDeptName: json["PR_DEPT_NAME"] ?? "",
        prDeptDesc: json["PR_DEPT_DESC"] ?? "",
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prStatus: json["PR_STATUS"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PR_DEPARTMENT_ID": prDepartmentId ?? "",
        "PR_DEPT_NAME": prDeptName ?? "",
        "PR_DEPT_DESC": prDeptDesc ?? "",
        "PR_CREATED_AT":
            prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
        "PR_MODIFIED_AT":
            prModifiedAt == null ? null : prModifiedAt!.toIso8601String(),
        "PR_STATUS": prStatus ?? "",
      };
}

class PrDesignation {
  PrDesignation({
    this.prDesignationId,
    this.prDesigName,
    this.prDesigDesc,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prStatus,
  });

  int? prDesignationId;
  String? prDesigName;
  String? prDesigDesc;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prStatus;

  factory PrDesignation.fromJson(Map<String, dynamic> json) => PrDesignation(
        prDesignationId: json["PR_DESIGNATION_ID"] ?? "",
        prDesigName: json["PR_DESIG_NAME"] ?? "",
        prDesigDesc: json["PR_DESIG_DESC"] ?? "",
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prStatus: json["PR_STATUS"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "PR_DESIGNATION_ID": prDesignationId ?? "",
        "PR_DESIG_NAME": prDesigName ?? "",
        "PR_DESIG_DESC": prDesigDesc ?? "",
        "PR_CREATED_AT":
            prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
        "PR_MODIFIED_AT":
            prModifiedAt == null ? null : prModifiedAt!.toIso8601String(),
        "PR_STATUS": prStatus ?? "",
      };
}

class PrEmployeeDetails {
  PrEmployeeDetails({
    this.id,
    this.prFatherName,
    this.prMotherName,
    this.prSaltKey,
    this.prBloodGroup,
    this.prGender,
    this.prHeight,
    this.prBodyMark,
    this.prLanguage,
    this.prImagePath,
    this.prReligion,
    this.prCategory,
    this.prQualification,
    this.prMariedStatus,
    this.prDob,
    this.prMariageDate,
    this.prEmergencyContactNo,
    this.prPancard,
    this.prPancardFile,
    this.prAadharCard,
    this.prAadharCardFile,
    this.prDrivingLicenceNo,
    this.prDrivingLicenceFile,
    this.prPassportNo,
    this.prPassportFile,
    this.prPfApplicableInLast,
    this.prPfNo,
    this.prEsiApplicableInLast,
    this.prEsiNo,
    this.prUanNo,
    this.prBankAccountNo,
    this.prIfscCode,
    this.prBankName,
    this.prBranchName,
    this.prAccountType,
    this.prDateOfJoining,
    this.prProbationalDate,
    this.prProbationalNoOfDays,
    this.prSignature,
    this.prSpecialization,
    this.prStatus,
    this.prCreatedAt,
    this.prModifiedAt,
    this.prEmployee,
  });

  int? id;
  String? prFatherName;
  String? prMotherName;
  String? prSaltKey;
  String? prBloodGroup;
  String? prGender;
  String? prHeight;
  String? prBodyMark;
  String? prLanguage;
  String? prImagePath;
  String? prReligion;
  String? prCategory;
  String? prQualification;
  String? prMariedStatus;
  dynamic prDob;
  dynamic prMariageDate;
  String? prEmergencyContactNo;
  String? prPancard;
  String? prPancardFile;
  String? prAadharCard;
  String? prAadharCardFile;
  String? prDrivingLicenceNo;
  String? prDrivingLicenceFile;
  String? prPassportNo;
  String? prPassportFile;
  String? prPfApplicableInLast;
  String? prPfNo;
  String? prEsiApplicableInLast;
  String? prEsiNo;
  String? prUanNo;
  String? prBankAccountNo;
  String? prIfscCode;
  String? prBankName;
  String? prBranchName;
  String? prAccountType;
  String? prDateOfJoining;
  String? prProbationalDate;
  String? prProbationalNoOfDays;
  String? prSignature;
  String? prSpecialization;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prModifiedAt;
  int? prEmployee;

  factory PrEmployeeDetails.fromJson(Map<String, dynamic> json) =>
      PrEmployeeDetails(
        id: json["id"] ?? 0,
        prFatherName: json["PR_FATHER_NAME"] ?? "",
        prMotherName: json["PR_MOTHER_NAME"] ?? "",
        prSaltKey: json["PR_SALT_KEY"] ?? "",
        prBloodGroup: json["PR_BLOOD_GROUP"] ?? "",
        prGender: json["PR_GENDER"] ?? "",
        prHeight: json["PR_HEIGHT"] ?? "",
        prBodyMark: json["PR_BODY_MARK"] ?? "",
        prLanguage: json["PR_LANGUAGE"] ?? "",
        prImagePath: json["PR_IMAGE_PATH"] ?? "",
        prReligion: json["PR_RELIGION"] ?? "",
        prCategory: json["PR_CATEGORY"] ?? "",
        prQualification: json["PR_QUALIFICATION"] ?? "",
        prMariedStatus: json["PR_MARIED_STATUS"] ?? "",
        prDob: json["PR_DOB"],
        prMariageDate: json["PR_MARIAGE_DATE"],
        prEmergencyContactNo: json["PR_EMERGENCY_CONTACT_NO"] ?? "",
        prPancard: json["PR_PANCARD"] ?? "",
        prPancardFile: json["PR_PANCARD_FILE"] ?? "",
        prAadharCard: json["PR_AADHAR_CARD"] ?? "",
        prAadharCardFile: json["PR_AADHAR_CARD_FILE"] ?? "",
        prDrivingLicenceNo: json["PR_DRIVING_LICENCE_NO"] ?? "",
        prDrivingLicenceFile: json["PR_DRIVING_LICENCE_FILE"] ?? "",
        prPassportNo: json["PR_PASSPORT_NO"] ?? "",
        prPassportFile: json["PR_PASSPORT_FILE"] ?? "",
        prPfApplicableInLast: json["PR_PF_APPLICABLE_IN_LAST"] ?? "",
        prPfNo: json["PR_PF_NO"] ?? "",
        prEsiApplicableInLast: json["PR_ESI_APPLICABLE_IN_LAST"] ?? "",
        prEsiNo: json["PR_ESI_NO"] ?? "",
        prUanNo: json["PR_UAN_NO"] ?? "",
        prBankAccountNo: json["PR_BANK_ACCOUNT_NO"] ?? "",
        prIfscCode: json["PR_IFSC_CODE"] ?? "",
        prBankName: json["PR_BANK_NAME"] ?? "",
        prBranchName: json["PR_BRANCH_NAME"] ?? "",
        prAccountType: json["PR_ACCOUNT_TYPE"] ?? "",
        prDateOfJoining: json["PR_DATE_OF_JOINING"] ?? "",
        prProbationalDate: json["PR_PROBATIONAL_DATE"] ?? "",
        prProbationalNoOfDays: json["PR_PROBATIONAL_NO_OF_DAYS"] ?? "",
        prSignature: json["PR_SIGNATURE"] ?? "",
        prSpecialization: json["PR_SPECIALIZATION"] ?? "",
        prStatus: json["PR_STATUS"] ?? "",
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prModifiedAt: json["PR_MODIFIED_AT"] == null
            ? null
            : DateTime.parse(json["PR_MODIFIED_AT"]),
        prEmployee: json["PR_EMPLOYEE"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "PR_FATHER_NAME": prFatherName ?? "",
        "PR_MOTHER_NAME": prMotherName ?? "",
        "PR_SALT_KEY": prSaltKey ?? "",
        "PR_BLOOD_GROUP": prBloodGroup ?? "",
        "PR_GENDER": prGender ?? "",
        "PR_HEIGHT": prHeight ?? "",
        "PR_BODY_MARK": prBodyMark ?? "",
        "PR_LANGUAGE": prLanguage ?? "",
        "PR_IMAGE_PATH": prImagePath ?? "",
        "PR_RELIGION": prReligion ?? "",
        "PR_CATEGORY": prCategory ?? "",
        "PR_QUALIFICATION": prQualification ?? "",
        "PR_MARIED_STATUS": prMariedStatus ?? "",
        "PR_DOB": prDob,
        "PR_MARIAGE_DATE": prMariageDate,
        "PR_EMERGENCY_CONTACT_NO": prEmergencyContactNo ?? "",
        "PR_PANCARD": prPancard ?? "",
        "PR_PANCARD_FILE": prPancardFile ?? "",
        "PR_AADHAR_CARD": prAadharCard ?? "",
        "PR_AADHAR_CARD_FILE": prAadharCardFile ?? "",
        "PR_DRIVING_LICENCE_NO": prDrivingLicenceNo ?? "",
        "PR_DRIVING_LICENCE_FILE": prDrivingLicenceFile ?? "",
        "PR_PASSPORT_NO": prPassportNo ?? "",
        "PR_PASSPORT_FILE": prPassportFile ?? "",
        "PR_PF_APPLICABLE_IN_LAST": prPfApplicableInLast ?? "",
        "PR_PF_NO": prPfNo ?? "",
        "PR_ESI_APPLICABLE_IN_LAST": prEsiApplicableInLast ?? "",
        "PR_ESI_NO": prEsiNo ?? "",
        "PR_UAN_NO": prUanNo ?? "",
        "PR_BANK_ACCOUNT_NO": prBankAccountNo ?? "",
        "PR_IFSC_CODE": prIfscCode ?? "",
        "PR_BANK_NAME": prBankName ?? "",
        "PR_BRANCH_NAME": prBranchName ?? "",
        "PR_ACCOUNT_TYPE": prAccountType ?? "",
        "PR_DATE_OF_JOINING": prDateOfJoining ?? "",
        "PR_PROBATIONAL_DATE": prProbationalDate ?? "",
        "PR_PROBATIONAL_NO_OF_DAYS": prProbationalNoOfDays ?? "",
        "PR_SIGNATURE": prSignature ?? "",
        "PR_SPECIALIZATION": prSpecialization ?? "",
        "PR_STATUS": prStatus ?? "",
        "PR_CREATED_AT":
            prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
        "PR_MODIFIED_AT":
            prModifiedAt == null ? null : prModifiedAt!.toIso8601String(),
        "PR_EMPLOYEE": prEmployee ?? "",
      };
}

class PrPentAddress {
  PrPentAddress({
    this.id,
    this.prCountry,
    this.prState,
    this.prCity,
    this.prPincode,
    this.prAddress,
    this.prStatus,
    this.prCreatedAt,
    this.prUpdatedAt,
    this.prEmployee,
  });

  int? id;
  String? prCountry;
  String? prState;
  String? prCity;
  String? prPincode;
  String? prAddress;
  int? prStatus;
  DateTime? prCreatedAt;
  DateTime? prUpdatedAt;
  int? prEmployee;

  factory PrPentAddress.fromJson(Map<String, dynamic> json) => PrPentAddress(
        id: json["id"] ?? "",
        prCountry: json["PR_COUNTRY"] ?? "",
        prState: json["PR_STATE"] ?? "",
        prCity: json["PR_CITY"] ?? "",
        prPincode: json["PR_PINCODE"] ?? "",
        prAddress: json["PR_ADDRESS"] ?? "",
        prStatus: json["PR_STATUS"] ?? "",
        prCreatedAt: json["PR_CREATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_CREATED_AT"]),
        prUpdatedAt: json["PR_UPDATED_AT"] == null
            ? null
            : DateTime.parse(json["PR_UPDATED_AT"]),
        prEmployee: json["PR_EMPLOYEE"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "PR_COUNTRY": prCountry ?? "",
        "PR_STATE": prState ?? "",
        "PR_CITY": prCity ?? "",
        "PR_PINCODE": prPincode ?? "",
        "PR_ADDRESS": prAddress ?? "",
        "PR_STATUS": prStatus ?? "",
        "PR_CREATED_AT":
            prCreatedAt == null ? null : prCreatedAt!.toIso8601String(),
        "PR_UPDATED_AT":
            prUpdatedAt == null ? null : prUpdatedAt!.toIso8601String(),
        "PR_EMPLOYEE": prEmployee ?? "",
      };
}
