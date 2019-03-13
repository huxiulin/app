  /*
  *
  * 路由配置
  *
  * */

  import 'package:fluro/fluro.dart';
  import 'package:flutter/material.dart';
  import 'package:app_dz/route/router_handlers.dart';


  class Routes {

    static String root = '/';
    static String videoDetail = '/VideoDetial';



    static void configureRoutes(Router router) {

    router.define(videoDetail, handler: videoDetailRouteHandler);
      
      router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String ,List<String>> params) {
          print('没找到此路由～');
        }
      );
    }
  }