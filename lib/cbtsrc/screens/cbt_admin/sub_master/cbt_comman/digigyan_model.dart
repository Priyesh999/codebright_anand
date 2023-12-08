import 'package:flutter/material.dart';

class DigiGyanModel<M> {
  String id;
  String title;
  String image;
  String? subTitle;
  bool selected;
  bool isExpanded;
  M? originalModel;
  List<CbtHeaderModel> cbtRowList = [];
  List<dynamic> expendableList = [];
  Color? bgColor = Colors.red.shade600;
  int colorYn = 0;
  bool isExpandble = false;

  DigiGyanModel({
    required this.id,
    required this.title,
    required this.image,
    this.subTitle,
    this.cbtRowList = const [],
    this.selected = false,
    this.isExpanded = false,
    this.colorYn = 0,
    this.isExpandble = false,
    this.expendableList = const [],
    required this.originalModel,
    this.bgColor,
  }) {
    bgColor ??= Colors.red.shade600;
  }

  factory DigiGyanModel.clone(DigiGyanModel initialModel) {
    return DigiGyanModel(
      title: initialModel.title,
      image: initialModel.image,
      originalModel: initialModel.originalModel,
      id: initialModel.id,
      selected: initialModel.selected,
      subTitle: initialModel.subTitle,
      isExpandble: initialModel.isExpandble,
      expendableList: initialModel.expendableList,
    );
  }
}

class DigiGyanData {
  List<DigiGyanModel> data;
  List<CbtHeaderModel> cbtHeaderModel;
  bool isHeader;

  DigiGyanData(
      {required this.data, required this.cbtHeaderModel, this.isHeader = true});
}

class CodebrighFilterModel {
  List<FilterData>? employeeData;
  List<FilterData>? yearData;
  List<FilterData>? monthData;
  List<FilterData>? flag;
  List<FilterData>? statusList;
  bool startDate;
  bool endDate;

  CodebrighFilterModel({
    this.employeeData,
    this.yearData,
    this.monthData,
    this.flag,
    this.statusList,
    this.startDate = false,
    this.endDate = false,
  });

  factory CodebrighFilterModel.fromJson(Map<String, dynamic> json) =>
      CodebrighFilterModel(
        employeeData: json["employee_data"] == null
            ? []
            : List<FilterData>.from(
                json["employee_data"]!.map((x) => FilterData.fromJson(x))),
        yearData: json["year_data"] == null
            ? []
            : List<FilterData>.from(
                json["year_data"]!.map((x) => FilterData.fromJson(x))),
        monthData: json["month_data"] == null
            ? []
            : List<FilterData>.from(
                json["month_data"]!.map((x) => FilterData.fromJson(x))),
        flag: json["report_data"] == null
            ? []
            : List<FilterData>.from(
                json["report_data"]!.map((x) => FilterData.fromJson(x))),
        // statusList: json["report_data"] == null ? [] : List<FilterData>.from(json["report_data"]!.map((x) => FilterData.fromJson(x))),
        statusList: <FilterData>[],
      );

  factory CodebrighFilterModel.empty() => CodebrighFilterModel(
        employeeData: [],
        yearData: [],
        monthData: [],
        flag: [],
      );

  Map<String, dynamic> toJson() => {
        "employee_data": employeeData == null
            ? []
            : List<dynamic>.from(employeeData!.map((x) => x.toJson())),
        "year_data": yearData == null
            ? []
            : List<dynamic>.from(yearData!.map((x) => x.toJson())),
        "month_data": monthData == null
            ? []
            : List<dynamic>.from(monthData!.map((x) => x.toJson())),
        "report_data": flag == null
            ? []
            : List<dynamic>.from(flag!.map((x) => x.toJson())),
      };
}

class FilterData {
  String? id;
  String? name;
  bool isSelected;

  FilterData({
    this.id,
    this.name,
    this.isSelected = false,
  });

  factory FilterData.fromJson(Map<String, dynamic> json) => FilterData(
        id: json["ID"].toString() ?? "",
        name: json["NAME"].toString() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "NAME": name,
      };
}

class CbtPrModel {
  List<CbtItemData>? itemData;
  List<List<CbtHeaderModel>>? listHeader;
  bool? isHeader;

  CbtPrModel({
    this.itemData,
    this.listHeader,
    this.isHeader,
  });

  factory CbtPrModel.fromJson(Map<String, dynamic> json) => CbtPrModel(
        itemData: json["ITEM_DATA"] == null
            ? []
            : List<CbtItemData>.from(
                json["ITEM_DATA"]!.map((x) => CbtItemData.fromJson(x))),
        listHeader: json["LIST_HEADER"] == null
            ? []
            : List<List<CbtHeaderModel>>.from(json["LIST_HEADER"]!.map((x) =>
                List<CbtHeaderModel>.from(
                    x.map((x) => CbtHeaderModel.fromJson(x))))),
        isHeader: json["IS_HEADER"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "ITEM_DATA": itemData == null
            ? []
            : List<dynamic>.from(itemData!.map((x) => x.toJson())),
        "LIST_HEADER": listHeader == null
            ? []
            : List<dynamic>.from(listHeader!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "IS_HEADER": isHeader,
      };
}

class CbtItemData {
  int? id;
  String? title;
  String? image;
  String? subtitle;
  bool? selected;
  bool? isExpanded;
  dynamic originalData;
  List<CbtHeaderModel>? rowData;
  List<dynamic>? expandableData;
  String? bgColor;

  CbtItemData({
    this.id,
    this.title,
    this.image,
    this.subtitle,
    this.selected,
    this.isExpanded,
    this.originalData,
    this.rowData,
    this.expandableData,
    this.bgColor,
  });

  factory CbtItemData.fromJson(Map<String, dynamic> json) => CbtItemData(
        id: json["ID"] ?? 0,
        title: json["TITLE"] ?? "",
        image: json["IMAGE"] ?? "",
        subtitle: json["SUBTITLE"] ?? "",
        selected: json["SELECTED"] ?? false,
        isExpanded: json["IS_EXPANDED"] ?? false,
        originalData: json["ORIGINAL_DATA"] ?? "",
        rowData: json["ROW_DATA"] == null
            ? []
            : List<CbtHeaderModel>.from(
                json["ROW_DATA"]!.map((x) => CbtHeaderModel.fromJson(x))),
        expandableData: json["EXPANDABLE_DATA"] == null
            ? []
            : List<dynamic>.from(json["EXPANDABLE_DATA"]!.map((x) => x)),
        bgColor: json["BG_COLOR"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "TITLE": title,
        "IMAGE": image,
        "SUBTITLE": subtitle,
        "SELECTED": selected,
        "IS_EXPANDED": isExpanded,
        "ORIGINAL_DATA": originalData?.toJson(),
        "ROW_DATA": rowData == null
            ? []
            : List<dynamic>.from(rowData!.map((x) => x.toJson())),
        "EXPANDABLE_DATA": expandableData == null
            ? []
            : List<dynamic>.from(expandableData!.map((x) => x)),
        "BG_COLOR": bgColor,
      };
}

class CbtHeaderModel {
  String title;
  String value;
  String color;
  int flex;
  int requestValue;
  bool isClick;
  String click_type;
  int fontSize;
  String bg_color;
  String aligment;
  String aligmentRow;
  String icon;
  String clickUrl;
  String rwquestKey;
  String clickTypeMethod;

  CbtHeaderModel({
    this.title = "",
    this.value = "",
    this.color = "",
    this.flex = 1,
    this.requestValue = 1,
    this.isClick = false,
    this.fontSize = 10,
    this.bg_color = "",
    this.aligment = "LEFT",
    this.aligmentRow = "LEFT",
    this.clickUrl = "",
    this.click_type = "LIST",
    this.icon = "",
    this.rwquestKey = "",
    this.clickTypeMethod = "",
  });

  factory CbtHeaderModel.fromJson(Map<String, dynamic> json) => CbtHeaderModel(
        title: json["TITLE"] ?? "",
        value: json["VALUE"].toString() ?? "",
        color: json["COLOR"] ?? "",
        flex: json["FLEX"] ?? 1,
        isClick: json["IS_CLICK"] ?? false,
        fontSize: json["FONT_SIZE"] ?? 10,
        bg_color: json["BG_COLOR"] ?? "",
        aligment: json["ALIGN"] ?? "LEFT",
        aligmentRow: json["ALIGN_ROW"] ?? "LEFT",
        icon: json["ICON"] ?? "",
        clickUrl: json["CLICK_URL"] ?? "",
        click_type: json["CLICK_TYPE"] ?? "",
        clickTypeMethod: json["CLICK_TYPE_METHOD"] ?? "",
        rwquestKey: json["REQUEST_KEY"] ?? "",
        requestValue: json["REQUEST_VALUE"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "TITLE": title,
        "VALUE": value,
        "COLOR": color,
        "FLEX": flex,
        "IS_CLICK": isClick,
        "FONT_SIZE": fontSize,
      };
}
