import 'package:flutter/cupertino.dart';

class CircularModel extends ChangeNotifier {
  bool _circularStatus = false;
  bool _userAlreadyExistStatus = false;
  set circularStatus(bool val) {
    this._circularStatus = val;
    notifyListeners();
  }

  set userAlreadyExistStatus(bool val1) {
    this._userAlreadyExistStatus = val1;
    notifyListeners();
  }

  get userAlreadyExistStatus => this._userAlreadyExistStatus;

  get circularStatus => this._circularStatus;
}
