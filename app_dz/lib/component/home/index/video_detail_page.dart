
  /*
  *
  * 电影界面详情
  *
  * */

  import 'dart:ui';
  import 'package:shimmer/shimmer.dart';
  import 'package:app_dz/utils/devices_utils.dart';
  import 'package:flutter/material.dart';
  import 'package:scoped_model/scoped_model.dart';
  import 'package:app_dz/models/pood/video_model.dart';
  import 'package:app_dz/constants/video_table.dart';
  import 'package:app_dz/common/common_cache_image.dart';
  import 'package:app_dz/common/hero_cache_component.dart';
  import 'package:app_dz/models/state_models/video_detail_state_model.dart';

  class VideoDetailPage extends StatefulWidget {
    //接收参数
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

      videoDetailStateModel.fetchVideoDetail(widget.videoItem.id);


    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ScopedModel(
        model: videoDetailStateModel,
        child: Scaffold(
          body: DefaultTabController(
              length: VIDEO_TAB.length,
              child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context , bool innerBoxIsScrolled) {
                    return <Widget> [
                        SliverAppBar(
                          elevation: 0.0,
                          floating: false,
                          pinned: true,
                          expandedHeight: DevicesUtils.getScreenSize(context).width * 1.05,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Shimmer.fromColors(
                              child: Text('${widget.videoItem.name}', style: TextStyle(fontSize: 16.0)),
                              baseColor: Colors.white,
                              highlightColor: Theme.of(context).primaryColor,
                              period: Duration(milliseconds: 6000),
                            ),
                            centerTitle: true,
                            background: HeaderBackGroundCover(widget.videoItem),
                          ),
                          actions: <Widget>[],
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: DelegateAppBar(
                            TabBar(
                              tabs: VIDEO_TAB.map<Tab>((item) => Tab(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    item["icon"],
                                    SizedBox(width: 3.0),
                                    Text(item["name"], style: TextStyle(fontSize: 15.0))
                                  ],
                                ),
                              )).toList(),
                              labelColor: Theme.of(context).primaryColor,
                              labelStyle: TextStyle(fontSize: 16.5),
                              unselectedLabelColor: Color.fromARGB(255, 192, 193, 195),
                              indicatorColor: Theme.of(context).primaryColor,
                              indicatorWeight: 2,
                            )
                          ),
                        )
                    ];
                  },
                  body: Container(
                    child: ListView(
                      children: <Widget>[
                        Text('1111111')
                      ],
                    ),
                  )
              )
          ),
        ),
      );
    }
  }

  class DelegateAppBar extends SliverPersistentHeaderDelegate {

    final TabBar _tabBar;
    DelegateAppBar(this._tabBar);

    @override
    double get minExtent => _tabBar.preferredSize.height;

    @override
    double get maxExtent => _tabBar.preferredSize.height;

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      return Container(
          color: Colors.white,
          child: _tabBar
      );
    }

    @override
    bool shouldRebuild(DelegateAppBar oldDelegate) {
      return false;
    }
  }

  class HeaderBackGroundCover extends StatelessWidget {

    final VideoModel  video;
    HeaderBackGroundCover(this.video);

    @override
      Widget build(BuildContext context) {
      // TODO: implement build
      return Container(
        child: Stack(
          children: <Widget>[
//            Positioned.fill(
//              child: CacheImageComponent(
//                  imgUrl: video.thumbnail, boxFit: BoxFit.fill),
//            ),


            //毛玻璃
            Positioned(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black.withAlpha(60)),
                    ),
                )
            ),
            Positioned(
                left: 0.0,
                top: 60.0,
                right: 0.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 200.0,
                      height: 290.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: HeroComponent(
                        itemData: video,
                        imageWidth: 200.0,
                        imageHeight: 300.0,
                      ),
                      decoration: BoxDecoration(boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black.withAlpha(50),
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0),
                        BoxShadow(
                            color: Colors.black.withAlpha(20),
                            offset: Offset(0.0, 3.0),
                            blurRadius: 8.0)
                      ]),
                    )
                  ],
                ))
          ],
        ),
      );
    }

  }