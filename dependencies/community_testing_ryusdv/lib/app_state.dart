import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
      if (prefs.containsKey('ff_notificationDT')) {
        try {
          final serializedData = prefs.getString('ff_notificationDT') ?? '{}';
          _notificationDT = NotificationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  NotificationStruct _notificationDT = NotificationStruct.fromSerializableMap(
      jsonDecode(
          '{\"title\":\"This is a test\",\"description\":\"This is test description\",\"style\":\"fillColored\",\"position\":\"topCenter\",\"type\":\"info\",\"progressBar\":\"true\",\"pauseOnHover\":\"false\"}'));
  NotificationStruct get notificationDT => _notificationDT;
  set notificationDT(NotificationStruct value) {
    _notificationDT = value;
    prefs.setString('ff_notificationDT', value.serialize());
  }

  void updateNotificationDTStruct(Function(NotificationStruct) updateFn) {
    updateFn(_notificationDT);
    prefs.setString('ff_notificationDT', _notificationDT.serialize());
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
