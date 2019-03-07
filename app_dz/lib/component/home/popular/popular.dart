/*
*
* 详情
*
* */

import 'package:flutter/material.dart';

class PopularStatePage extends StatefulWidget {

  @override
  _PopularStatePage createState() => _PopularStatePage();
}


class _PopularStatePage extends State<PopularStatePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('精选'),
      ),
      body: new Container(
        child: Text('2222'),
      ),
    );
  }
}
