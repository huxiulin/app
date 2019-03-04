/*
*
* 电影
*
* */

import 'package:flutter/material.dart';

class MovieStatePage extends StatefulWidget {

  @override
  _MovieStatePage createState() => _MovieStatePage();
}


class _MovieStatePage extends State<MovieStatePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('电影'),
      ),
      body: new Container(
        child: Text('33333'),
      ),
    );
  }
}
