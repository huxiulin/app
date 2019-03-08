
  /*
  *
  * 视频的实体类
  *
  * */

  class VideoModel {

    String id;
    String generatedAt;
    String latest;
    String name;
    String source;
    String thumbnail;
    String timestamp;

    VideoModel({this.id,this.generatedAt,this.latest,this.name,this.source,this.thumbnail,this.timestamp});

    factory VideoModel.formJson(Map<String,dynamic> params) {
      return VideoModel(
        id: params['_id'],
        generatedAt: params['generated_at'],
        latest: params['latest'],
        name: params['name'],
        source: params['source'],
        thumbnail: params['thumbnail'],
        timestamp: params['timestamp']
      );
    }
  }