import 'package:digigyan/cbtsrc/cbt_model/menu_model.dart';
import 'package:digigyan/cbtsrc/constants/api_urls.dart';

class MenuCode {
  static String get masterCode => 'CBT_MASTER';

  static String get saleCode => 'CBT_SALES';

  static String get cbtOrginationCode => 'CBT_ORGANIZATION';

  static String get questionBank => 'CBT_QUESTION_BANK';

  static String get utilityCode => 'CBT_UTILITY';

  static String get importCode => 'CBT_IMPORT_DATA';

  static String get transactionCode => 'CBT_TRANSACTION';

  static String get otherCode => 'CBT_OTHERS';

  static String get supportCode => 'CBT_SUPPORT';

  static String get promotionCode => 'CBT_PROMOTION';

  static String get settingCode => 'CBT_IMPORT_EXPORT';

  static String get accountCode => 'CBT_TEST_GENERATOR';

  static String get customerCode => 'CBT_CUSTOMER_MASTER';

  static String get recurtmentCode => 'CBT_RECRUITMENT';

  static String get documentCode => 'CBT_DOCUMENT';
}

class SubMenuCode {
  //CBT_TRANSACTON
  static String get saleOrderCode => 'CBT_T_SORD';

  // CBT_MASTER
  static String get departmentCode => 'CBT_M_DEPARTMENT';

  static String get designationCode => 'CBT_M_DESIGNATION';

  static String get companyCode => 'CBT_M_COMPANY';

  static String get employeeCode => 'CBT_M_EMPLOYEE';

  static String get customerCode => 'CBT_CUSTOMER';

  static String get menuCode => 'CBT_MENU';

  static String get mpageControlCode => 'CBT_M_PAGE_CONTROL';

  static String get mPageCode => 'CBT_M_PAGE';

  static String get cbtTeacher => 'CBT_TEACHER';

  static String get cbtStudent => 'CBT_STUDENT';

  static String get pageControl => 'CBT_M_PAGE_CONTROL';

  static String get page => 'CBT_M_PAGE';

  static String get topicCode => 'CBT_TOPIC';

  static String get assetsAssignCode => 'CBT_ASSETS_ASSIGN';

  static String get extensionCode => 'CBT_M_EXTENSION';

  // CBT_SALES
  static String get freshCode => 'CBT_S_FRESH';

  static String get allCode => 'CBT_S_ALL';

  static String get pendingCode => 'CBT_S_PENDING';

  static String get callBackCode => 'CBT_S_CALL_BACK';

  static String get holdCode => 'CBT_S_HOLD';

  static String get localCode => 'CBT_S_LOCAL';

  static String get ringingCode => 'CBT_S_RINGING';

  static String get approvedCode => 'CBT_S_APPROVED';

  static String get verifyCode => 'CBT_S_VERIFIED';

  static String get unVeryFyCode => 'CBT_S_UN_VERIFIED';

  static String get dispatchCode => 'CBT_S__DISPATCH';

  static String get rtoCode => 'CBT_S_RTO';

  static String get holydayCode => 'CBT_M_HOLIDAY';

  static String get eventCode => 'CBT_M_EVENT';

  static String get controlCode => 'CBT_M_CONTROL';

  static String get submenuCode => 'CBT_M_SUB_MENU';

  static String get categoryCode => 'CBT_CATEGORY';

  static String get subjectCode => 'CBT_SUBJECT';

  static String get classCode => 'CBT_CLASS';

  static String get bookCode => 'CBT_BOOK';

  static String get stockCode => 'CBT_M_WAREHOUSE_STOCK';

  static String get profileCode => 'CBT_M_PROFILE';

  static String get changePasswordCode => 'CBT_M_CHANGE_PASSWORD';

  static String get uiControlsCode => 'CBT_M_UI_CONTROL';

  static String get headCode => 'CBT_HEAD';

  static String get salaryCode => 'CBT_SALARY_STRUCTURE';

  static String get campaginCode => 'CBT_CAMPAIGN';

  static String get meetingCode => 'CBT_MEETING_CREATE';

  static String get dropDownCode => 'CBT_DROPDOWN';

  static String get mailCode => 'CBT_MAIL';

  static String get cbtBrand => 'CBT_BRAND';

  static String get leaveMasterCode => "CBT_LEAVE_MASTER";

  static String get videoCode => "CBT_VIDEO";

  static String get presentationCode => "CBT_PERSENTATION";

  static String get checkIN => "CBT_CHECK_IN";

  static String get checkOUT => "CBT_CHECK_OUT";

  static String get attdenceReq => "CBT_ATTENDANCE_REQUEST";

  static String get schoolCode => "CBT_SCHOOL";

  static String get dwrPlanCode => "DWR_PLAN";

  static String get visitCode => "CBT_VISIT";

  static String get visitSubmitCode => "CBT_DWR_SUBMIT";

  static String get expenseCode => "CBT_EXPENSE";

  static String get visitTrackCode => "CBT_VISITOR_TRACK";

  static String get doctorCode => "CBT_DOCTOR_VISIT";

  static String get simulationCode1 => "CBT_SIMULATION";

  static String get simulationCode => "CBT_SML_CODE";

  static String get pdfCode => "CBT_PDF";
}

class CBTUrlByMenu {
  static String getUrlByMenu(
      {required MenuModel menu, String employeeId = "", String formId = ""}) {
    return menu.prMenu != null
        ? ApiUrls.base_url_web_form(menu.prFormUrl!,
            employeeID: employeeId, formID: formId)
        : ApiUrls.base_url_web_form("2");
  }
}

const defaultPadding = 16.0;
