  /*
  *
  * 首页的tab分类选项卡
  *
  * */

//  import 'package:json_annotation/json_annotation.dart';
//  import 'package:json_serializable/json_serializable.dart';

  class IndexTableModel {

    String id;
    String name;

    IndexTableModel({this.id , this.name});

    factory IndexTableModel.fromJson(Map<String , dynamic> params) {
      return new IndexTableModel(
        id: params['id'],
        name: params['name']
      );
    }

  }