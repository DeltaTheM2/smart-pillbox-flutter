// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> todayPills(
  DocumentReference pillSchedule,
  int calendarSelectedDay,
) async {
  // Add your function code here!
  DocumentReference? todaySchedule;

  // Calculate the start and end of the selected day in UNIX timestamp
  int startOfDay = calendarSelectedDay;
  int endOfDay = calendarSelectedDay + 86400;

  // Asynchronously fetch document data for each DocumentReference

  var docSnapshot = await pillSchedule.get();
  var docData = docSnapshot.data() as Map<String, dynamic>?;

  if (docData != null && docData.containsKey('futurepills')) {
    List<int> futurepills = List<int>.from(docData['futurepills']);

    // Check if any of the futurepills falls within the selected day
    bool hasPillForTheDay = futurepills
        .any((timestamp) => timestamp >= startOfDay && timestamp <= endOfDay);

    // If yes, add this document reference to the result list
  }

  return todaySchedule;
}
