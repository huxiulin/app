/**
 *
 * 项目主目录
 *
 */

import 'package:flutter/material.dart';
//import 'package:fluro/fluro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:app_dz/models/state_models/index_state_model.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app_dz/constants/theme.dart';
import 'package:app_dz/component/home/home_page.dart';


void main() async {

  int themeIndex = await getThemeIndex();
  runApp(MyApp(themeIndex));
}

Future<int> getThemeIndex() async {

  SharedPreferences sp = await SharedPreferences.getInstance();
  int themeIndex = sp.getInt('themeIndex');

  //通过themeIndex来改变app的全局使用的颜色
  if( themeIndex != null ) {
    return themeIndex;
  }
  return 8;
}

class MyApp extends StatefulWidget {

  final int themeIndex;

  MyApp(this.themeIndex);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {

  dynamic subscription;
  IndexStateModel indexStateModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexStateModel = IndexStateModel();
  }

  void initListener() {
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      String networkResult = "";
      switch (result) {
        case ConnectivityResult.mobile:
          networkResult = "当前处于移动网络";
          break;
        case ConnectivityResult.wifi:
          networkResult = "当前处于wifi";
          break;
        case ConnectivityResult.none:
          networkResult = "当前没有网络连接！";
          break;
        default:
          break;
      }

      Fluttertoast.showToast(
          msg: networkResult,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: themeList[indexStateModel.themeIndex != null
              ? indexStateModel.themeIndex
              : widget.themeIndex],
          textColor: Colors.white,
          fontSize: 16.0
      );
    });

    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
//    initListener();
    // TODO: implement build
    return new ScopedModel<IndexStateModel>(
        model: indexStateModel,
        child: new ScopedModelDescendant<IndexStateModel>(
            builder: (context, child, model) {
              return new MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  platform: TargetPlatform.iOS,
                  primaryColor: themeList[model.themeIndex != null ? model.themeIndex : widget.themeIndex],
                ),
                home: HomePage(),
              );
            }
        )
    );
  }
}
