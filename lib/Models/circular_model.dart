import 'package:flutter/cupertino.dart';

class CircularModel extends ChangeNotifier {
  bool _circularStatus = false;
  set circularStatus(bool val) {
    this._circularStatus = val;
    notifyListeners();
  }

  get circularStatus => this._circularStatus;
}
