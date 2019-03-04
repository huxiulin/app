/*
*
* 主题model
*
* */

import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


//声明一个model类
abstract class ThemeSateModels extends Model {

  int _themeIndex; //声明一个int类型

  get themeIndex => _themeIndex;

  void changeThemeIndex(int themeIndex) async{
    themeIndex = _themeIndex;
    notifyListeners();
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('themeIndex', themeIndex);
  }

  //获取themeIndex
  Future<int> getTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int themeIndex = sp.get('themeIndeex');

    if( themeIndex !=  null ){
      return themeIndex;
    }
    return 0;
  }

}