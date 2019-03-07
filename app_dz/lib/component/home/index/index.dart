/*
*
* 首页
*
* */




import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:app_dz/models/state_models/home_state_model.dart';
import 'package:app_dz/common/common_empty.dart';
import 'package:app_dz/common/common_loading.dart';
import '../index/index_tab_page.dart';



class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}


class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  TabController _tabController;
  HomeStateModel homeStateModel;

//
//  List<Tab> _tabs = [
//    new Tab(text: "test1",),
//    new Tab(text: "test2",),
//    new Tab(text: "test3",),
//    new Tab(text: "test4",),
//    new Tab(text: "test5",),
//  ];
//  List<Widget> _tabViews = [
//    new Center(child: new Text("test1",style: new TextStyle(fontSize: 24),),),
//    new Center(child: new Text("test2",style: new TextStyle(fontSize: 24),),),
//    new Center(child: new Text("test3",style: new TextStyle(fontSize: 24),),),
//    new Center(child: new Text("test4",style: new TextStyle(fontSize: 24),),),
//    new Center(child: new Text("test5",style: new TextStyle(fontSize: 24),),),
//  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getIndexModel();

    initTabBarController();

  }


  initTabBarController() async{
    await homeStateModel.fetchTabList();
    _tabController = new TabController(vsync: this, length: homeStateModel.tabList.length);
    _tabController.animateTo(1);
  }

  _getIndexModel() {

    if(homeStateModel == null) {
      homeStateModel = HomeStateModel();
    }
    return homeStateModel;
  }


  //根据接口返回来的数据model
  _renderBody(HomeStateModel model){

//    return model.status == Status.LOADING ? CommonLoading() : model.status == Status.SUCCESS ? _renderSuccess(model) : EmptyComponent(status: model.status);
      return _renderSuccess(model);
  }


  //请求成功从model中拿取数据
  _renderSuccess(HomeStateModel model) {
    return new  Container(
      child: Column(
        children: <Widget>[
          _renderBodyTab(model),
          _renderBodyTabView(model)
        ],
      ),
    );
  }

  //头部可滚动的tab选项卡
  _renderBodyTab(HomeStateModel model) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                labelColor: Color.fromARGB(255, 51, 51, 51),
                unselectedLabelColor: Color.fromARGB(255,192, 193, 195),
//                tabs: <Widget>[
//                  Tab(text: '选择性1',),
//                  Tab(text: '选择性1',)
//                ],
//                indicator: TabBarIndictorComponent(context: context,bgColor: Theme.of(context).primaryColor),
                tabs: model.tabList.map<Tab>((tab) => Tab(text: tab.name)).toList(),

              )
          )
        ],
      ),
    );
  }

//  根据切换的tab显示不同的界面
  _renderBodyTabView(HomeStateModel model) {
    return Expanded(
        child: TabBarView(
//          children: List.generate(model.tabList.length, (index) {
//            return
//          }),
          children: <Widget>[
            Text('11111'),
            Text('11111'),
            Text('11111'),
            Text('11111'),
            Text('11111'),
          ],
          controller: _tabController,
        )
    );
  }


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
//    initTabBarController();
    // TODO: implement build
    return ScopedModel<HomeStateModel>(
      model: homeStateModel,
      child: ScopedModelDescendant<HomeStateModel>(
          builder:(context,child,model){
            return DefaultTabController(
                length: model.tabList.length,
                child: Scaffold(
                    appBar: AppBar(
                    centerTitle: true,
                    title: Text('首页', style: TextStyle(fontFamily: 'Lobster')),
                  ),
                  body: _renderBody(model),
                )
            );
          }
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }
}


