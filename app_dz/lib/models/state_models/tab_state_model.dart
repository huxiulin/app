/*
*
* tab的model类继承
*
* */

import './base_state_model.dart';

class TabStateModel extends BaseStateModel {

  int currentTabIndex = 0;

  get tabBarCurrentIndex => currentTabIndex;

  void changeTabBarIndex (int currentIndex) {

    currentTabIndex = currentIndex;
    notifyListeners();
  }
}