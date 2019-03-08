
  /*
  *
  * 封装上拉加载 下拉刷新
  * */

  import 'package:flutter/material.dart';
  import 'package:pull_to_refresh/pull_to_refresh.dart';


  abstract class CommonRefresh<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin {

    Widget footerCreate(BuildContext context, int mode) {
      return new ClassicIndicator(
        mode: mode,
        refreshingText: '加载中...',
        idleIcon: const Icon(Icons.arrow_upward),
        idleText: '上拉加载更多...',
        noDataText: "没有更多",
      );
    }
    Widget headerCreate(BuildContext context, int mode) {
      return new ClassicIndicator(
        mode: mode,
        refreshingText: '加载中...',
        idleIcon: const Icon(Icons.arrow_downward),
        idleText: '下拉刷新...',
        releaseText: "刷新时释放",
        completeText: "刷新完成",
      );
    }
  }