import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingRecord extends FirestoreRecord {
  RankingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nome_ranking" field.
  String? _nomeRanking;
  String get nomeRanking => _nomeRanking ?? '';
  bool hasNomeRanking() => _nomeRanking != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "id_clube" field.
  DocumentReference? _idClube;
  DocumentReference? get idClube => _idClube;
  bool hasIdClube() => _idClube != null;

  // "id_user" field.
  DocumentReference? _idUser;
  DocumentReference? get idUser => _idUser;
  bool hasIdUser() => _idUser != null;

  // "id_modalidade" field.
  DocumentReference? _idModalidade;
  DocumentReference? get idModalidade => _idModalidade;
  bool hasIdModalidade() => _idModalidade != null;

  // "tipo_torneio" field.
  String? _tipoTorneio;
  String get tipoTorneio => _tipoTorneio ?? '';
  bool hasTipoTorneio() => _tipoTorneio != null;

  // "nome_modalidade" field.
  String? _nomeModalidade;
  String get nomeModalidade => _nomeModalidade ?? '';
  bool hasNomeModalidade() => _nomeModalidade != null;

  // "nome_clube" field.
  String? _nomeClube;
  String get nomeClube => _nomeClube ?? '';
  bool hasNomeClube() => _nomeClube != null;

  // "foto_federacao" field.
  String? _fotoFederacao;
  String get fotoFederacao => _fotoFederacao ?? '';
  bool hasFotoFederacao() => _fotoFederacao != null;

  // "Nome_federacao" field.
  String? _nomeFederacao;
  String get nomeFederacao => _nomeFederacao ?? '';
  bool hasNomeFederacao() => _nomeFederacao != null;

  // "foto_modalidade" field.
  String? _fotoModalidade;
  String get fotoModalidade => _fotoModalidade ?? '';
  bool hasFotoModalidade() => _fotoModalidade != null;

  // "id_champion" field.
  List<String>? _idChampion;
  List<String> get idChampion => _idChampion ?? const [];
  bool hasIdChampion() => _idChampion != null;

  // "foto_clube" field.
  String? _fotoClube;
  String get fotoClube => _fotoClube ?? '';
  bool hasFotoClube() => _fotoClube != null;

  // "Stauts" field.
  int? _stauts;
  int get stauts => _stauts ?? 0;
  bool hasStauts() => _stauts != null;

  // "id_federation" field.
  DocumentReference? _idFederation;
  DocumentReference? get idFederation => _idFederation;
  bool hasIdFederation() => _idFederation != null;

  // "Pontos_Corridos" field.
  bool? _pontosCorridos;
  bool get pontosCorridos => _pontosCorridos ?? false;
  bool hasPontosCorridos() => _pontosCorridos != null;

  void _initializeFields() {
    _nomeRanking = snapshotData['Nome_ranking'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _idClube = snapshotData['id_clube'] as DocumentReference?;
    _idUser = snapshotData['id_user'] as DocumentReference?;
    _idModalidade = snapshotData['id_modalidade'] as DocumentReference?;
    _tipoTorneio = snapshotData['tipo_torneio'] as String?;
    _nomeModalidade = snapshotData['nome_modalidade'] as String?;
    _nomeClube = snapshotData['nome_clube'] as String?;
    _fotoFederacao = snapshotData['foto_federacao'] as String?;
    _nomeFederacao = snapshotData['Nome_federacao'] as String?;
    _fotoModalidade = snapshotData['foto_modalidade'] as String?;
    _idChampion = getDataList(snapshotData['id_champion']);
    _fotoClube = snapshotData['foto_clube'] as String?;
    _stauts = castToType<int>(snapshotData['Stauts']);
    _idFederation = snapshotData['id_federation'] as DocumentReference?;
    _pontosCorridos = snapshotData['Pontos_Corridos'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ranking');

  static Stream<RankingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingRecord.fromSnapshot(s));

  static Future<RankingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RankingRecord.fromSnapshot(s));

  static RankingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingRecordData({
  String? nomeRanking,
  DateTime? data,
  DocumentReference? idClube,
  DocumentReference? idUser,
  DocumentReference? idModalidade,
  String? tipoTorneio,
  String? nomeModalidade,
  String? nomeClube,
  String? fotoFederacao,
  String? nomeFederacao,
  String? fotoModalidade,
  String? fotoClube,
  int? stauts,
  DocumentReference? idFederation,
  bool? pontosCorridos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome_ranking': nomeRanking,
      'data': data,
      'id_clube': idClube,
      'id_user': idUser,
      'id_modalidade': idModalidade,
      'tipo_torneio': tipoTorneio,
      'nome_modalidade': nomeModalidade,
      'nome_clube': nomeClube,
      'foto_federacao': fotoFederacao,
      'Nome_federacao': nomeFederacao,
      'foto_modalidade': fotoModalidade,
      'foto_clube': fotoClube,
      'Stauts': stauts,
      'id_federation': idFederation,
      'Pontos_Corridos': pontosCorridos,
    }.withoutNulls,
  );

  return firestoreData;
}

class RankingRecordDocumentEquality implements Equality<RankingRecord> {
  const RankingRecordDocumentEquality();

  @override
  bool equals(RankingRecord? e1, RankingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomeRanking == e2?.nomeRanking &&
        e1?.data == e2?.data &&
        e1?.idClube == e2?.idClube &&
        e1?.idUser == e2?.idUser &&
        e1?.idModalidade == e2?.idModalidade &&
        e1?.tipoTorneio == e2?.tipoTorneio &&
        e1?.nomeModalidade == e2?.nomeModalidade &&
        e1?.nomeClube == e2?.nomeClube &&
        e1?.fotoFederacao == e2?.fotoFederacao &&
        e1?.nomeFederacao == e2?.nomeFederacao &&
        e1?.fotoModalidade == e2?.fotoModalidade &&
        listEquality.equals(e1?.idChampion, e2?.idChampion) &&
        e1?.fotoClube == e2?.fotoClube &&
        e1?.stauts == e2?.stauts &&
        e1?.idFederation == e2?.idFederation &&
        e1?.pontosCorridos == e2?.pontosCorridos;
  }

  @override
  int hash(RankingRecord? e) => const ListEquality().hash([
        e?.nomeRanking,
        e?.data,
        e?.idClube,
        e?.idUser,
        e?.idModalidade,
        e?.tipoTorneio,
        e?.nomeModalidade,
        e?.nomeClube,
        e?.fotoFederacao,
        e?.nomeFederacao,
        e?.fotoModalidade,
        e?.idChampion,
        e?.fotoClube,
        e?.stauts,
        e?.idFederation,
        e?.pontosCorridos
      ]);

  @override
  bool isValidKey(Object? o) => o is RankingRecord;
}
