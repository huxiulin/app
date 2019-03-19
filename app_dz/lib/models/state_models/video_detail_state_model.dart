
  /*
  *
  * 视频详情的实体类
  *
  * */


  import 'package:app_dz/http/api.dart';
  import 'package:app_dz/utils/http_utils.dart';
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

    fetchVideoDetail(String videoId) {
      _status = Status.LOADING;
      HttpUtil.get(Api.VIDEO_URL + videoId, null)
          .then((res) {
        if(res.statusCode == Response.SUCCESS) {
          _status = Status.SUCCESS;
          _videoDetailModel = VideoDetailModel.fromJson(res.data["payload"]);
        } else {
          _status = Status.NO_RESULT;
        }
      })
          .catchError((onError) {
        _status = Status.ERROR;
        print(onError.toString());
      })
          .whenComplete(this.notifyListeners);
    }

  }