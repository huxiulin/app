
  /*
  *
  * 首页的TabPage
  *
  * */



  import 'package:app_dz/config/Application.dart';
  import 'package:flutter/material.dart';
  import 'package:app_dz/common/status.dart';
  import 'package:scoped_model/scoped_model.dart';
  import 'package:app_dz/common/empty_data_component.dart';
  import 'package:app_dz/models/state_models/home_state_model.dart';
  import 'package:app_dz/common/common_loading.dart';
  import 'package:app_dz/common/common_empty.dart';
  import 'package:app_dz/models/pood/index_tab_page.dart';
  import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


  class IndexTabPage extends StatefulWidget {

    final int index;
    final String name;
    final String categoryId;
    final HomeStateModel stateModel;

    IndexTabPage({
      Key key,
      @required this.index,
      @required this.categoryId,
      @required this.name,
      @required this.stateModel,
    }) : super(key: key);


    @override
    _IndexTabPage createState() => _IndexTabPage();
  }


  class _IndexTabPage extends State<IndexTabPage> {


    @override
    void initState() {
    // TODO: implement initState
    super.initState();
    widget.stateModel.fetchTabDataList(widget.categoryId);
  }


    _renderBody(HomeStateModel model) {
//      print(model.hotMap[widget.categoryId]);

//      return model.status == Status.LOADING ? CommonLoading() : model.status == Status.SUCCESS ? _renderListView(model.hotMap[widget.categoryId]) : EmptyComponent(status: model.status);
      return _renderListView(model.hotMap[widget.categoryId] == null ? [] : model.hotMap[widget.categoryId]);
    }

    _renderListView(List<Hot> list) {

      if(list.length != null) {
        return StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemBuilder: (BuildContext context, int index) => new Container(
              child: new Text('12111111'),
            ),
            itemCount: list.length == null ? 0 : list.length,
            staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
        );


//        return StaggeredGridView.countBuilder(
//          crossAxisCount: 4,
//          itemCount: list.length,
//          itemBuilder: (BuildContext context, int index) =>
//              _ItemComponent(itemData: list[index]),
//          staggeredTileBuilder: (int index) {
//            return StaggeredTile.count(2, 2.6);
//          }, // 列宽 和 高
//          mainAxisSpacing: 4.0,
//          crossAxisSpacing: 4.0,
//          physics: BouncingScrollPhysics(),
//          padding: EdgeInsets.only(
//            top: 4.0,
//            bottom: 4.0,
//          ),
//        );

      }
      return EmptyDataComponent();
    }


    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ScopedModelDescendant<HomeStateModel>(
          builder: (context, child, model){
            return _renderBody(model);
          }
      );
    }
  }

//  class _ItemComponent extends StatelessWidget {
//
//    final Hot itemData;
//    const _ItemComponent({this.itemData});
//
//    @override
//    Widget build(BuildContext context) {
//
//      return Stack(
//        children: <Widget>[
//          // fill 默认都为 0
////          Positioned.fill(
////              child: HeroImageComponent(imageItem:  VideoModel(
////                  id:itemData.id,
////                  thumbnail: itemData.thumbnail,
////                  generatedAt: itemData.generatedAt,
////                  latest: itemData.latest
////              ))),
//          // 集数
//          Positioned(
//            top: 0.0,
//            left: 0.0,
//            child: Container(
//              height: 20.0,
//              padding: EdgeInsets.symmetric(horizontal: 5.0),
//              color: Color.fromRGBO(0, 0, 0, 0.5),
//              child: Center(
//                child: Text(
//                  itemData.latest,
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 10.0
//                  ),
//                ),
//              ),
//            ),
//          ),
//          // 名称
//          Positioned(
//            left: 0.0,
//            right: 0.0,
//            bottom: 0.0,
//            child: Container(
//                height: 26.0,
//                padding: EdgeInsets.symmetric(horizontal: 5.0),
//                color: Color.fromRGBO(0, 0, 0, 0.5),
//                child: Center(
//                  child: Text(
//                    itemData.name,
//                    overflow: TextOverflow.ellipsis,
//                    maxLines: 1,
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 13.0
//                    ),
//                  ),
//                )
//            ),
//          ),
//          Positioned.fill(
//              child: MaterialButton(
//                onPressed: () {
//                  //  跳转视频详情
//                  Hot video = itemData;
////                  Application.navigateTo(
////                      context: context,
////                      route: "${Routes.videoDetail}?name=${Uri.encodeComponent(video.name)}&thumbnail=${Uri.encodeComponent(video.thumbnail)}&timestamp=${null}&id=${video.id}&latest=${Uri.encodeComponent(video.latest)}&generatedAt=${video.generatedAt}"
////                  );
//                },
//              )
//          )
//        ],
//      );
//    }
//  }
