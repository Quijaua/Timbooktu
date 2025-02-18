import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _returnDateDays = prefs.getInt('ff_returnDateDays') ?? _returnDateDays;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _updateUser = false;
  bool get updateUser => _updateUser;
  set updateUser(bool value) {
    _updateUser = value;
  }

  int _returnDateDays = 15;
  int get returnDateDays => _returnDateDays;
  set returnDateDays(int value) {
    _returnDateDays = value;
    prefs.setInt('ff_returnDateDays', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
