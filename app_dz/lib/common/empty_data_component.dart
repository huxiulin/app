
  /*
  *
  * 空视图组件
  * */

  import 'package:flutter/material.dart';

  class EmptyDataComponent extends StatelessWidget {

    const EmptyDataComponent();

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 0,
        height: 0,
      );
    }
  }