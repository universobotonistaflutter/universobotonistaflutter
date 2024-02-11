import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChampionRecord extends FirestoreRecord {
  ChampionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Nomecampeonato" field.
  String? _nomecampeonato;
  String get nomecampeonato => _nomecampeonato ?? '';
  bool hasNomecampeonato() => _nomecampeonato != null;

  // "Modalidade_torneio" field.
  String? _modalidadeTorneio;
  String get modalidadeTorneio => _modalidadeTorneio ?? '';
  bool hasModalidadeTorneio() => _modalidadeTorneio != null;

  // "Tipo_torneio" field.
  String? _tipoTorneio;
  String get tipoTorneio => _tipoTorneio ?? '';
  bool hasTipoTorneio() => _tipoTorneio != null;

  // "tipo_participa" field.
  String? _tipoParticipa;
  String get tipoParticipa => _tipoParticipa ?? '';
  bool hasTipoParticipa() => _tipoParticipa != null;

  // "data_torneio" field.
  DateTime? _dataTorneio;
  DateTime? get dataTorneio => _dataTorneio;
  bool hasDataTorneio() => _dataTorneio != null;

  // "number_participantes" field.
  int? _numberParticipantes;
  int get numberParticipantes => _numberParticipantes ?? 0;
  bool hasNumberParticipantes() => _numberParticipantes != null;

  // "observaoes" field.
  String? _observaoes;
  String get observaoes => _observaoes ?? '';
  bool hasObservaoes() => _observaoes != null;

  // "foto_torneio" field.
  String? _fotoTorneio;
  String get fotoTorneio => _fotoTorneio ?? '';
  bool hasFotoTorneio() => _fotoTorneio != null;

  // "Local" field.
  LatLng? _local;
  LatLng? get local => _local;
  bool hasLocal() => _local != null;

  // "Data_atualizao" field.
  DateTime? _dataAtualizao;
  DateTime? get dataAtualizao => _dataAtualizao;
  bool hasDataAtualizao() => _dataAtualizao != null;

  // "foto_admin" field.
  String? _fotoAdmin;
  String get fotoAdmin => _fotoAdmin ?? '';
  bool hasFotoAdmin() => _fotoAdmin != null;

  // "foto_admin2" field.
  String? _fotoAdmin2;
  String get fotoAdmin2 => _fotoAdmin2 ?? '';
  bool hasFotoAdmin2() => _fotoAdmin2 != null;

  // "foto_admin3" field.
  String? _fotoAdmin3;
  String get fotoAdmin3 => _fotoAdmin3 ?? '';
  bool hasFotoAdmin3() => _fotoAdmin3 != null;

  // "Status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "regra_tipo" field.
  bool? _regraTipo;
  bool get regraTipo => _regraTipo ?? false;
  bool hasRegraTipo() => _regraTipo != null;

  // "Participante" field.
  List<DocumentReference>? _participante;
  List<DocumentReference> get participante => _participante ?? const [];
  bool hasParticipante() => _participante != null;

  // "administrador" field.
  DocumentReference? _administrador;
  DocumentReference? get administrador => _administrador;
  bool hasAdministrador() => _administrador != null;

  // "administrador2" field.
  DocumentReference? _administrador2;
  DocumentReference? get administrador2 => _administrador2;
  bool hasAdministrador2() => _administrador2 != null;

  // "administrador3" field.
  DocumentReference? _administrador3;
  DocumentReference? get administrador3 => _administrador3;
  bool hasAdministrador3() => _administrador3 != null;

  // "Rua" field.
  String? _rua;
  String get rua => _rua ?? '';
  bool hasRua() => _rua != null;

  // "Uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  bool hasUf() => _uf != null;

  // "Cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "Pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  // "Local_torneio" field.
  String? _localTorneio;
  String get localTorneio => _localTorneio ?? '';
  bool hasLocalTorneio() => _localTorneio != null;

  // "idModalidade" field.
  DocumentReference? _idModalidade;
  DocumentReference? get idModalidade => _idModalidade;
  bool hasIdModalidade() => _idModalidade != null;

  // "idFederation" field.
  DocumentReference? _idFederation;
  DocumentReference? get idFederation => _idFederation;
  bool hasIdFederation() => _idFederation != null;

  // "idClube" field.
  DocumentReference? _idClube;
  DocumentReference? get idClube => _idClube;
  bool hasIdClube() => _idClube != null;

  // "nomeFase" field.
  String? _nomeFase;
  String get nomeFase => _nomeFase ?? '';
  bool hasNomeFase() => _nomeFase != null;

  // "idFase" field.
  DocumentReference? _idFase;
  DocumentReference? get idFase => _idFase;
  bool hasIdFase() => _idFase != null;

  // "ultimaPartida" field.
  int? _ultimaPartida;
  int get ultimaPartida => _ultimaPartida ?? 0;
  bool hasUltimaPartida() => _ultimaPartida != null;

  // "qtdPartidaJogadas" field.
  int? _qtdPartidaJogadas;
  int get qtdPartidaJogadas => _qtdPartidaJogadas ?? 0;
  bool hasQtdPartidaJogadas() => _qtdPartidaJogadas != null;

  // "dataEncerramento" field.
  DateTime? _dataEncerramento;
  DateTime? get dataEncerramento => _dataEncerramento;
  bool hasDataEncerramento() => _dataEncerramento != null;

  // "dataCampeonatoCalender" field.
  String? _dataCampeonatoCalender;
  String get dataCampeonatoCalender => _dataCampeonatoCalender ?? '';
  bool hasDataCampeonatoCalender() => _dataCampeonatoCalender != null;

  // "foto_modalidade" field.
  String? _fotoModalidade;
  String get fotoModalidade => _fotoModalidade ?? '';
  bool hasFotoModalidade() => _fotoModalidade != null;

  // "nome_admin2" field.
  String? _nomeAdmin2;
  String get nomeAdmin2 => _nomeAdmin2 ?? '';
  bool hasNomeAdmin2() => _nomeAdmin2 != null;

  // "nome_admin3" field.
  String? _nomeAdmin3;
  String get nomeAdmin3 => _nomeAdmin3 ?? '';
  bool hasNomeAdmin3() => _nomeAdmin3 != null;

  // "idranking" field.
  DocumentReference? _idranking;
  DocumentReference? get idranking => _idranking;
  bool hasIdranking() => _idranking != null;

  // "calc_Ranking" field.
  bool? _calcRanking;
  bool get calcRanking => _calcRanking ?? false;
  bool hasCalcRanking() => _calcRanking != null;

  // "nomeAdmin" field.
  String? _nomeAdmin;
  String get nomeAdmin => _nomeAdmin ?? '';
  bool hasNomeAdmin() => _nomeAdmin != null;

  // "nomeFederation" field.
  String? _nomeFederation;
  String get nomeFederation => _nomeFederation ?? '';
  bool hasNomeFederation() => _nomeFederation != null;

  void _initializeFields() {
    _nomecampeonato = snapshotData['Nomecampeonato'] as String?;
    _modalidadeTorneio = snapshotData['Modalidade_torneio'] as String?;
    _tipoTorneio = snapshotData['Tipo_torneio'] as String?;
    _tipoParticipa = snapshotData['tipo_participa'] as String?;
    _dataTorneio = snapshotData['data_torneio'] as DateTime?;
    _numberParticipantes =
        castToType<int>(snapshotData['number_participantes']);
    _observaoes = snapshotData['observaoes'] as String?;
    _fotoTorneio = snapshotData['foto_torneio'] as String?;
    _local = snapshotData['Local'] as LatLng?;
    _dataAtualizao = snapshotData['Data_atualizao'] as DateTime?;
    _fotoAdmin = snapshotData['foto_admin'] as String?;
    _fotoAdmin2 = snapshotData['foto_admin2'] as String?;
    _fotoAdmin3 = snapshotData['foto_admin3'] as String?;
    _status = castToType<int>(snapshotData['Status']);
    _regraTipo = snapshotData['regra_tipo'] as bool?;
    _participante = getDataList(snapshotData['Participante']);
    _administrador = snapshotData['administrador'] as DocumentReference?;
    _administrador2 = snapshotData['administrador2'] as DocumentReference?;
    _administrador3 = snapshotData['administrador3'] as DocumentReference?;
    _rua = snapshotData['Rua'] as String?;
    _uf = snapshotData['Uf'] as String?;
    _cidade = snapshotData['Cidade'] as String?;
    _pais = snapshotData['Pais'] as String?;
    _localTorneio = snapshotData['Local_torneio'] as String?;
    _idModalidade = snapshotData['idModalidade'] as DocumentReference?;
    _idFederation = snapshotData['idFederation'] as DocumentReference?;
    _idClube = snapshotData['idClube'] as DocumentReference?;
    _nomeFase = snapshotData['nomeFase'] as String?;
    _idFase = snapshotData['idFase'] as DocumentReference?;
    _ultimaPartida = castToType<int>(snapshotData['ultimaPartida']);
    _qtdPartidaJogadas = castToType<int>(snapshotData['qtdPartidaJogadas']);
    _dataEncerramento = snapshotData['dataEncerramento'] as DateTime?;
    _dataCampeonatoCalender = snapshotData['dataCampeonatoCalender'] as String?;
    _fotoModalidade = snapshotData['foto_modalidade'] as String?;
    _nomeAdmin2 = snapshotData['nome_admin2'] as String?;
    _nomeAdmin3 = snapshotData['nome_admin3'] as String?;
    _idranking = snapshotData['idranking'] as DocumentReference?;
    _calcRanking = snapshotData['calc_Ranking'] as bool?;
    _nomeAdmin = snapshotData['nomeAdmin'] as String?;
    _nomeFederation = snapshotData['nomeFederation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Champion');

  static Stream<ChampionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChampionRecord.fromSnapshot(s));

  static Future<ChampionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChampionRecord.fromSnapshot(s));

  static ChampionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChampionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChampionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChampionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChampionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChampionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChampionRecordData({
  String? nomecampeonato,
  String? modalidadeTorneio,
  String? tipoTorneio,
  String? tipoParticipa,
  DateTime? dataTorneio,
  int? numberParticipantes,
  String? observaoes,
  String? fotoTorneio,
  LatLng? local,
  DateTime? dataAtualizao,
  String? fotoAdmin,
  String? fotoAdmin2,
  String? fotoAdmin3,
  int? status,
  bool? regraTipo,
  DocumentReference? administrador,
  DocumentReference? administrador2,
  DocumentReference? administrador3,
  String? rua,
  String? uf,
  String? cidade,
  String? pais,
  String? localTorneio,
  DocumentReference? idModalidade,
  DocumentReference? idFederation,
  DocumentReference? idClube,
  String? nomeFase,
  DocumentReference? idFase,
  int? ultimaPartida,
  int? qtdPartidaJogadas,
  DateTime? dataEncerramento,
  String? dataCampeonatoCalender,
  String? fotoModalidade,
  String? nomeAdmin2,
  String? nomeAdmin3,
  DocumentReference? idranking,
  bool? calcRanking,
  String? nomeAdmin,
  String? nomeFederation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nomecampeonato': nomecampeonato,
      'Modalidade_torneio': modalidadeTorneio,
      'Tipo_torneio': tipoTorneio,
      'tipo_participa': tipoParticipa,
      'data_torneio': dataTorneio,
      'number_participantes': numberParticipantes,
      'observaoes': observaoes,
      'foto_torneio': fotoTorneio,
      'Local': local,
      'Data_atualizao': dataAtualizao,
      'foto_admin': fotoAdmin,
      'foto_admin2': fotoAdmin2,
      'foto_admin3': fotoAdmin3,
      'Status': status,
      'regra_tipo': regraTipo,
      'administrador': administrador,
      'administrador2': administrador2,
      'administrador3': administrador3,
      'Rua': rua,
      'Uf': uf,
      'Cidade': cidade,
      'Pais': pais,
      'Local_torneio': localTorneio,
      'idModalidade': idModalidade,
      'idFederation': idFederation,
      'idClube': idClube,
      'nomeFase': nomeFase,
      'idFase': idFase,
      'ultimaPartida': ultimaPartida,
      'qtdPartidaJogadas': qtdPartidaJogadas,
      'dataEncerramento': dataEncerramento,
      'dataCampeonatoCalender': dataCampeonatoCalender,
      'foto_modalidade': fotoModalidade,
      'nome_admin2': nomeAdmin2,
      'nome_admin3': nomeAdmin3,
      'idranking': idranking,
      'calc_Ranking': calcRanking,
      'nomeAdmin': nomeAdmin,
      'nomeFederation': nomeFederation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChampionRecordDocumentEquality implements Equality<ChampionRecord> {
  const ChampionRecordDocumentEquality();

  @override
  bool equals(ChampionRecord? e1, ChampionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nomecampeonato == e2?.nomecampeonato &&
        e1?.modalidadeTorneio == e2?.modalidadeTorneio &&
        e1?.tipoTorneio == e2?.tipoTorneio &&
        e1?.tipoParticipa == e2?.tipoParticipa &&
        e1?.dataTorneio == e2?.dataTorneio &&
        e1?.numberParticipantes == e2?.numberParticipantes &&
        e1?.observaoes == e2?.observaoes &&
        e1?.fotoTorneio == e2?.fotoTorneio &&
        e1?.local == e2?.local &&
        e1?.dataAtualizao == e2?.dataAtualizao &&
        e1?.fotoAdmin == e2?.fotoAdmin &&
        e1?.fotoAdmin2 == e2?.fotoAdmin2 &&
        e1?.fotoAdmin3 == e2?.fotoAdmin3 &&
        e1?.status == e2?.status &&
        e1?.regraTipo == e2?.regraTipo &&
        listEquality.equals(e1?.participante, e2?.participante) &&
        e1?.administrador == e2?.administrador &&
        e1?.administrador2 == e2?.administrador2 &&
        e1?.administrador3 == e2?.administrador3 &&
        e1?.rua == e2?.rua &&
        e1?.uf == e2?.uf &&
        e1?.cidade == e2?.cidade &&
        e1?.pais == e2?.pais &&
        e1?.localTorneio == e2?.localTorneio &&
        e1?.idModalidade == e2?.idModalidade &&
        e1?.idFederation == e2?.idFederation &&
        e1?.idClube == e2?.idClube &&
        e1?.nomeFase == e2?.nomeFase &&
        e1?.idFase == e2?.idFase &&
        e1?.ultimaPartida == e2?.ultimaPartida &&
        e1?.qtdPartidaJogadas == e2?.qtdPartidaJogadas &&
        e1?.dataEncerramento == e2?.dataEncerramento &&
        e1?.dataCampeonatoCalender == e2?.dataCampeonatoCalender &&
        e1?.fotoModalidade == e2?.fotoModalidade &&
        e1?.nomeAdmin2 == e2?.nomeAdmin2 &&
        e1?.nomeAdmin3 == e2?.nomeAdmin3 &&
        e1?.idranking == e2?.idranking &&
        e1?.calcRanking == e2?.calcRanking &&
        e1?.nomeAdmin == e2?.nomeAdmin &&
        e1?.nomeFederation == e2?.nomeFederation;
  }

  @override
  int hash(ChampionRecord? e) => const ListEquality().hash([
        e?.nomecampeonato,
        e?.modalidadeTorneio,
        e?.tipoTorneio,
        e?.tipoParticipa,
        e?.dataTorneio,
        e?.numberParticipantes,
        e?.observaoes,
        e?.fotoTorneio,
        e?.local,
        e?.dataAtualizao,
        e?.fotoAdmin,
        e?.fotoAdmin2,
        e?.fotoAdmin3,
        e?.status,
        e?.regraTipo,
        e?.participante,
        e?.administrador,
        e?.administrador2,
        e?.administrador3,
        e?.rua,
        e?.uf,
        e?.cidade,
        e?.pais,
        e?.localTorneio,
        e?.idModalidade,
        e?.idFederation,
        e?.idClube,
        e?.nomeFase,
        e?.idFase,
        e?.ultimaPartida,
        e?.qtdPartidaJogadas,
        e?.dataEncerramento,
        e?.dataCampeonatoCalender,
        e?.fotoModalidade,
        e?.nomeAdmin2,
        e?.nomeAdmin3,
        e?.idranking,
        e?.calcRanking,
        e?.nomeAdmin,
        e?.nomeFederation
      ]);

  @override
  bool isValidKey(Object? o) => o is ChampionRecord;
}
