/*
*
* 首页
*
* */

import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {

  @override
  _IndexPageState createState() => _IndexPageState();
}


class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: new Container(
        child: Text('111111'),
      ),
    );
  }
}
