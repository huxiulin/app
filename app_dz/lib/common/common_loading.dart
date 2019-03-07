
  /*
  *
  * 共用的loading
  *
  * */

  import 'package:flutter/material.dart';
  import 'package:flutter_spinkit/flutter_spinkit.dart';


  class CommonLoading extends StatelessWidget {


    @override
    Widget build(BuildContext context) {
    // TODO: implement build
      return SpinKitFadingCircle(
        itemBuilder: (_, int index) {
          return DecoratedBox(
            decoration: new BoxDecoration(
              color: index.isEven ? Colors.red : Colors.blue,
            ),
          );
        },
      );
    }
  }