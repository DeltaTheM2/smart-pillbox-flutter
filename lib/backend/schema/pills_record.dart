import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PillsRecord extends FirestoreRecord {
  PillsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "med_name" field.
  String? _medName;
  String get medName => _medName ?? '';
  bool hasMedName() => _medName != null;

  // "med_count" field.
  int? _medCount;
  int get medCount => _medCount ?? 0;
  bool hasMedCount() => _medCount != null;

  // "med_history" field.
  List<int>? _medHistory;
  List<int> get medHistory => _medHistory ?? const [];
  bool hasMedHistory() => _medHistory != null;

  // "reminder" field.
  int? _reminder;
  int get reminder => _reminder ?? 0;
  bool hasReminder() => _reminder != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _medName = snapshotData['med_name'] as String?;
    _medCount = castToType<int>(snapshotData['med_count']);
    _medHistory = getDataList(snapshotData['med_history']);
    _reminder = castToType<int>(snapshotData['reminder']);
    _owner = snapshotData['owner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pills');

  static Stream<PillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PillsRecord.fromSnapshot(s));

  static Future<PillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PillsRecord.fromSnapshot(s));

  static PillsRecord fromSnapshot(DocumentSnapshot snapshot) => PillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PillsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PillsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPillsRecordData({
  String? medName,
  int? medCount,
  int? reminder,
  String? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'med_name': medName,
      'med_count': medCount,
      'reminder': reminder,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class PillsRecordDocumentEquality implements Equality<PillsRecord> {
  const PillsRecordDocumentEquality();

  @override
  bool equals(PillsRecord? e1, PillsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.medName == e2?.medName &&
        e1?.medCount == e2?.medCount &&
        listEquality.equals(e1?.medHistory, e2?.medHistory) &&
        e1?.reminder == e2?.reminder &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(PillsRecord? e) => const ListEquality()
      .hash([e?.medName, e?.medCount, e?.medHistory, e?.reminder, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is PillsRecord;
}
