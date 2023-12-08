class MenuModel {
  MenuModel({
    this.prMenuId,
    this.prSortorder,
    this.prMenuName,
    this.prMenuImage,
    this.prMenuCode,
    this.prIsView,
    this.prFunction,
    this.prPath,
    this.prInHindi,
    this.prMenuDelete,
    // this.prMenuAdded,
    // this.prMenuModified,
    this.prMenuStatus,
    this.prSubmenues,
    this.prSubmenuId,
    this.prMenu,
    this.prListUrl,
    this.prFormUrl,
    this.isSelected=false,
  });

  int? prMenuId;
  int? prSortorder;
  String? prMenuName;
  String? prMenuImage;
  String? prMenuCode;
  String? prIsView;
  String? prFunction;
  String? prMenuDelete;
  String? prPath;
  String? prInHindi;
  String? prListUrl;
  String? prFormUrl;
  // DateTime? prMenuAdded;
  // DateTime? prMenuModified;
  int? prMenuStatus;
  List<MenuModel>? prSubmenues;
  int? prSubmenuId;
  int? prMenu;
  bool? isSelected;

  factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
    prMenuId: json["PR_MENU_ID"]??0,
    prSortorder: json["PR_SORTORDER"]??0,
    prMenuName: json["PR_NAME"]??"",
    prMenuImage: json["PR_ICON_PATH"]??"",
    prMenuCode: json["PR_CODE"]??"",
    prIsView: json["PR_IS_VIEW"]??"",
    prFunction: json["PR_FUNCTION"]??"",
    prPath: json["PR_ICON_PATH"]??"",
    prListUrl: json["PR_LIST_URL"]??"",
    prFormUrl: json["PR_FORM_URL"]??"",
    prInHindi: json["PR_IN_HINDI"]??"",
    prMenuDelete: json["PR_DELETE_URL"]??"",
    prMenuStatus: json["PR_STATUS"]??0,
    prSubmenues: json["PR_SUBMENU"] == null ? [] : List<MenuModel>.from(json["PR_SUBMENU"].map((x) => MenuModel.fromJson(x))),
    prSubmenuId: json["PR_SUBMENU_ID"]??0,
    prMenu: json["PR_MENU"]??0,
  );

  Map<String, dynamic> toJson() => {
    "PR_MENU_ID":  prMenuId,
    "PR_SORTORDER": prSortorder,
    "PR_NAME": prMenuName,
    "PR_ICON_PATH": prMenuImage,
    "PR_CODE": prMenuCode,
    "PR_IS_VIEW": prIsView,
    "PR_DELETE_URL": prMenuDelete,
    "PR_FUNCTION": prFunction,
    "PR_ICON_PATH": prPath,
    "PR_LIST_URL": prListUrl,
    "PR_FORM_URL":prFormUrl,
    "PR_IN_HINDI": prInHindi,
    "PR_STATUS": prMenuStatus,
    "PR_SUBMENU": List<dynamic>.from(prSubmenues!.map((x) => x.toJson())),
    "PR_SUBMENU_ID":  prSubmenuId,
    "PR_MENU": prMenu,
  };


  factory MenuModel.fromPreferenceMap(Map<String, dynamic> json) => MenuModel(
    prMenuId: json["PR_MENU_ID"]??0,
    prSortorder: json["PR_SORTORDER"]??0,
    prMenuName: json["PR_NAME"]??"",
    prMenuImage: json["PR_ICON_PATH"]??"",
    prMenuCode: json["PR_CODE"]??"",
    prIsView: json["PR_IS_VIEW"]??"",
    prMenuDelete: json["PR_DELETE_URL"]??"",
    prFunction: json["PR_FUNCTION"]??"",
    prListUrl: json["PR_LIST_URL"]??"",
    prFormUrl: json["PR_FORM_URL"]??"",
    prPath: json["PR_ICON_PATH"]??"",
    prInHindi: json["PR_IN_HINDI"]??"",
    // prMenuAdded: DateTime.parse(json["PR_MENU_ADDED"]),
    // prMenuModified: DateTime.parse(json["PR_MENU_MODIFIED"]),
    prMenuStatus: json["PR_STATUS"],
    prSubmenues: json["PR_SUBMENU"] == null ? [] : List<MenuModel>.from(json["PR_SUBMENU"].map((x) => MenuModel.fromJson(x))),
    prSubmenuId: json["PR_SUBMENU_ID"]??0,
    prMenu: json["PR_MENU"]??0,
  );

  Map<String, dynamic> toMapForPreference() => {
    "PR_MENU_ID": prMenuId == null ? null : prMenuId,
    "PR_SORTORDER": prSortorder,
    "PR_NAME": prMenuName,
    "PR_ICON_PATH": prMenuImage,
    "PR_CODE": prMenuCode,
    "PR_IS_VIEW": prIsView,
    "PR_DELETE_URL": prMenuDelete,
    "PR_FUNCTION": prFunction,
    "PR_ICON_PATH": prPath,
    "PR_LIST_URL": prListUrl,
    "PR_FORM_URL":prFormUrl,
    "PR_IN_HINDI": prInHindi,
    // "PR_MENU_ADDED": prMenuAdded!,
    // "PR_MENU_MODIFIED": prMenuModified!,
    "PR_STATUS": prMenuStatus,
    "PR_SUBMENU": prSubmenues == null ? []: List<dynamic>.from(prSubmenues!.map((x) => x.toJson())),
    "PR_SUBMENU_ID": prSubmenuId??0,
    "PR_MENU": prMenu??"",
  };
}
