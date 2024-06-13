import 'package:flutter/material.dart';
import '/backend/backend.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _selectedDate = DateTime.fromMillisecondsSinceEpoch(1711350000000);
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  List<DocumentReference> _todayPills = [];
  List<DocumentReference> get todayPills => _todayPills;
  set todayPills(List<DocumentReference> value) {
    _todayPills = value;
  }

  void addToTodayPills(DocumentReference value) {
    todayPills.add(value);
  }

  void removeFromTodayPills(DocumentReference value) {
    todayPills.remove(value);
  }

  void removeAtIndexFromTodayPills(int index) {
    todayPills.removeAt(index);
  }

  void updateTodayPillsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    todayPills[index] = updateFn(_todayPills[index]);
  }

  void insertAtIndexInTodayPills(int index, DocumentReference value) {
    todayPills.insert(index, value);
  }
}
