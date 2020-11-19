import 'package:flutter/material.dart';
import 'package:swiggy_app/pages/cart_page.dart';
import 'package:swiggy_app/pages/home_page.dart';
import 'package:swiggy_app/pages/profile_page.dart';
import 'package:swiggy_app/pages/search_page.dart';

class BottomNavModel extends ChangeNotifier {
  int _currentTab = 0;
  List<Widget> _pages = [HomePage(), SearchPage(), CartPage(), ProfilePage()];

  set currentTab(int tab) {
    this._currentTab = tab;
    notifyListeners();
  }

  get currentTab => this._currentTab;
  get currentPage => this._pages[this._currentTab];
}
