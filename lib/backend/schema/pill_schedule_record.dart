import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PillScheduleRecord extends FirestoreRecord {
  PillScheduleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "pill_name" field.
  String? _pillName;
  String get pillName => _pillName ?? '';
  bool hasPillName() => _pillName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "future_pills" field.
  List<int>? _futurePills;
  List<int> get futurePills => _futurePills ?? const [];
  bool hasFuturePills() => _futurePills != null;

  void _initializeFields() {
    _pillName = snapshotData['pill_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _futurePills = getDataList(snapshotData['future_pills']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pill_schedule');

  static Stream<PillScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PillScheduleRecord.fromSnapshot(s));

  static Future<PillScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PillScheduleRecord.fromSnapshot(s));

  static PillScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PillScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PillScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PillScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PillScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PillScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPillScheduleRecordData({
  String? pillName,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pill_name': pillName,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class PillScheduleRecordDocumentEquality
    implements Equality<PillScheduleRecord> {
  const PillScheduleRecordDocumentEquality();

  @override
  bool equals(PillScheduleRecord? e1, PillScheduleRecord? e2) {
    const listEquality = ListEquality();
    return e1?.pillName == e2?.pillName &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.futurePills, e2?.futurePills);
  }

  @override
  int hash(PillScheduleRecord? e) =>
      const ListEquality().hash([e?.pillName, e?.uid, e?.futurePills]);

  @override
  bool isValidKey(Object? o) => o is PillScheduleRecord;
}
