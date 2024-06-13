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

Future<List<String>> createPillSchedul(
  int pillCount,
  int lastTimeTaken,
  int reminder,
) async {
  // Add your function code here!
  List<String> pillEvents = [];
  int nextPill = lastTimeTaken;
  reminder *= 3600;
  for (int i = 0; i < pillCount; i++) {
    nextPill += reminder;
    pillEvents.add(DateFormat('MMM dd HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(nextPill * 1000)));
  }
  return pillEvents;
}
