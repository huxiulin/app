/*
*
* 首页
*
* */


import 'movie/movie.dart';
import 'mine/mine.dart';
import 'index/index.dart';
import 'popular/popular.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:app_dz/constants/index_tab.dart';
import 'package:app_dz/models/state_models/tab_state_model.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {

  TabStateModel tabStateModel;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabStateModel = TabStateModel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null ,
      child: ScopedModel<TabStateModel>(
          model: tabStateModel,
          child: ScopedModelDescendant<TabStateModel>(
              builder: (context , child ,model) {
                return Scaffold(
                  body: _renderTabContent(model), //对应的TabBar显示的对应
                  bottomNavigationBar: _renderBottomContent(model), //底部tabBar
                );
              }
          )
      ),
    );
  }
}

  _renderTabContent(TabStateModel model) {
    print(model.tabBarCurrentIndex);
    return IndexedStack(
      index: model.tabBarCurrentIndex,
      children: <Widget>[
        IndexPage(),
        PopularStatePage(),
        MovieStatePage(),
        MinePage(),
      ],
    );

  }


  _renderBottomContent(TabStateModel model) {
    return BottomNavigationBar(
      items: _renderBottomItems(model.tabBarCurrentIndex),
      onTap: (index) => model.changeTabBarIndex(index),
      currentIndex: model.tabBarCurrentIndex,
      type: BottomNavigationBarType.fixed,
    );
  }


  //底部的item进行封装操作
  List<BottomNavigationBarItem> _renderBottomItems(int index) {
    return [
      BottomNavigationBarItem(icon: _getBottomNavigateIcon(0, index), title: _getBottomNavigateTitle(0, index)),
      BottomNavigationBarItem(icon: _getBottomNavigateIcon(1, index), title: _getBottomNavigateTitle(1, index)),
      BottomNavigationBarItem(icon: _getBottomNavigateIcon(2, index), title: _getBottomNavigateTitle(2, index)),
      BottomNavigationBarItem(icon: _getBottomNavigateIcon(3, index), title: _getBottomNavigateTitle(3, index)),
    ];
  }




  _getTabBarIcon(String path , Color color) {
    return Image.asset(path, width: 25.0, height: 25.0, color: color);
  }


  /*
  * BottomIcon
  * */

  Image _getBottomNavigateIcon(index , currentIndex) {
    if(index == currentIndex) {
      return _getTabBarIcon(tabIcon[index][1], Colors.blue);
    }
    return _getTabBarIcon(tabIcon[index][0], null);
  }

  /*
  * BottomText
  * */

  Text _getBottomNavigateTitle(index , currentIndex) {
    return Text(tabTitle[index], style: TextStyle(color: index == currentIndex ? Colors.blue : Colors.grey[500]));
  }
