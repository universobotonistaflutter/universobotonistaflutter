import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingPontosRecord extends FirestoreRecord {
  RankingPontosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nome_Participante" field.
  String? _nomeParticipante;
  String get nomeParticipante => _nomeParticipante ?? '';
  bool hasNomeParticipante() => _nomeParticipante != null;

  // "Clube_participante" field.
  String? _clubeParticipante;
  String get clubeParticipante => _clubeParticipante ?? '';
  bool hasClubeParticipante() => _clubeParticipante != null;

  // "Nome_modalidade" field.
  String? _nomeModalidade;
  String get nomeModalidade => _nomeModalidade ?? '';
  bool hasNomeModalidade() => _nomeModalidade != null;

  // "Federacao_Participante" field.
  String? _federacaoParticipante;
  String get federacaoParticipante => _federacaoParticipante ?? '';
  bool hasFederacaoParticipante() => _federacaoParticipante != null;

  // "Colocacao" field.
  int? _colocacao;
  int get colocacao => _colocacao ?? 0;
  bool hasColocacao() => _colocacao != null;

  // "Pontos" field.
  int? _pontos;
  int get pontos => _pontos ?? 0;
  bool hasPontos() => _pontos != null;

  // "pontos_no_campeonato" field.
  int? _pontosNoCampeonato;
  int get pontosNoCampeonato => _pontosNoCampeonato ?? 0;
  bool hasPontosNoCampeonato() => _pontosNoCampeonato != null;

  // "id_Modalidade" field.
  DocumentReference? _idModalidade;
  DocumentReference? get idModalidade => _idModalidade;
  bool hasIdModalidade() => _idModalidade != null;

  // "id_Clube" field.
  DocumentReference? _idClube;
  DocumentReference? get idClube => _idClube;
  bool hasIdClube() => _idClube != null;

  // "id_Federations" field.
  DocumentReference? _idFederations;
  DocumentReference? get idFederations => _idFederations;
  bool hasIdFederations() => _idFederations != null;

  // "id_Ranking" field.
  DocumentReference? _idRanking;
  DocumentReference? get idRanking => _idRanking;
  bool hasIdRanking() => _idRanking != null;

  // "id_Champion" field.
  DocumentReference? _idChampion;
  DocumentReference? get idChampion => _idChampion;
  bool hasIdChampion() => _idChampion != null;

  // "id_Participante" field.
  DocumentReference? _idParticipante;
  DocumentReference? get idParticipante => _idParticipante;
  bool hasIdParticipante() => _idParticipante != null;

  // "foto_participante" field.
  String? _fotoParticipante;
  String get fotoParticipante => _fotoParticipante ?? '';
  bool hasFotoParticipante() => _fotoParticipante != null;

  // "foto_Federations" field.
  String? _fotoFederations;
  String get fotoFederations => _fotoFederations ?? '';
  bool hasFotoFederations() => _fotoFederations != null;

  // "foto_clube" field.
  String? _fotoClube;
  String get fotoClube => _fotoClube ?? '';
  bool hasFotoClube() => _fotoClube != null;

  void _initializeFields() {
    _nomeParticipante = snapshotData['Nome_Participante'] as String?;
    _clubeParticipante = snapshotData['Clube_participante'] as String?;
    _nomeModalidade = snapshotData['Nome_modalidade'] as String?;
    _federacaoParticipante = snapshotData['Federacao_Participante'] as String?;
    _colocacao = castToType<int>(snapshotData['Colocacao']);
    _pontos = castToType<int>(snapshotData['Pontos']);
    _pontosNoCampeonato = castToType<int>(snapshotData['pontos_no_campeonato']);
    _idModalidade = snapshotData['id_Modalidade'] as DocumentReference?;
    _idClube = snapshotData['id_Clube'] as DocumentReference?;
    _idFederations = snapshotData['id_Federations'] as DocumentReference?;
    _idRanking = snapshotData['id_Ranking'] as DocumentReference?;
    _idChampion = snapshotData['id_Champion'] as DocumentReference?;
    _idParticipante = snapshotData['id_Participante'] as DocumentReference?;
    _fotoParticipante = snapshotData['foto_participante'] as String?;
    _fotoFederations = snapshotData['foto_Federations'] as String?;
    _fotoClube = snapshotData['foto_clube'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ranking_Pontos');

  static Stream<RankingPontosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingPontosRecord.fromSnapshot(s));

  static Future<RankingPontosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RankingPontosRecord.fromSnapshot(s));

  static RankingPontosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingPontosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingPontosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingPontosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingPontosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingPontosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingPontosRecordData({
  String? nomeParticipante,
  String? clubeParticipante,
  String? nomeModalidade,
  String? federacaoParticipante,
  int? colocacao,
  int? pontos,
  int? pontosNoCampeonato,
  DocumentReference? idModalidade,
  DocumentReference? idClube,
  DocumentReference? idFederations,
  DocumentReference? idRanking,
  DocumentReference? idChampion,
  DocumentReference? idParticipante,
  String? fotoParticipante,
  String? fotoFederations,
  String? fotoClube,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome_Participante': nomeParticipante,
      'Clube_participante': clubeParticipante,
      'Nome_modalidade': nomeModalidade,
      'Federacao_Participante': federacaoParticipante,
      'Colocacao': colocacao,
      'Pontos': pontos,
      'pontos_no_campeonato': pontosNoCampeonato,
      'id_Modalidade': idModalidade,
      'id_Clube': idClube,
      'id_Federations': idFederations,
      'id_Ranking': idRanking,
      'id_Champion': idChampion,
      'id_Participante': idParticipante,
      'foto_participante': fotoParticipante,
      'foto_Federations': fotoFederations,
      'foto_clube': fotoClube,
    }.withoutNulls,
  );

  return firestoreData;
}

class RankingPontosRecordDocumentEquality
    implements Equality<RankingPontosRecord> {
  const RankingPontosRecordDocumentEquality();

  @override
  bool equals(RankingPontosRecord? e1, RankingPontosRecord? e2) {
    return e1?.nomeParticipante == e2?.nomeParticipante &&
        e1?.clubeParticipante == e2?.clubeParticipante &&
        e1?.nomeModalidade == e2?.nomeModalidade &&
        e1?.federacaoParticipante == e2?.federacaoParticipante &&
        e1?.colocacao == e2?.colocacao &&
        e1?.pontos == e2?.pontos &&
        e1?.pontosNoCampeonato == e2?.pontosNoCampeonato &&
        e1?.idModalidade == e2?.idModalidade &&
        e1?.idClube == e2?.idClube &&
        e1?.idFederations == e2?.idFederations &&
        e1?.idRanking == e2?.idRanking &&
        e1?.idChampion == e2?.idChampion &&
        e1?.idParticipante == e2?.idParticipante &&
        e1?.fotoParticipante == e2?.fotoParticipante &&
        e1?.fotoFederations == e2?.fotoFederations &&
        e1?.fotoClube == e2?.fotoClube;
  }

  @override
  int hash(RankingPontosRecord? e) => const ListEquality().hash([
        e?.nomeParticipante,
        e?.clubeParticipante,
        e?.nomeModalidade,
        e?.federacaoParticipante,
        e?.colocacao,
        e?.pontos,
        e?.pontosNoCampeonato,
        e?.idModalidade,
        e?.idClube,
        e?.idFederations,
        e?.idRanking,
        e?.idChampion,
        e?.idParticipante,
        e?.fotoParticipante,
        e?.fotoFederations,
        e?.fotoClube
      ]);

  @override
  bool isValidKey(Object? o) => o is RankingPontosRecord;
}
