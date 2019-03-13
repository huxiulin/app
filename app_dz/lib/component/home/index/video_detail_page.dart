
  /*
  *
  * 电影界面详情
  *
  * */
  import 'package:fluro/fluro.dart';
  import 'package:flutter/material.dart';
  import 'package:scoped_model/scoped_model.dart';
  import 'package:app_dz/models/pood/video_model.dart';
  import 'package:app_dz/models/state_models/video_detail_state_model.dart';



  class VideoDetailPage extends StatefulWidget {

    //接收传递过来的参数
    VideoModel videoItem;
    VideoDetailPage({@required this.videoItem});

    @override
    State<StatefulWidget> createState() => _VideoDetailPage();
  }


  class _VideoDetailPage extends State<VideoDetailPage> {

    VideoDetailStateModel videoDetailStateModel;

    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      videoDetailStateModel = new VideoDetailStateModel();
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ScopedModel(
        model: videoDetailStateModel,
        child: Scaffold(
          body: Container(
            child: Text('1111111'),
          ),
        ),
      );
    }
  }