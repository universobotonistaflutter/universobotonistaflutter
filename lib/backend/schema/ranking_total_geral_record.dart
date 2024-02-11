import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RankingTotalGeralRecord extends FirestoreRecord {
  RankingTotalGeralRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nome_Participante" field.
  String? _nomeParticipante;
  String get nomeParticipante => _nomeParticipante ?? '';
  bool hasNomeParticipante() => _nomeParticipante != null;

  // "Foto_Participante" field.
  String? _fotoParticipante;
  String get fotoParticipante => _fotoParticipante ?? '';
  bool hasFotoParticipante() => _fotoParticipante != null;

  // "Nome_Federacao" field.
  String? _nomeFederacao;
  String get nomeFederacao => _nomeFederacao ?? '';
  bool hasNomeFederacao() => _nomeFederacao != null;

  // "Foto_Federacao" field.
  String? _fotoFederacao;
  String get fotoFederacao => _fotoFederacao ?? '';
  bool hasFotoFederacao() => _fotoFederacao != null;

  // "Nome_Clube" field.
  String? _nomeClube;
  String get nomeClube => _nomeClube ?? '';
  bool hasNomeClube() => _nomeClube != null;

  // "Foto_Clube" field.
  String? _fotoClube;
  String get fotoClube => _fotoClube ?? '';
  bool hasFotoClube() => _fotoClube != null;

  // "Total_Geral_Pontos" field.
  int? _totalGeralPontos;
  int get totalGeralPontos => _totalGeralPontos ?? 0;
  bool hasTotalGeralPontos() => _totalGeralPontos != null;

  // "Colocacao_geral" field.
  int? _colocacaoGeral;
  int get colocacaoGeral => _colocacaoGeral ?? 0;
  bool hasColocacaoGeral() => _colocacaoGeral != null;

  // "id_participante" field.
  DocumentReference? _idParticipante;
  DocumentReference? get idParticipante => _idParticipante;
  bool hasIdParticipante() => _idParticipante != null;

  // "id_Federacao" field.
  DocumentReference? _idFederacao;
  DocumentReference? get idFederacao => _idFederacao;
  bool hasIdFederacao() => _idFederacao != null;

  // "id_Clube" field.
  DocumentReference? _idClube;
  DocumentReference? get idClube => _idClube;
  bool hasIdClube() => _idClube != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nomeParticipante = snapshotData['Nome_Participante'] as String?;
    _fotoParticipante = snapshotData['Foto_Participante'] as String?;
    _nomeFederacao = snapshotData['Nome_Federacao'] as String?;
    _fotoFederacao = snapshotData['Foto_Federacao'] as String?;
    _nomeClube = snapshotData['Nome_Clube'] as String?;
    _fotoClube = snapshotData['Foto_Clube'] as String?;
    _totalGeralPontos = castToType<int>(snapshotData['Total_Geral_Pontos']);
    _colocacaoGeral = castToType<int>(snapshotData['Colocacao_geral']);
    _idParticipante = snapshotData['id_participante'] as DocumentReference?;
    _idFederacao = snapshotData['id_Federacao'] as DocumentReference?;
    _idClube = snapshotData['id_Clube'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Ranking_totalGeral')
          : FirebaseFirestore.instance.collectionGroup('Ranking_totalGeral');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Ranking_totalGeral').doc(id);

  static Stream<RankingTotalGeralRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RankingTotalGeralRecord.fromSnapshot(s));

  static Future<RankingTotalGeralRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RankingTotalGeralRecord.fromSnapshot(s));

  static RankingTotalGeralRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RankingTotalGeralRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RankingTotalGeralRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RankingTotalGeralRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RankingTotalGeralRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RankingTotalGeralRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRankingTotalGeralRecordData({
  String? nomeParticipante,
  String? fotoParticipante,
  String? nomeFederacao,
  String? fotoFederacao,
  String? nomeClube,
  String? fotoClube,
  int? totalGeralPontos,
  int? colocacaoGeral,
  DocumentReference? idParticipante,
  DocumentReference? idFederacao,
  DocumentReference? idClube,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nome_Participante': nomeParticipante,
      'Foto_Participante': fotoParticipante,
      'Nome_Federacao': nomeFederacao,
      'Foto_Federacao': fotoFederacao,
      'Nome_Clube': nomeClube,
      'Foto_Clube': fotoClube,
      'Total_Geral_Pontos': totalGeralPontos,
      'Colocacao_geral': colocacaoGeral,
      'id_participante': idParticipante,
      'id_Federacao': idFederacao,
      'id_Clube': idClube,
    }.withoutNulls,
  );

  return firestoreData;
}

class RankingTotalGeralRecordDocumentEquality
    implements Equality<RankingTotalGeralRecord> {
  const RankingTotalGeralRecordDocumentEquality();

  @override
  bool equals(RankingTotalGeralRecord? e1, RankingTotalGeralRecord? e2) {
    return e1?.nomeParticipante == e2?.nomeParticipante &&
        e1?.fotoParticipante == e2?.fotoParticipante &&
        e1?.nomeFederacao == e2?.nomeFederacao &&
        e1?.fotoFederacao == e2?.fotoFederacao &&
        e1?.nomeClube == e2?.nomeClube &&
        e1?.fotoClube == e2?.fotoClube &&
        e1?.totalGeralPontos == e2?.totalGeralPontos &&
        e1?.colocacaoGeral == e2?.colocacaoGeral &&
        e1?.idParticipante == e2?.idParticipante &&
        e1?.idFederacao == e2?.idFederacao &&
        e1?.idClube == e2?.idClube;
  }

  @override
  int hash(RankingTotalGeralRecord? e) => const ListEquality().hash([
        e?.nomeParticipante,
        e?.fotoParticipante,
        e?.nomeFederacao,
        e?.fotoFederacao,
        e?.nomeClube,
        e?.fotoClube,
        e?.totalGeralPontos,
        e?.colocacaoGeral,
        e?.idParticipante,
        e?.idFederacao,
        e?.idClube
      ]);

  @override
  bool isValidKey(Object? o) => o is RankingTotalGeralRecord;
}
