  /*
  *
  * 路由配置
  *
  * */

  import 'package:fluro/fluro.dart';
  import 'package:flutter/material.dart';


  class Routes {

    static String root = '/';

    static void configureRoutes(Router router) {

      router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
          print('没找到此路由～');
        }
      );
    }
  }