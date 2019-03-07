
  /*
  *
  * 首页的TabPage
  *
  * */

  import 'package:flutter/material.dart';
  import 'package:app_dz/common/status.dart';
  import 'package:scoped_model/scoped_model.dart';
  import 'package:app_dz/models/state_models/home_state_model.dart';
  import 'package:app_dz/common/common_loading.dart';
  import 'package:app_dz/common/common_empty.dart';


  class IndexTabPage extends StatefulWidget {

    final int index;
    final String name;
    final String categoryId;
    final HomeStateModel stateModel;

    IndexTabPage({
      Key key,
      @required this.index,
      @required this.categoryId,
      @required this.name,
      @required this.stateModel,
    }) : super(key: key);


    @override
    _IndexTabPage createState() => _IndexTabPage();
  }


  class _IndexTabPage extends State<IndexTabPage> {


    @override
    void initState() {
    // TODO: implement initState
    super.initState();
  }



    _renderBody(HomeStateModel model) {
      return model.status == Status.LOADING ? CommonLoading() : model.status == Status.SUCCESS ? _renderListView(model.hotMap[widget.categoryId]) : EmptyComponent(status: model.status);
    }

    _renderListView(model) {
      return Container(
        child: Text('11111'),
      );
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return ScopedModelDescendant<HomeStateModel>(
          builder: (context, child, model){
            return _renderBody(model);
          }
      );
    }
  }