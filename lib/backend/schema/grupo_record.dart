import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class GrupoRecord extends FirestoreRecord {
  GrupoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tituloGrupo" field.
  String? _tituloGrupo;
  String get tituloGrupo => _tituloGrupo ?? '';
  bool hasTituloGrupo() => _tituloGrupo != null;

  // "idFase" field.
  DocumentReference? _idFase;
  DocumentReference? get idFase => _idFase;
  bool hasIdFase() => _idFase != null;

  // "idChampion" field.
  DocumentReference? _idChampion;
  DocumentReference? get idChampion => _idChampion;
  bool hasIdChampion() => _idChampion != null;

  // "listaParticipante" field.
  List<DocumentReference>? _listaParticipante;
  List<DocumentReference> get listaParticipante =>
      _listaParticipante ?? const [];
  bool hasListaParticipante() => _listaParticipante != null;

  // "listaParticipanteIds" field.
  List<DocumentReference>? _listaParticipanteIds;
  List<DocumentReference> get listaParticipanteIds =>
      _listaParticipanteIds ?? const [];
  bool hasListaParticipanteIds() => _listaParticipanteIds != null;

  void _initializeFields() {
    _tituloGrupo = snapshotData['tituloGrupo'] as String?;
    _idFase = snapshotData['idFase'] as DocumentReference?;
    _idChampion = snapshotData['idChampion'] as DocumentReference?;
    _listaParticipante = getDataList(snapshotData['listaParticipante']);
    _listaParticipanteIds = getDataList(snapshotData['listaParticipanteIds']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Grupo');

  static Stream<GrupoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GrupoRecord.fromSnapshot(s));

  static Future<GrupoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GrupoRecord.fromSnapshot(s));

  static GrupoRecord fromSnapshot(DocumentSnapshot snapshot) => GrupoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrupoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrupoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrupoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrupoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrupoRecordData({
  String? tituloGrupo,
  DocumentReference? idFase,
  DocumentReference? idChampion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloGrupo': tituloGrupo,
      'idFase': idFase,
      'idChampion': idChampion,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrupoRecordDocumentEquality implements Equality<GrupoRecord> {
  const GrupoRecordDocumentEquality();

  @override
  bool equals(GrupoRecord? e1, GrupoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tituloGrupo == e2?.tituloGrupo &&
        e1?.idFase == e2?.idFase &&
        e1?.idChampion == e2?.idChampion &&
        listEquality.equals(e1?.listaParticipante, e2?.listaParticipante) &&
        listEquality.equals(e1?.listaParticipanteIds, e2?.listaParticipanteIds);
  }

  @override
  int hash(GrupoRecord? e) => const ListEquality().hash([
        e?.tituloGrupo,
        e?.idFase,
        e?.idChampion,
        e?.listaParticipante,
        e?.listaParticipanteIds
      ]);

  @override
  bool isValidKey(Object? o) => o is GrupoRecord;
}
