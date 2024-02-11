import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JogosRecord extends FirestoreRecord {
  JogosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idChampion" field.
  DocumentReference? _idChampion;
  DocumentReference? get idChampion => _idChampion;
  bool hasIdChampion() => _idChampion != null;

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

  // "idFase" field.
  DocumentReference? _idFase;
  DocumentReference? get idFase => _idFase;
  bool hasIdFase() => _idFase != null;

  // "idGrupo" field.
  DocumentReference? _idGrupo;
  DocumentReference? get idGrupo => _idGrupo;
  bool hasIdGrupo() => _idGrupo != null;

  // "idParticipanteMandante" field.
  DocumentReference? _idParticipanteMandante;
  DocumentReference? get idParticipanteMandante => _idParticipanteMandante;
  bool hasIdParticipanteMandante() => _idParticipanteMandante != null;

  // "idParticipanteVisitante" field.
  DocumentReference? _idParticipanteVisitante;
  DocumentReference? get idParticipanteVisitante => _idParticipanteVisitante;
  bool hasIdParticipanteVisitante() => _idParticipanteVisitante != null;

  // "idUsuarioMandante" field.
  DocumentReference? _idUsuarioMandante;
  DocumentReference? get idUsuarioMandante => _idUsuarioMandante;
  bool hasIdUsuarioMandante() => _idUsuarioMandante != null;

  // "idUsuarioVistante" field.
  DocumentReference? _idUsuarioVistante;
  DocumentReference? get idUsuarioVistante => _idUsuarioVistante;
  bool hasIdUsuarioVistante() => _idUsuarioVistante != null;

  // "mandanteNome" field.
  String? _mandanteNome;
  String get mandanteNome => _mandanteNome ?? '';
  bool hasMandanteNome() => _mandanteNome != null;

  // "mandanteApelido" field.
  String? _mandanteApelido;
  String get mandanteApelido => _mandanteApelido ?? '';
  bool hasMandanteApelido() => _mandanteApelido != null;

  // "mandantePhoto" field.
  String? _mandantePhoto;
  String get mandantePhoto => _mandantePhoto ?? '';
  bool hasMandantePhoto() => _mandantePhoto != null;

  // "visitanteNome" field.
  String? _visitanteNome;
  String get visitanteNome => _visitanteNome ?? '';
  bool hasVisitanteNome() => _visitanteNome != null;

  // "visitanteApelido" field.
  String? _visitanteApelido;
  String get visitanteApelido => _visitanteApelido ?? '';
  bool hasVisitanteApelido() => _visitanteApelido != null;

  // "visitantePhoto" field.
  String? _visitantePhoto;
  String get visitantePhoto => _visitantePhoto ?? '';
  bool hasVisitantePhoto() => _visitantePhoto != null;

  // "faseNome" field.
  String? _faseNome;
  String get faseNome => _faseNome ?? '';
  bool hasFaseNome() => _faseNome != null;

  // "grupoNome" field.
  String? _grupoNome;
  String get grupoNome => _grupoNome ?? '';
  bool hasGrupoNome() => _grupoNome != null;

  // "mesaNumero" field.
  int? _mesaNumero;
  int get mesaNumero => _mesaNumero ?? 0;
  bool hasMesaNumero() => _mesaNumero != null;

  // "rodadaNumero" field.
  int? _rodadaNumero;
  int get rodadaNumero => _rodadaNumero ?? 0;
  bool hasRodadaNumero() => _rodadaNumero != null;

  // "visitanteGols" field.
  int? _visitanteGols;
  int get visitanteGols => _visitanteGols ?? 0;
  bool hasVisitanteGols() => _visitanteGols != null;

  // "mandantePontos" field.
  int? _mandantePontos;
  int get mandantePontos => _mandantePontos ?? 0;
  bool hasMandantePontos() => _mandantePontos != null;

  // "visitantePontos" field.
  int? _visitantePontos;
  int get visitantePontos => _visitantePontos ?? 0;
  bool hasVisitantePontos() => _visitantePontos != null;

  // "partida" field.
  int? _partida;
  int get partida => _partida ?? 0;
  bool hasPartida() => _partida != null;

  // "data_jogo" field.
  DateTime? _dataJogo;
  DateTime? get dataJogo => _dataJogo;
  bool hasDataJogo() => _dataJogo != null;

  // "mandanteGols" field.
  int? _mandanteGols;
  int get mandanteGols => _mandanteGols ?? 0;
  bool hasMandanteGols() => _mandanteGols != null;

  // "qtde_jogada" field.
  int? _qtdeJogada;
  int get qtdeJogada => _qtdeJogada ?? 0;
  bool hasQtdeJogada() => _qtdeJogada != null;

  // "idClubeMandante" field.
  DocumentReference? _idClubeMandante;
  DocumentReference? get idClubeMandante => _idClubeMandante;
  bool hasIdClubeMandante() => _idClubeMandante != null;

  // "idClubeVisitante" field.
  DocumentReference? _idClubeVisitante;
  DocumentReference? get idClubeVisitante => _idClubeVisitante;
  bool hasIdClubeVisitante() => _idClubeVisitante != null;

  // "idFederationMandante" field.
  DocumentReference? _idFederationMandante;
  DocumentReference? get idFederationMandante => _idFederationMandante;
  bool hasIdFederationMandante() => _idFederationMandante != null;

  // "idFederationVisitante" field.
  DocumentReference? _idFederationVisitante;
  DocumentReference? get idFederationVisitante => _idFederationVisitante;
  bool hasIdFederationVisitante() => _idFederationVisitante != null;

  // "FotoClubeMandante" field.
  String? _fotoClubeMandante;
  String get fotoClubeMandante => _fotoClubeMandante ?? '';
  bool hasFotoClubeMandante() => _fotoClubeMandante != null;

  // "FotoClubeVisitante" field.
  String? _fotoClubeVisitante;
  String get fotoClubeVisitante => _fotoClubeVisitante ?? '';
  bool hasFotoClubeVisitante() => _fotoClubeVisitante != null;

  // "FotoFederationMandante" field.
  String? _fotoFederationMandante;
  String get fotoFederationMandante => _fotoFederationMandante ?? '';
  bool hasFotoFederationMandante() => _fotoFederationMandante != null;

  // "FotoFederationVisitante" field.
  String? _fotoFederationVisitante;
  String get fotoFederationVisitante => _fotoFederationVisitante ?? '';
  bool hasFotoFederationVisitante() => _fotoFederationVisitante != null;

  // "NomeClubeMandante" field.
  String? _nomeClubeMandante;
  String get nomeClubeMandante => _nomeClubeMandante ?? '';
  bool hasNomeClubeMandante() => _nomeClubeMandante != null;

  // "NomeClubeVisitante" field.
  String? _nomeClubeVisitante;
  String get nomeClubeVisitante => _nomeClubeVisitante ?? '';
  bool hasNomeClubeVisitante() => _nomeClubeVisitante != null;

  // "NomeFederationVisitante" field.
  String? _nomeFederationVisitante;
  String get nomeFederationVisitante => _nomeFederationVisitante ?? '';
  bool hasNomeFederationVisitante() => _nomeFederationVisitante != null;

  // "NomeFederationMandante" field.
  String? _nomeFederationMandante;
  String get nomeFederationMandante => _nomeFederationMandante ?? '';
  bool hasNomeFederationMandante() => _nomeFederationMandante != null;

  // "listaUsuario" field.
  List<DocumentReference>? _listaUsuario;
  List<DocumentReference> get listaUsuario => _listaUsuario ?? const [];
  bool hasListaUsuario() => _listaUsuario != null;

  // "NomeChampion" field.
  String? _nomeChampion;
  String get nomeChampion => _nomeChampion ?? '';
  bool hasNomeChampion() => _nomeChampion != null;

  void _initializeFields() {
    _idChampion = snapshotData['idChampion'] as DocumentReference?;
    _idModalidade = snapshotData['idModalidade'] as DocumentReference?;
    _idFederation = snapshotData['idFederation'] as DocumentReference?;
    _idClube = snapshotData['idClube'] as DocumentReference?;
    _idFase = snapshotData['idFase'] as DocumentReference?;
    _idGrupo = snapshotData['idGrupo'] as DocumentReference?;
    _idParticipanteMandante =
        snapshotData['idParticipanteMandante'] as DocumentReference?;
    _idParticipanteVisitante =
        snapshotData['idParticipanteVisitante'] as DocumentReference?;
    _idUsuarioMandante =
        snapshotData['idUsuarioMandante'] as DocumentReference?;
    _idUsuarioVistante =
        snapshotData['idUsuarioVistante'] as DocumentReference?;
    _mandanteNome = snapshotData['mandanteNome'] as String?;
    _mandanteApelido = snapshotData['mandanteApelido'] as String?;
    _mandantePhoto = snapshotData['mandantePhoto'] as String?;
    _visitanteNome = snapshotData['visitanteNome'] as String?;
    _visitanteApelido = snapshotData['visitanteApelido'] as String?;
    _visitantePhoto = snapshotData['visitantePhoto'] as String?;
    _faseNome = snapshotData['faseNome'] as String?;
    _grupoNome = snapshotData['grupoNome'] as String?;
    _mesaNumero = castToType<int>(snapshotData['mesaNumero']);
    _rodadaNumero = castToType<int>(snapshotData['rodadaNumero']);
    _visitanteGols = castToType<int>(snapshotData['visitanteGols']);
    _mandantePontos = castToType<int>(snapshotData['mandantePontos']);
    _visitantePontos = castToType<int>(snapshotData['visitantePontos']);
    _partida = castToType<int>(snapshotData['partida']);
    _dataJogo = snapshotData['data_jogo'] as DateTime?;
    _mandanteGols = castToType<int>(snapshotData['mandanteGols']);
    _qtdeJogada = castToType<int>(snapshotData['qtde_jogada']);
    _idClubeMandante = snapshotData['idClubeMandante'] as DocumentReference?;
    _idClubeVisitante = snapshotData['idClubeVisitante'] as DocumentReference?;
    _idFederationMandante =
        snapshotData['idFederationMandante'] as DocumentReference?;
    _idFederationVisitante =
        snapshotData['idFederationVisitante'] as DocumentReference?;
    _fotoClubeMandante = snapshotData['FotoClubeMandante'] as String?;
    _fotoClubeVisitante = snapshotData['FotoClubeVisitante'] as String?;
    _fotoFederationMandante = snapshotData['FotoFederationMandante'] as String?;
    _fotoFederationVisitante =
        snapshotData['FotoFederationVisitante'] as String?;
    _nomeClubeMandante = snapshotData['NomeClubeMandante'] as String?;
    _nomeClubeVisitante = snapshotData['NomeClubeVisitante'] as String?;
    _nomeFederationVisitante =
        snapshotData['NomeFederationVisitante'] as String?;
    _nomeFederationMandante = snapshotData['NomeFederationMandante'] as String?;
    _listaUsuario = getDataList(snapshotData['listaUsuario']);
    _nomeChampion = snapshotData['NomeChampion'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Jogos');

  static Stream<JogosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JogosRecord.fromSnapshot(s));

  static Future<JogosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JogosRecord.fromSnapshot(s));

  static JogosRecord fromSnapshot(DocumentSnapshot snapshot) => JogosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JogosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JogosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JogosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JogosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJogosRecordData({
  DocumentReference? idChampion,
  DocumentReference? idModalidade,
  DocumentReference? idFederation,
  DocumentReference? idClube,
  DocumentReference? idFase,
  DocumentReference? idGrupo,
  DocumentReference? idParticipanteMandante,
  DocumentReference? idParticipanteVisitante,
  DocumentReference? idUsuarioMandante,
  DocumentReference? idUsuarioVistante,
  String? mandanteNome,
  String? mandanteApelido,
  String? mandantePhoto,
  String? visitanteNome,
  String? visitanteApelido,
  String? visitantePhoto,
  String? faseNome,
  String? grupoNome,
  int? mesaNumero,
  int? rodadaNumero,
  int? visitanteGols,
  int? mandantePontos,
  int? visitantePontos,
  int? partida,
  DateTime? dataJogo,
  int? mandanteGols,
  int? qtdeJogada,
  DocumentReference? idClubeMandante,
  DocumentReference? idClubeVisitante,
  DocumentReference? idFederationMandante,
  DocumentReference? idFederationVisitante,
  String? fotoClubeMandante,
  String? fotoClubeVisitante,
  String? fotoFederationMandante,
  String? fotoFederationVisitante,
  String? nomeClubeMandante,
  String? nomeClubeVisitante,
  String? nomeFederationVisitante,
  String? nomeFederationMandante,
  String? nomeChampion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idChampion': idChampion,
      'idModalidade': idModalidade,
      'idFederation': idFederation,
      'idClube': idClube,
      'idFase': idFase,
      'idGrupo': idGrupo,
      'idParticipanteMandante': idParticipanteMandante,
      'idParticipanteVisitante': idParticipanteVisitante,
      'idUsuarioMandante': idUsuarioMandante,
      'idUsuarioVistante': idUsuarioVistante,
      'mandanteNome': mandanteNome,
      'mandanteApelido': mandanteApelido,
      'mandantePhoto': mandantePhoto,
      'visitanteNome': visitanteNome,
      'visitanteApelido': visitanteApelido,
      'visitantePhoto': visitantePhoto,
      'faseNome': faseNome,
      'grupoNome': grupoNome,
      'mesaNumero': mesaNumero,
      'rodadaNumero': rodadaNumero,
      'visitanteGols': visitanteGols,
      'mandantePontos': mandantePontos,
      'visitantePontos': visitantePontos,
      'partida': partida,
      'data_jogo': dataJogo,
      'mandanteGols': mandanteGols,
      'qtde_jogada': qtdeJogada,
      'idClubeMandante': idClubeMandante,
      'idClubeVisitante': idClubeVisitante,
      'idFederationMandante': idFederationMandante,
      'idFederationVisitante': idFederationVisitante,
      'FotoClubeMandante': fotoClubeMandante,
      'FotoClubeVisitante': fotoClubeVisitante,
      'FotoFederationMandante': fotoFederationMandante,
      'FotoFederationVisitante': fotoFederationVisitante,
      'NomeClubeMandante': nomeClubeMandante,
      'NomeClubeVisitante': nomeClubeVisitante,
      'NomeFederationVisitante': nomeFederationVisitante,
      'NomeFederationMandante': nomeFederationMandante,
      'NomeChampion': nomeChampion,
    }.withoutNulls,
  );

  return firestoreData;
}

class JogosRecordDocumentEquality implements Equality<JogosRecord> {
  const JogosRecordDocumentEquality();

  @override
  bool equals(JogosRecord? e1, JogosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idChampion == e2?.idChampion &&
        e1?.idModalidade == e2?.idModalidade &&
        e1?.idFederation == e2?.idFederation &&
        e1?.idClube == e2?.idClube &&
        e1?.idFase == e2?.idFase &&
        e1?.idGrupo == e2?.idGrupo &&
        e1?.idParticipanteMandante == e2?.idParticipanteMandante &&
        e1?.idParticipanteVisitante == e2?.idParticipanteVisitante &&
        e1?.idUsuarioMandante == e2?.idUsuarioMandante &&
        e1?.idUsuarioVistante == e2?.idUsuarioVistante &&
        e1?.mandanteNome == e2?.mandanteNome &&
        e1?.mandanteApelido == e2?.mandanteApelido &&
        e1?.mandantePhoto == e2?.mandantePhoto &&
        e1?.visitanteNome == e2?.visitanteNome &&
        e1?.visitanteApelido == e2?.visitanteApelido &&
        e1?.visitantePhoto == e2?.visitantePhoto &&
        e1?.faseNome == e2?.faseNome &&
        e1?.grupoNome == e2?.grupoNome &&
        e1?.mesaNumero == e2?.mesaNumero &&
        e1?.rodadaNumero == e2?.rodadaNumero &&
        e1?.visitanteGols == e2?.visitanteGols &&
        e1?.mandantePontos == e2?.mandantePontos &&
        e1?.visitantePontos == e2?.visitantePontos &&
        e1?.partida == e2?.partida &&
        e1?.dataJogo == e2?.dataJogo &&
        e1?.mandanteGols == e2?.mandanteGols &&
        e1?.qtdeJogada == e2?.qtdeJogada &&
        e1?.idClubeMandante == e2?.idClubeMandante &&
        e1?.idClubeVisitante == e2?.idClubeVisitante &&
        e1?.idFederationMandante == e2?.idFederationMandante &&
        e1?.idFederationVisitante == e2?.idFederationVisitante &&
        e1?.fotoClubeMandante == e2?.fotoClubeMandante &&
        e1?.fotoClubeVisitante == e2?.fotoClubeVisitante &&
        e1?.fotoFederationMandante == e2?.fotoFederationMandante &&
        e1?.fotoFederationVisitante == e2?.fotoFederationVisitante &&
        e1?.nomeClubeMandante == e2?.nomeClubeMandante &&
        e1?.nomeClubeVisitante == e2?.nomeClubeVisitante &&
        e1?.nomeFederationVisitante == e2?.nomeFederationVisitante &&
        e1?.nomeFederationMandante == e2?.nomeFederationMandante &&
        listEquality.equals(e1?.listaUsuario, e2?.listaUsuario) &&
        e1?.nomeChampion == e2?.nomeChampion;
  }

  @override
  int hash(JogosRecord? e) => const ListEquality().hash([
        e?.idChampion,
        e?.idModalidade,
        e?.idFederation,
        e?.idClube,
        e?.idFase,
        e?.idGrupo,
        e?.idParticipanteMandante,
        e?.idParticipanteVisitante,
        e?.idUsuarioMandante,
        e?.idUsuarioVistante,
        e?.mandanteNome,
        e?.mandanteApelido,
        e?.mandantePhoto,
        e?.visitanteNome,
        e?.visitanteApelido,
        e?.visitantePhoto,
        e?.faseNome,
        e?.grupoNome,
        e?.mesaNumero,
        e?.rodadaNumero,
        e?.visitanteGols,
        e?.mandantePontos,
        e?.visitantePontos,
        e?.partida,
        e?.dataJogo,
        e?.mandanteGols,
        e?.qtdeJogada,
        e?.idClubeMandante,
        e?.idClubeVisitante,
        e?.idFederationMandante,
        e?.idFederationVisitante,
        e?.fotoClubeMandante,
        e?.fotoClubeVisitante,
        e?.fotoFederationMandante,
        e?.fotoFederationVisitante,
        e?.nomeClubeMandante,
        e?.nomeClubeVisitante,
        e?.nomeFederationVisitante,
        e?.nomeFederationMandante,
        e?.listaUsuario,
        e?.nomeChampion
      ]);

  @override
  bool isValidKey(Object? o) => o is JogosRecord;
}
