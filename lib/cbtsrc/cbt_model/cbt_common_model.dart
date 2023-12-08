import 'package:digigyan/cbtsrc/screens/cbt_admin/sub_master/cbt_comman/digigyan_model.dart';
import 'package:flutter/material.dart';
class CBTCommonModel<M> {
  String id;
  String title;
  String image;
  String? subTitle;
  bool selected;
  bool isExpanded;
  M? originalModel;
  List<CbtHeaderModel> cbtRowList=[];
  List<dynamic> expendableList=[];
  Color? bgColor = Colors.red.shade600;
  int colorYn = 0;
  bool isExpandble = false;

  CBTCommonModel({
    required this.id,
    required this.title,
    required this.image,
    this.subTitle,
    this.cbtRowList=const [],
    this.selected = false,
    this.isExpanded = false,
    this.colorYn = 0,
    this.isExpandble = false,
    this.expendableList=const [],
    required this.originalModel,
    this.bgColor,

  }) {
    bgColor ??= Colors.red.shade600;
  }

  factory CBTCommonModel.clone(CBTCommonModel initialModel) {
    return CBTCommonModel(
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

class CBTData{
  List<DigiGyanModel> data;
  List<CbtHeaderModel> cbtHeaderModel;
  bool isHeader;
  CBTData({required this.data,required this.cbtHeaderModel,this.isHeader=true});
}
