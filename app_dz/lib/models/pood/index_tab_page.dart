
  /*
  *
  * 首页对应的tab列表
  * 对于复杂类型的  首先创建类和构造函数 然后添加工厂方法
  * */

  class IndexTabPageModel {

    String message;
    bool success;
    PayLoad  payload;

    IndexTabPageModel({this.message,this.success,this.payload});

    factory IndexTabPageModel.fromJson(Map<String,dynamic> params){
      return new IndexTabPageModel(
          message: params['_id'],
          success: params['name'],
          payload: PayLoad.fromJson(params['payload'])
      );
    }
  }

  class PayLoad {

    List<Ads> ads;
    List<Hot> hots;
    List<Banner> banner;
    List<Latest> latests;

    PayLoad({this.ads ,this.hots,this.banner,this.latests});

    factory PayLoad.fromJson(Map<String,dynamic> params){
      return PayLoad(
        ads: (params['ads'] as List).map((item) => Ads.fromJson(item)).toList(),
        hots: (params['hots'] as List).map((item) => Hot.fromJson(item)).toList(),
        banner: (params['banner'] as List).map((item) => Banner.fromJson(item)).toList(),
        latests: (params['latests'] as List).map((item) => Latest.fromJson(item)).toList(),
      );
    }
  }

  class Action {

    String data;
    String type;

    Action({this.data,this.type});

    factory Action.fromJson(Map<String,dynamic> params){
      return new Action(
          data: params['data'],
          type: params['type']
      );
    }
  }

  class Ads {
    
    Action action;
    double height;
    String image;

    Ads({this.action,this.height,this.image});

    factory Ads.fromJson(Map<String,dynamic> params){
      return new Ads(
          action: Action.fromJson(params['action']),
          height: params['height'],
          image: params['image']
      );
    }
  }

  class Banner {
    Action action;
    double height;
    String image;

    Banner({this.action,this.height,this.image});

    factory Banner.fromJson(Map<String,dynamic> params){
      return new Banner(
          action: Action.fromJson(params['action']),
          height: params['height'],
          image: params['image']
      );
    }
  }

  class Hot {

    String id;
    String generated_at;
    String latest;
    String name;
    String thumbnail;

    Hot({this.id,this.generated_at,this.latest,this.name,this.thumbnail});

    factory Hot.fromJson(Map<String,dynamic> params) {
      return new Hot(
        id: params['_id'],
        generated_at: params['generated_at'],
        latest: params['latest'],
        name: params['name'],
        thumbnail: params['thumbnail']
      );
    }
  }

  class Latest{
    String id;
    String generated_at;
    String latest;
    String name;
    String thumbnail;
    String source;

    Latest({this.id,this.generated_at,this.latest,this.name,this.thumbnail,this.source});

    factory Latest.fromJson(Map<String,dynamic> params) {
      return new Latest(
          id: params['_id'],
          generated_at: params['generated_at'],
          latest: params['latest'],
          name: params['name'],
          thumbnail: params['thumbnail'],
          source: params['source']
      );
    }
  }