import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParticipanteRecord extends FirestoreRecord {
  ParticipanteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "dataIngresso" field.
  DateTime? _dataIngresso;
  DateTime? get dataIngresso => _dataIngresso;
  bool hasDataIngresso() => _dataIngresso != null;

  // "participanteNome" field.
  String? _participanteNome;
  String get participanteNome => _participanteNome ?? '';
  bool hasParticipanteNome() => _participanteNome != null;

  // "participantePhoto" field.
  String? _participantePhoto;
  String get participantePhoto => _participantePhoto ?? '';
  bool hasParticipantePhoto() => _participantePhoto != null;

  // "participanteApelido" field.
  String? _participanteApelido;
  String get participanteApelido => _participanteApelido ?? '';
  bool hasParticipanteApelido() => _participanteApelido != null;

  // "idChampion" field.
  DocumentReference? _idChampion;
  DocumentReference? get idChampion => _idChampion;
  bool hasIdChampion() => _idChampion != null;

  // "idFase" field.
  DocumentReference? _idFase;
  DocumentReference? get idFase => _idFase;
  bool hasIdFase() => _idFase != null;

  // "idGrupo" field.
  DocumentReference? _idGrupo;
  DocumentReference? get idGrupo => _idGrupo;
  bool hasIdGrupo() => _idGrupo != null;

  // "idParticipante" field.
  DocumentReference? _idParticipante;
  DocumentReference? get idParticipante => _idParticipante;
  bool hasIdParticipante() => _idParticipante != null;

  // "idClube" field.
  DocumentReference? _idClube;
  DocumentReference? get idClube => _idClube;
  bool hasIdClube() => _idClube != null;

  // "idModalidade" field.
  DocumentReference? _idModalidade;
  DocumentReference? get idModalidade => _idModalidade;
  bool hasIdModalidade() => _idModalidade != null;

  // "idFederation" field.
  DocumentReference? _idFederation;
  DocumentReference? get idFederation => _idFederation;
  bool hasIdFederation() => _idFederation != null;

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

  // "totalGolsContra" field.
  int? _totalGolsContra;
  int get totalGolsContra => _totalGolsContra ?? 0;
  bool hasTotalGolsContra() => _totalGolsContra != null;

  // "totalSaldoGols" field.
  int? _totalSaldoGols;
  int get totalSaldoGols => _totalSaldoGols ?? 0;
  bool hasTotalSaldoGols() => _totalSaldoGols != null;

  // "grupoAproveitamento" field.
  double? _grupoAproveitamento;
  double get grupoAproveitamento => _grupoAproveitamento ?? 0.0;
  bool hasGrupoAproveitamento() => _grupoAproveitamento != null;

  // "grupoPosicao" field.
  int? _grupoPosicao;
  int get grupoPosicao => _grupoPosicao ?? 0;
  bool hasGrupoPosicao() => _grupoPosicao != null;

  // "fasePosicao" field.
  int? _fasePosicao;
  int get fasePosicao => _fasePosicao ?? 0;
  bool hasFasePosicao() => _fasePosicao != null;

  // "championPosicao" field.
  int? _championPosicao;
  int get championPosicao => _championPosicao ?? 0;
  bool hasChampionPosicao() => _championPosicao != null;

  // "grupoPosicaoAgrupado" field.
  int? _grupoPosicaoAgrupado;
  int get grupoPosicaoAgrupado => _grupoPosicaoAgrupado ?? 0;
  bool hasGrupoPosicaoAgrupado() => _grupoPosicaoAgrupado != null;

  // "tituloFase" field.
  String? _tituloFase;
  String get tituloFase => _tituloFase ?? '';
  bool hasTituloFase() => _tituloFase != null;

  // "tituloGrupo" field.
  String? _tituloGrupo;
  String get tituloGrupo => _tituloGrupo ?? '';
  bool hasTituloGrupo() => _tituloGrupo != null;

  void _initializeFields() {
    _dataIngresso = snapshotData['dataIngresso'] as DateTime?;
    _participanteNome = snapshotData['participanteNome'] as String?;
    _participantePhoto = snapshotData['participantePhoto'] as String?;
    _participanteApelido = snapshotData['participanteApelido'] as String?;
    _idChampion = snapshotData['idChampion'] as DocumentReference?;
    _idFase = snapshotData['idFase'] as DocumentReference?;
    _idGrupo = snapshotData['idGrupo'] as DocumentReference?;
    _idParticipante = snapshotData['idParticipante'] as DocumentReference?;
    _idClube = snapshotData['idClube'] as DocumentReference?;
    _idModalidade = snapshotData['idModalidade'] as DocumentReference?;
    _idFederation = snapshotData['idFederation'] as DocumentReference?;
    _totalPartidas = castToType<int>(snapshotData['totalPartidas']);
    _totalPontos = castToType<int>(snapshotData['totalPontos']);
    _totalVitorias = castToType<int>(snapshotData['totalVitorias']);
    _totalEmpates = castToType<int>(snapshotData['totalEmpates']);
    _totalDerrotas = castToType<int>(snapshotData['totalDerrotas']);
    _totalGolsPro = castToType<int>(snapshotData['totalGolsPro']);
    _totalGolsContra = castToType<int>(snapshotData['totalGolsContra']);
    _totalSaldoGols = castToType<int>(snapshotData['totalSaldoGols']);
    _grupoAproveitamento =
        castToType<double>(snapshotData['grupoAproveitamento']);
    _grupoPosicao = castToType<int>(snapshotData['grupoPosicao']);
    _fasePosicao = castToType<int>(snapshotData['fasePosicao']);
    _championPosicao = castToType<int>(snapshotData['championPosicao']);
    _grupoPosicaoAgrupado =
        castToType<int>(snapshotData['grupoPosicaoAgrupado']);
    _tituloFase = snapshotData['tituloFase'] as String?;
    _tituloGrupo = snapshotData['tituloGrupo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Participante');

  static Stream<ParticipanteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ParticipanteRecord.fromSnapshot(s));

  static Future<ParticipanteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ParticipanteRecord.fromSnapshot(s));

  static ParticipanteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ParticipanteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ParticipanteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ParticipanteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ParticipanteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ParticipanteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createParticipanteRecordData({
  DateTime? dataIngresso,
  String? participanteNome,
  String? participantePhoto,
  String? participanteApelido,
  DocumentReference? idChampion,
  DocumentReference? idFase,
  DocumentReference? idGrupo,
  DocumentReference? idParticipante,
  DocumentReference? idClube,
  DocumentReference? idModalidade,
  DocumentReference? idFederation,
  int? totalPartidas,
  int? totalPontos,
  int? totalVitorias,
  int? totalEmpates,
  int? totalDerrotas,
  int? totalGolsPro,
  int? totalGolsContra,
  int? totalSaldoGols,
  double? grupoAproveitamento,
  int? grupoPosicao,
  int? fasePosicao,
  int? championPosicao,
  int? grupoPosicaoAgrupado,
  String? tituloFase,
  String? tituloGrupo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'dataIngresso': dataIngresso,
      'participanteNome': participanteNome,
      'participantePhoto': participantePhoto,
      'participanteApelido': participanteApelido,
      'idChampion': idChampion,
      'idFase': idFase,
      'idGrupo': idGrupo,
      'idParticipante': idParticipante,
      'idClube': idClube,
      'idModalidade': idModalidade,
      'idFederation': idFederation,
      'totalPartidas': totalPartidas,
      'totalPontos': totalPontos,
      'totalVitorias': totalVitorias,
      'totalEmpates': totalEmpates,
      'totalDerrotas': totalDerrotas,
      'totalGolsPro': totalGolsPro,
      'totalGolsContra': totalGolsContra,
      'totalSaldoGols': totalSaldoGols,
      'grupoAproveitamento': grupoAproveitamento,
      'grupoPosicao': grupoPosicao,
      'fasePosicao': fasePosicao,
      'championPosicao': championPosicao,
      'grupoPosicaoAgrupado': grupoPosicaoAgrupado,
      'tituloFase': tituloFase,
      'tituloGrupo': tituloGrupo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ParticipanteRecordDocumentEquality
    implements Equality<ParticipanteRecord> {
  const ParticipanteRecordDocumentEquality();

  @override
  bool equals(ParticipanteRecord? e1, ParticipanteRecord? e2) {
    return e1?.dataIngresso == e2?.dataIngresso &&
        e1?.participanteNome == e2?.participanteNome &&
        e1?.participantePhoto == e2?.participantePhoto &&
        e1?.participanteApelido == e2?.participanteApelido &&
        e1?.idChampion == e2?.idChampion &&
        e1?.idFase == e2?.idFase &&
        e1?.idGrupo == e2?.idGrupo &&
        e1?.idParticipante == e2?.idParticipante &&
        e1?.idClube == e2?.idClube &&
        e1?.idModalidade == e2?.idModalidade &&
        e1?.idFederation == e2?.idFederation &&
        e1?.totalPartidas == e2?.totalPartidas &&
        e1?.totalPontos == e2?.totalPontos &&
        e1?.totalVitorias == e2?.totalVitorias &&
        e1?.totalEmpates == e2?.totalEmpates &&
        e1?.totalDerrotas == e2?.totalDerrotas &&
        e1?.totalGolsPro == e2?.totalGolsPro &&
        e1?.totalGolsContra == e2?.totalGolsContra &&
        e1?.totalSaldoGols == e2?.totalSaldoGols &&
        e1?.grupoAproveitamento == e2?.grupoAproveitamento &&
        e1?.grupoPosicao == e2?.grupoPosicao &&
        e1?.fasePosicao == e2?.fasePosicao &&
        e1?.championPosicao == e2?.championPosicao &&
        e1?.grupoPosicaoAgrupado == e2?.grupoPosicaoAgrupado &&
        e1?.tituloFase == e2?.tituloFase &&
        e1?.tituloGrupo == e2?.tituloGrupo;
  }

  @override
  int hash(ParticipanteRecord? e) => const ListEquality().hash([
        e?.dataIngresso,
        e?.participanteNome,
        e?.participantePhoto,
        e?.participanteApelido,
        e?.idChampion,
        e?.idFase,
        e?.idGrupo,
        e?.idParticipante,
        e?.idClube,
        e?.idModalidade,
        e?.idFederation,
        e?.totalPartidas,
        e?.totalPontos,
        e?.totalVitorias,
        e?.totalEmpates,
        e?.totalDerrotas,
        e?.totalGolsPro,
        e?.totalGolsContra,
        e?.totalSaldoGols,
        e?.grupoAproveitamento,
        e?.grupoPosicao,
        e?.fasePosicao,
        e?.championPosicao,
        e?.grupoPosicaoAgrupado,
        e?.tituloFase,
        e?.tituloGrupo
      ]);

  @override
  bool isValidKey(Object? o) => o is ParticipanteRecord;
}
