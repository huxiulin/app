  /*
  *
  * 首页的tab分类选项卡
  *
  * */


  class IndexTableModel {

    String id;
    String name;

    IndexTableModel({this.id , this.name});

    factory IndexTableModel.fromJson(Map<String , dynamic> params) {
      return new IndexTableModel(
        id: params['_id'],
        name: params['name']
      );
    }

  }