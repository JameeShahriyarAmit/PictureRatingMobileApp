//! This class is fully given. Do nothing on it.
//! It is a generic class for the View model component of the MVVM architectural pattern.

import 'package:flutter/foundation.dart';

class Viewmodel with ChangeNotifier {
  bool _busy = false;

  get busy => _busy;

  void turnBusy() {
    _busy = true;
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }
}
