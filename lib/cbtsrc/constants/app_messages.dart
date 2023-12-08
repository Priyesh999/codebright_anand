import 'dart:io';

abstract class AppMessages {
  // static String get unexpected => "Please try reloading screen,\n something unexpected happened";
  // static String get failedToLoadDayPlan => "Failed to load day plan";
  static String get failedToLoadDayPlan =>
      "Please Check your Internet/Change your Internet";

  // static String get failedToSubmitDayPlan => "Failed to submit day plan";
  static String get failedToSubmitDayPlan =>
      "Please Check your Internet/Change your Internet";

  static String get unexpected => "Please try again";

  static String get serverHavingIssue =>
      "Server having issue, Please try again";

  static String get server500 => "Server having issue, try again";

  static String get server400 => 'Please check your credentials';

  static String get server300 => 'Server having issue, try again';

  static String get wrongCredentials => "Wrong credentials";

  static String get permissionDenied =>
      "Please allow required permissions \nor\n go to setting to accept it manually";

  static String get permissionGPS => "Please enable GPS";

  static String get userName => "UserName not match";

  static String get wrongNumber => "Please enter your registered Mobile Number";

  static String get forgotPassword => "Password not match. ";

  static String get getNoInternetMsg => "Internet not available.";

  static String get getTechnicalErrorMsg => "Technical Error";

  static String get failedToUploadMsg => "Failed to upload document";

  static String get notPermittedMsg =>
      "You can't login using these credentials";

  static String get successMsg => "Success";

  static String get somethingWentWrongMsg => "Something Went Wrong";

  static String get locationPermission =>
      "Location Service is required. Please allow location permission for CBO SFA";

  static String get invalidCredentialsMsg => "Invalid Credentials";

  static String get unAssociatedEmailMsg =>
      "Given Email-id Is not registered with Finance Optima";

  static String get technicalErrorMsg => "TECHNICAL ERROR";

  static String get cannotSelectMore => "Can not select more than";

  static String get unknownStateMsg =>
      "Unknown State of ui, this should not be seen, please try reloading screen.";

  static String get loadingMsg => "Getting cbt_data..";

  static String get unknownStateTitle => "Unknown state";

  static String get errorStateTitle => "ERROR";

  static String get tradeMarkText =>
      "Copyright (C) Designed & Developed by CBO ERP LIMITED";

  static String get pageControlErr =>
      "Something went wrong, Page controls can't be set";

//  ======================== REPLACEMENTS =======================

  static String get replaceString1 => '<?xml version="1.0" encoding="utf-8"?>';

  static String get replaceString2 => '<string xmlns="http://tempuri.org/">';

  static String get replaceString3 => '</string>';

  static String locationMsg(String placeText) {
    if (Platform.isIOS) {
      return "Location Service is required to $placeText.\nTo turn on location, go to Settings > Privacy > Location Services";
    } else {
      return "Location Service is required to $placeText.\nTo turn on location, go to Settings > Permissions Section > Allow location for CBO SFA";
    }
  }

  //url-not valid --------------------------------------------------------------
  static String get urlNotValid => "URL not valid";

  //-user pin wrong ------------------------------------------------------------
  static String get wrongPin => "Wrong pin";

  static String get wrongOtp => "Wrong OTP";

  static String get jsonParsingError => "JSON PARSING ERROR";

//initial state message
  static String get emptyData => "No Data Available";

  static String get invalidURL => "Invalid URL";

  static String get noDataAvailable => "No cbt_data available";

  static String get noItemFound => "No Item Found";

  static String get youAreUsingFakeLocation =>
      "You are Using Fake Location App. It may affect your Attendance. Remove Fake Location App.";

  static String get yourCallSuccessfullySaved =>
      "Your Dr Call Items has been successfully saved";

  static String get pleaseCheckInternet => "Please Check your Internet";

  static String get logicalErrorWhileExecutingCode =>
      "Logical Error While executing code";

  static String get syncingForExpense => "SYNCING"
      " FOR expense";

  static String get alreadyAdded => "Already Added...";

  static String get failedToSubmitDrCall => "Failed to Submit Dr Call";

  static String get somethingGoneWrongWhileSavingDrCall =>
      "Something gone wrong while saving dr call";

  static String get locationServiceDisabled => "Location Service Disabled";

  static String get pleaseCheckYourInternetChangeInternet =>
      "Please Check your Internet/Change your Internet";

  static String get pleaseTryAgain => "Please try again after sometime";
}
