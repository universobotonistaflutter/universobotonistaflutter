import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChampionTotalGeralRecord extends FirestoreRecord {
  ChampionTotalGeralRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idParticipante" field.
  DocumentReference? _idParticipante;
  DocumentReference? get idParticipante => _idParticipante;
  bool hasIdParticipante() => _idParticipante != null;

  // "participante_nome" field.
  String? _participanteNome;
  String get participanteNome => _participanteNome ?? '';
  bool hasParticipanteNome() => _participanteNome != null;

  // "participante_photo" field.
  String? _participantePhoto;
  String get participantePhoto => _participantePhoto ?? '';
  bool hasParticipantePhoto() => _participantePhoto != null;

  // "totalPartidas" field.
  int? _totalPartidas;
  int get totalPartidas => _totalPartidas ?? 0;
  bool hasTotalPartidas() => _totalPartidas != null;

  // "totalPontos" field.
  int? _totalPontos;
  int get totalPontos => _totalPontos ?? 0;
  bool hasTotalPontos() => _totalPontos != null;

  // "totalVitorias" field.
  int? _totalVitorias;
  int get totalVitorias => _totalVitorias ?? 0;
  bool hasTotalVitorias() => _totalVitorias != null;

  // "totalEmpates" field.
  int? _totalEmpates;
  int get totalEmpates => _totalEmpates ?? 0;
  bool hasTotalEmpates() => _totalEmpates != null;

  // "totalDerrotas" field.
  int? _totalDerrotas;
  int get totalDerrotas => _totalDerrotas ?? 0;
  bool hasTotalDerrotas() => _totalDerrotas != null;

  // "totalGolsPro" field.
  int? _totalGolsPro;
  int get totalGolsPro => _totalGolsPro ?? 0;
  bool hasTotalGolsPro() => _totalGolsPro != null;

  // "totalSaldoGols" field.
  int? _totalSaldoGols;
  int get totalSaldoGols => _totalSaldoGols ?? 0;
  bool hasTotalSaldoGols() => _totalSaldoGols != null;

  // "dataLastUpdate" field.
  DateTime? _dataLastUpdate;
  DateTime? get dataLastUpdate => _dataLastUpdate;
  bool hasDataLastUpdate() => _dataLastUpdate != null;

  // "participante_apelido" field.
  String? _participanteApelido;
  String get participanteApelido => _participanteApelido ?? '';
  bool hasParticipanteApelido() => _participanteApelido != null;

  // "totalGolsContra" field.
  int? _totalGolsContra;
  int get totalGolsContra => _totalGolsContra ?? 0;
  bool hasTotalGolsContra() => _totalGolsContra != null;

  // "campeonatoPosicao" field.
  int? _campeonatoPosicao;
  int get campeonatoPosicao => _campeonatoPosicao ?? 0;
  bool hasCampeonatoPosicao() => _campeonatoPosicao != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idParticipante = snapshotData['idParticipante'] as DocumentReference?;
    _participanteNome = snapshotData['participante_nome'] as String?;
    _participantePhoto = snapshotData['participante_photo'] as String?;
    _totalPartidas = castToType<int>(snapshotData['totalPartidas']);
    _totalPontos = castToType<int>(snapshotData['totalPontos']);
    _totalVitorias = castToType<int>(snapshotData['totalVitorias']);
    _totalEmpates = castToType<int>(snapshotData['totalEmpates']);
    _totalDerrotas = castToType<int>(snapshotData['totalDerrotas']);
    _totalGolsPro = castToType<int>(snapshotData['totalGolsPro']);
    _totalSaldoGols = castToType<int>(snapshotData['totalSaldoGols']);
    _dataLastUpdate = snapshotData['dataLastUpdate'] as DateTime?;
    _participanteApelido = snapshotData['participante_apelido'] as String?;
    _totalGolsContra = castToType<int>(snapshotData['totalGolsContra']);
    _campeonatoPosicao = castToType<int>(snapshotData['campeonatoPosicao']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ChampionTotalGeral')
          : FirebaseFirestore.instance.collectionGroup('ChampionTotalGeral');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ChampionTotalGeral').doc(id);

  static Stream<ChampionTotalGeralRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChampionTotalGeralRecord.fromSnapshot(s));

  static Future<ChampionTotalGeralRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ChampionTotalGeralRecord.fromSnapshot(s));

  static ChampionTotalGeralRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChampionTotalGeralRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChampionTotalGeralRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChampionTotalGeralRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChampionTotalGeralRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChampionTotalGeralRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChampionTotalGeralRecordData({
  DocumentReference? idParticipante,
  String? participanteNome,
  String? participantePhoto,
  int? totalPartidas,
  int? totalPontos,
  int? totalVitorias,
  int? totalEmpates,
  int? totalDerrotas,
  int? totalGolsPro,
  int? totalSaldoGols,
  DateTime? dataLastUpdate,
  String? participanteApelido,
  int? totalGolsContra,
  int? campeonatoPosicao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idParticipante': idParticipante,
      'participante_nome': participanteNome,
      'participante_photo': participantePhoto,
      'totalPartidas': totalPartidas,
      'totalPontos': totalPontos,
      'totalVitorias': totalVitorias,
      'totalEmpates': totalEmpates,
      'totalDerrotas': totalDerrotas,
      'totalGolsPro': totalGolsPro,
      'totalSaldoGols': totalSaldoGols,
      'dataLastUpdate': dataLastUpdate,
      'participante_apelido': participanteApelido,
      'totalGolsContra': totalGolsContra,
      'campeonatoPosicao': campeonatoPosicao,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChampionTotalGeralRecordDocumentEquality
    implements Equality<ChampionTotalGeralRecord> {
  const ChampionTotalGeralRecordDocumentEquality();

  @override
  bool equals(ChampionTotalGeralRecord? e1, ChampionTotalGeralRecord? e2) {
    return e1?.idParticipante == e2?.idParticipante &&
        e1?.participanteNome == e2?.participanteNome &&
        e1?.participantePhoto == e2?.participantePhoto &&
        e1?.totalPartidas == e2?.totalPartidas &&
        e1?.totalPontos == e2?.totalPontos &&
        e1?.totalVitorias == e2?.totalVitorias &&
        e1?.totalEmpates == e2?.totalEmpates &&
        e1?.totalDerrotas == e2?.totalDerrotas &&
        e1?.totalGolsPro == e2?.totalGolsPro &&
        e1?.totalSaldoGols == e2?.totalSaldoGols &&
        e1?.dataLastUpdate == e2?.dataLastUpdate &&
        e1?.participanteApelido == e2?.participanteApelido &&
        e1?.totalGolsContra == e2?.totalGolsContra &&
        e1?.campeonatoPosicao == e2?.campeonatoPosicao;
  }

  @override
  int hash(ChampionTotalGeralRecord? e) => const ListEquality().hash([
        e?.idParticipante,
        e?.participanteNome,
        e?.participantePhoto,
        e?.totalPartidas,
        e?.totalPontos,
        e?.totalVitorias,
        e?.totalEmpates,
        e?.totalDerrotas,
        e?.totalGolsPro,
        e?.totalSaldoGols,
        e?.dataLastUpdate,
        e?.participanteApelido,
        e?.totalGolsContra,
        e?.campeonatoPosicao
      ]);

  @override
  bool isValidKey(Object? o) => o is ChampionTotalGeralRecord;
}
