import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ClubeRecord extends FirestoreRecord {
  ClubeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "UF_Club" field.
  String? _uFClub;
  String get uFClub => _uFClub ?? '';
  bool hasUFClub() => _uFClub != null;

  // "usuariosClube" field.
  List<DocumentReference>? _usuariosClube;
  List<DocumentReference> get usuariosClube => _usuariosClube ?? const [];
  bool hasUsuariosClube() => _usuariosClube != null;

  // "idFederation" field.
  DocumentReference? _idFederation;
  DocumentReference? get idFederation => _idFederation;
  bool hasIdFederation() => _idFederation != null;

  void _initializeFields() {
    _nome = snapshotData['Nome'] as String?;
    _foto = snapshotData['Foto'] as String?;
    _uFClub = snapshotData['UF_Club'] as String?;
    _usuariosClube = getDataList(snapshotData['usuariosClube']);
    _idFederation = snapshotData['idFederation'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Clube');

  static Stream<ClubeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubeRecord.fromSnapshot(s));

  static Future<ClubeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubeRecord.fromSnapshot(s));

  static ClubeRecord fromSnapshot(DocumentSnapshot snapshot) => ClubeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubeRecordData({
  String? nome,
  String? foto,
  String? uFClub,
  DocumentReference? idFederation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome': nome,
      'Foto': foto,
      'UF_Club': uFClub,
      'idFederation': idFederation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubeRecordDocumentEquality implements Equality<ClubeRecord> {
  const ClubeRecordDocumentEquality();

  @override
  bool equals(ClubeRecord? e1, ClubeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.foto == e2?.foto &&
        e1?.uFClub == e2?.uFClub &&
        listEquality.equals(e1?.usuariosClube, e2?.usuariosClube) &&
        e1?.idFederation == e2?.idFederation;
  }

  @override
  int hash(ClubeRecord? e) => const ListEquality()
      .hash([e?.nome, e?.foto, e?.uFClub, e?.usuariosClube, e?.idFederation]);

  @override
  bool isValidKey(Object? o) => o is ClubeRecord;
}
