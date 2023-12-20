import 'package:code_me_hub/model/bottum_nav_item/botom_nav_item.dart';
import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  BottomNavItem _currentItem = BottomNavItem.Home;

  BottomNavItem get currentItem => _currentItem;

  void setCurrentItem(BottomNavItem item) {
    _currentItem = item;
    notifyListeners();
  }
}