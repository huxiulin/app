
  /*
  *
  * 根据网络请求的数据结果现实的界面
  *
  * */

  import '../common/status.dart';
  import 'package:flutter/material.dart';


  class EmptyComponent extends StatelessWidget {

    Status status = Status.READY;

    EmptyComponent({@required this.status});

    @override
    Widget build(BuildContext context) {
    // TODO: implement build
      return Center(
        child: _renderBody(status),
      );
    }

    _renderBody(Status status) {
      return status == Status.NO_RESULT ? _renderNoResultMessage() : _renderErrorComponent();
    }


    //无数据
    _renderNoResultMessage() {
      return Column(
        children: <Widget>[
          Image.asset(
            'assets/images/icon_empty.webp',
            width: 160,
            height: 160,
            fit: BoxFit.cover,
          )
        ],
      );
    }


    //显示数据失败
    _renderErrorComponent() {
      return Column(
        children: <Widget>[
          Image.asset("assets/images/icon_load_error.png",
              width: 60.0,
              height: 60.0,
              fit: BoxFit.cover
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text("加载失败,请检查网络连接", style:TextStyle(color: Colors.grey)),
          )
        ],
      );
    }
  }