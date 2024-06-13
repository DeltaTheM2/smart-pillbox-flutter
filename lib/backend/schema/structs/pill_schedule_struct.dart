// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PillScheduleStruct extends FFFirebaseStruct {
  PillScheduleStruct({
    String? pillName,
    List<int>? pillSchedule,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pillName = pillName,
        _pillSchedule = pillSchedule,
        super(firestoreUtilData);

  // "pill_name" field.
  String? _pillName;
  String get pillName => _pillName ?? '';
  set pillName(String? val) => _pillName = val;

  bool hasPillName() => _pillName != null;

  // "pill_schedule" field.
  List<int>? _pillSchedule;
  List<int> get pillSchedule => _pillSchedule ?? const [];
  set pillSchedule(List<int>? val) => _pillSchedule = val;

  void updatePillSchedule(Function(List<int>) updateFn) {
    updateFn(pillSchedule ??= []);
  }

  bool hasPillSchedule() => _pillSchedule != null;

  static PillScheduleStruct fromMap(Map<String, dynamic> data) =>
      PillScheduleStruct(
        pillName: data['pill_name'] as String?,
        pillSchedule: getDataList(data['pill_schedule']),
      );

  static PillScheduleStruct? maybeFromMap(dynamic data) => data is Map
      ? PillScheduleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pill_name': _pillName,
        'pill_schedule': _pillSchedule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pill_name': serializeParam(
          _pillName,
          ParamType.String,
        ),
        'pill_schedule': serializeParam(
          _pillSchedule,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static PillScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      PillScheduleStruct(
        pillName: deserializeParam(
          data['pill_name'],
          ParamType.String,
          false,
        ),
        pillSchedule: deserializeParam<int>(
          data['pill_schedule'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'PillScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PillScheduleStruct &&
        pillName == other.pillName &&
        listEquality.equals(pillSchedule, other.pillSchedule);
  }

  @override
  int get hashCode => const ListEquality().hash([pillName, pillSchedule]);
}

PillScheduleStruct createPillScheduleStruct({
  String? pillName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PillScheduleStruct(
      pillName: pillName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PillScheduleStruct? updatePillScheduleStruct(
  PillScheduleStruct? pillScheduleStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    pillScheduleStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPillScheduleStructData(
  Map<String, dynamic> firestoreData,
  PillScheduleStruct? pillScheduleStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (pillScheduleStruct == null) {
    return;
  }
  if (pillScheduleStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && pillScheduleStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pillScheduleStructData =
      getPillScheduleFirestoreData(pillScheduleStruct, forFieldValue);
  final nestedData =
      pillScheduleStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      pillScheduleStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPillScheduleFirestoreData(
  PillScheduleStruct? pillScheduleStruct, [
  bool forFieldValue = false,
]) {
  if (pillScheduleStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(pillScheduleStruct.toMap());

  // Add any Firestore field values
  pillScheduleStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPillScheduleListFirestoreData(
  List<PillScheduleStruct>? pillScheduleStructs,
) =>
    pillScheduleStructs
        ?.map((e) => getPillScheduleFirestoreData(e, true))
        .toList() ??
    [];
