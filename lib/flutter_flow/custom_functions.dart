import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String reminderToString(
  int reminder,
  int medHist,
) {
  reminder *= 3600;
  int finalTime = ((reminder + medHist) * 1000);
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(finalTime);
  DateFormat formatter = DateFormat('h:mma');
  return formatter.format(dateTime).toUpperCase();
}

String lastTimeTaken(int var1) {
  return DateFormat('MMM dd HH:mm')
      .format(DateTime.fromMillisecondsSinceEpoch(var1 * 1000));
}

List<String> createPillSchedule(
  int reminder,
  List<int> medHistory,
  int pillCount,
) {
  List<String> pillEvents = [];
  int nextPill = medHistory[0];
  for (int i = 0; i < pillCount; i++) {
    nextPill += reminder;
    pillEvents.add(DateFormat('MMM dd HH:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(nextPill * 1000)));
  }
  return pillEvents;
}

int newCustomFunction(int reminder) {
  int unixNow = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;
  reminder *= 3600;
  int p = unixNow + reminder;
  return p;
}

bool isToday(
  int time,
  int today,
) {
  if (time >= today && time < (today + 86400)) {
    return true;
  }
  return false;
}

List<String> futurepills(
  int medHist,
  int reminder,
  int numofpills,
) {
  reminder *= 3600;
  List<String> futpills = [];
  int p = (medHist + reminder) * 1000;
  DateTime dateTime;
  String add = "";
  DateFormat formatter = DateFormat('h:mma');
  for (int i = 0; i < numofpills; i++) {
    dateTime = DateTime.fromMillisecondsSinceEpoch(p);
    add = formatter.format(dateTime).toUpperCase();
    futpills.add(add);
    p = p + reminder;
  }
  return futpills;
}
