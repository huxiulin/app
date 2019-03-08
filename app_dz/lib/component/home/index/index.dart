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
import 'package:app_dz/common/common_refresh.dart';
import 'package:flutter_refresh/flutter_refresh.dart';
import '../index/index_tab_page.dart';
import 'package:app_dz/common/status.dart';



class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}


class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  TabController _tabController;
  HomeStateModel homeStateModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getIndexModel();
    initTabBarController();

  }


  initTabBarController() async{
    await homeStateModel.fetchTabBarList();
    _tabController = new TabController(vsync: this, length: homeStateModel.tabList.length);
    _tabController.animateTo(1);
  }

  _getIndexModel() {
    if(homeStateModel == null) {
      homeStateModel = HomeStateModel();
    }
    return homeStateModel;
  }



  _renderBody(HomeStateModel model){
    print(model.status);
    return model.status == Status.LOADING ? CommonLoading() : model.status == Status.SUCCESS ? _renderSuccess(model) : EmptyComponent(status: model.status);
  }


  /*
  * 请求成功从model中拿取数据
  * */
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
//              indicator: TabBarIndictorComponent(context: context,bgColor: Theme.of(context).primaryColor),
                tabs: model.tabList == null ? [] : model.tabList.map<Tab>((tab) => Tab(text: tab.name)).toList(),
              )
          )
        ],
      ),
    );
  }

//  根据切换的tab显示不同的界面
  _renderBodyTabView(HomeStateModel model) {
    return Expanded(
//        child: new Refresh(
//          onFooterRefresh: onFooterRefresh,
//          onHeaderRefresh: onHeaderRefresh,
//          childBuilder: (BuildContext context, {ScrollController controller, ScrollPhysics physics}){
//            return TabBarView(
//              children: List.generate(model.tabList == null ? 0 : model.tabList.length, (index){
//                return IndexTabPage(index: index, categoryId: model.tabList[index].id, name: model.tabList[index].name, stateModel: model);
//              }),
//              controller: _tabController,
//              physics: physics,
//            );
//          },
//        ),
      child: TabBarView(
          children: List.generate(model.tabList == null ? 0 : model.tabList.length, (index){
            return IndexTabPage(index: index, categoryId: model.tabList[index].id, name: model.tabList[index].name, stateModel: model);
          }),
          controller: _tabController,
          )
    );
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {});
    });
  }


  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModel<HomeStateModel>(
      model: homeStateModel,
      child: ScopedModelDescendant<HomeStateModel>(
          builder:(context,child,model){
            return DefaultTabController(
                length: model.tabList == null ? 0 : model.tabList.length,
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


