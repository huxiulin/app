
  /*
  *
  * 首页的model
  *
  * */

  import 'package:app_dz/common/status.dart';
  import 'package:app_dz/models/state_models/base_state_model.dart';
  import 'package:app_dz/utils/http_utils.dart';
  import 'package:app_dz/http/api.dart';
  import 'package:scoped_model/scoped_model.dart';
  import 'package:app_dz/models/pood/index_tab_model.dart';
  import 'package:app_dz/models/pood/index_tab_page.dart';

  class HomeStateModel extends BaseStateModel {

    Status _status  = Status.READY;

    Status get status => _status;

    Map<String, List<Hot>> hotMap = Map();

    //顶部的tab选项卡
    List<IndexTableModel> _tabList;
    List<IndexTableModel> get tabList => _tabList;


    IndexTabPageModel _indexTabPageModel;
    IndexTabPageModel get indexTabPageModel => _indexTabPageModel;


    fetchTabList() async{
      _status = Status.LOADING;
      await HttpUtil.get(Api.INDEX_TAB_URL, null)
          .then((res){
            print(res);
            _tabList = List();
            if(res.statusCode == Response.SUCCESS){
              _status = Status.SUCCESS;
              var responseList = res.data;
              if(responseList != null){
                if(responseList.length == 0){
                  _status = Status.NO_RESULT;
                }else{
                  for(var i = 0; i< responseList.length; i++) {
                    IndexTableModel indexTableModel = IndexTableModel.fromJson(responseList[i]);
                    _tabList.add(indexTableModel);
                  }
                }
              }else{
                _status = Status.NO_RESULT;
              }
            }else{
              _status = Status.NO_RESULT;
            }
          })
          .catchError((onError) {
            _status = Status.ERROR;
          })
          .whenComplete(this.notifyListeners);
    }

//    static HomeModel.of(context) => ScopedModel.of<HomeModel>(context, rebuildOnChange: true);
  }