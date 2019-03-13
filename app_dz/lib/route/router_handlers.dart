
  /*
  *
  * 路由定义
  * */

  import 'package:fluro/fluro.dart';
  import 'package:flutter/material.dart';
  import 'package:app_dz/models/pood/video_model.dart';
  import 'package:app_dz/component/home/index/video_detail_page.dart';


  var videoDetailRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String,List<String>> params) {
      String id = params['_id']?.first;
      String timestamp = params["timestamp"]?.first;
      String thumbnail = params["thumbnail"]?.first;
      String name = params["name"]?.first;
      String latest = params["latest"]?.first;
      String generatedAt = params["generatedAt"]?.first;

      return VideoDetailPage(
        videoItem : VideoModel(
          id: id,
          timestamp: timestamp,
          thumbnail: thumbnail,
          name: name,
          latest: latest,
          generatedAt: generatedAt
        )
      );
    }
  );