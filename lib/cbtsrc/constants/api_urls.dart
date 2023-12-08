abstract class ApiUrls {
  static String cbtBaseUrl(String endPoint) =>
      "http://api-anand-publication.codebright.in/$endPoint";

  // "http://demo.codebright.in/$endPoint";
  //
  // "http://digigyan.codebright.in/$endPoint";

  static String baseUrl(String endPoint) => cbtBaseUrl("api/$endPoint");

  static String baseUrlTest(String endPoint) =>
      cbtBaseUrl("test-api/$endPoint");

  static String baseUrlImage(String? endPoint) => cbtBaseUrl(endPoint!);

  static String baseUrl1(String endPoint) => cbtBaseUrl("outer/$endPoint");

  static String base_url_web(String endPoint) => cbtBaseUrl(endPoint);

  static String base_url_web1(String endPoint) => cbtBaseUrl(endPoint);

  // http://demo.codebright.in/dg-form/submenu-form/512f191e-2d62-4f60-a28b-85dd7b4d336e

  //
  // static String base_url_web_form(String endPoint,
  //         {String employeeID = "", String formID = ""}) =>
  //     formID.isEmpty && employeeID.isEmpty
  //         ? cbtBaseUrl("form/$endPoint")
  //         : formID.isEmpty
  //             ? cbtBaseUrl("$endPoint/$employeeID")
  //             : cbtBaseUrl("$endPoint$employeeID/$formID");

  static String base_url_web_form(String endPoint,
          {String employeeID = "", String formID = ""}) =>
      formID.isEmpty && employeeID.isEmpty
          ? cbtBaseUrl("$endPoint")
          : formID.isEmpty
              ? cbtBaseUrl("$endPoint/$employeeID")
              : cbtBaseUrl("$endPoint$employeeID/$formID");

  // static String get login => base_url_web("employee-api/employee-login");
  static String get login => cbtBaseUrl("account-api/user-login");

  static String get register => cbtBaseUrl("account-api/user-register");

  static String get fileUpload => baseUrl("file-upload");

  static String get sync => baseUrl("syncData");

  static String get locationList => baseUrl("locationList");

  static String get qrcodeList => baseUrl("qrList");

  static String get controlList => baseUrl("controlPermissionList");

  static String get leaveRequestSubmit => baseUrl("leaveRequest");

  static String get attendanceRequest => baseUrl("attendanceRequest");

  static String get checkIn => baseUrl("checkIn");

  static String get departmentMenu => baseUrl("menuList");

  static String get departmentMenuSelection => baseUrl("menuPermission");

  static String get controlSelection => baseUrl("controlPermission");

  static String get checkOut => baseUrl("checkOut");

  static String get leaveReqUpdat => baseUrl("checkOut");

  static String get liveLocationSave => baseUrl("locationSubmit");

  static String get qrcodeupdate => baseUrl("companyQrAssign");

  static String get attdenceReqUpdate => baseUrl("checkOut");

  static String get expenseData => baseUrl("expenseData");

  static String get expenseCommit => baseUrl("expenseCommit");

  static String get clientData => baseUrl("client_add");

  static String get categoryApiList => baseUrl("category-list");

  static String get menu_list => cbtBaseUrl("account-api/menu-data");

  static String get department_list =>
      base_url_web("common-api/department-list");

  static String get department_add => base_url_web("common-api/department-add");

  static String get employeeList => base_url_web("employee-api/employee-list");

  static String get designation_list =>
      base_url_web("common-api/designation-list");

  static String get designation_add =>
      base_url_web("common-api/designation-add");

  static String get cbt_drop_down => base_url_web("common-api/dropdown-list");

  static String get state_list => base_url_web("common-api/state-list");

  static String get lead_list => base_url_web("sales-api/lead-list");

  static String get empadd => base_url_web("employee-api/employee-add");

  static String get productList => base_url_web("inventory-api/product-list");

  static String get pinCode => base_url_web("common-api/pincode-data");

  static String get postLeadData => base_url_web("sales-api/lead-trans-add");

  static String get menuListData => base_url_web("common-api/menu-list");

  static String get headQtrData => base_url_web("common-api/head-quater-list");

  static String get holyDayData => base_url_web("common-api/holiday-list");

  static String get eventListData => base_url_web("common-api/events-list");

  static String get controlListData => base_url_web("common-api/control-list");

  static String get submenuCodeData => base_url_web("common-api/submenu-list");

  static String get extensionData => base_url_web("sales-api/extension-list");

  static String get assetsData => base_url_web("sales-api/assets-list");

  //inventory
  static String get brandUrl => base_url_web("inventory-api/brand-list");

  static String get categoryUrl => base_url_web("inventory-api/category-list");

  static String get productUrl => base_url_web("inventory-api/product-list");

  static String get whereHouseUrl =>
      base_url_web("inventory-api/warehouse-list");

  static String get stockUrl =>
      base_url_web("inventory-api/warehouse-stock-list");
}

class AppInfo {
  static const String companyName = "CbTech";
  static const String companyAddress = "Delhi";
  static const String appName = "udgam";
  static const String appVersion = "1.0.0";
  static const String appVersionDisplay = "20211117 ";
  static const String allRightReserved = "Delhi";

  static const String _ANDROID = "ANDROID";
  static const String _IOS = "IOS";
}
