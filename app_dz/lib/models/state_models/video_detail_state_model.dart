
  /*
  *
  * 视频详情的实体类
  *
  * */

  import 'package:app_dz/common/status.dart';
  import 'package:app_dz/models/pood/video_model_detail.dart';
  import 'package:app_dz/models/state_models/base_state_model.dart';



  class VideoDetailStateModel extends BaseStateModel {

    //状态
    Status _status = Status.READY;
    //视频详情
    VideoDetailModel _videoDetailModel;

    Status get status => _status;
    VideoDetailModel get videoDetailModel => _videoDetailModel;

  }