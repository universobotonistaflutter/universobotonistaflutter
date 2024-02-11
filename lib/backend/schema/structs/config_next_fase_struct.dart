// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigNextFaseStruct extends FFFirebaseStruct {
  ConfigNextFaseStruct({
    DocumentReference? idFase,
    DocumentReference? idGrupo,
    int? posicao,
    int? tipoFiltro,
    String? faseNome,
    String? grupoNome,
    String? participanteNome,
    DocumentReference? participanteId,
    DocumentReference? idGrupoBase,
    DocumentReference? idFaseBase,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _idFase = idFase,
        _idGrupo = idGrupo,
        _posicao = posicao,
        _tipoFiltro = tipoFiltro,
        _faseNome = faseNome,
        _grupoNome = grupoNome,
        _participanteNome = participanteNome,
        _participanteId = participanteId,
        _idGrupoBase = idGrupoBase,
        _idFaseBase = idFaseBase,
        super(firestoreUtilData);

  // "id_fase" field.
  DocumentReference? _idFase;
  DocumentReference? get idFase => _idFase;
  set idFase(DocumentReference? val) => _idFase = val;
  bool hasIdFase() => _idFase != null;

  // "id_grupo" field.
  DocumentReference? _idGrupo;
  DocumentReference? get idGrupo => _idGrupo;
  set idGrupo(DocumentReference? val) => _idGrupo = val;
  bool hasIdGrupo() => _idGrupo != null;

  // "posicao" field.
  int? _posicao;
  int get posicao => _posicao ?? 0;
  set posicao(int? val) => _posicao = val;
  void incrementPosicao(int amount) => _posicao = posicao + amount;
  bool hasPosicao() => _posicao != null;

  // "tipo_filtro" field.
  int? _tipoFiltro;
  int get tipoFiltro => _tipoFiltro ?? 0;
  set tipoFiltro(int? val) => _tipoFiltro = val;
  void incrementTipoFiltro(int amount) => _tipoFiltro = tipoFiltro + amount;
  bool hasTipoFiltro() => _tipoFiltro != null;

  // "fase_nome" field.
  String? _faseNome;
  String get faseNome => _faseNome ?? '';
  set faseNome(String? val) => _faseNome = val;
  bool hasFaseNome() => _faseNome != null;

  // "grupo_nome" field.
  String? _grupoNome;
  String get grupoNome => _grupoNome ?? '';
  set grupoNome(String? val) => _grupoNome = val;
  bool hasGrupoNome() => _grupoNome != null;

  // "participante_nome" field.
  String? _participanteNome;
  String get participanteNome => _participanteNome ?? '';
  set participanteNome(String? val) => _participanteNome = val;
  bool hasParticipanteNome() => _participanteNome != null;

  // "participante_id" field.
  DocumentReference? _participanteId;
  DocumentReference? get participanteId => _participanteId;
  set participanteId(DocumentReference? val) => _participanteId = val;
  bool hasParticipanteId() => _participanteId != null;

  // "id_grupo_base" field.
  DocumentReference? _idGrupoBase;
  DocumentReference? get idGrupoBase => _idGrupoBase;
  set idGrupoBase(DocumentReference? val) => _idGrupoBase = val;
  bool hasIdGrupoBase() => _idGrupoBase != null;

  // "id_fase_base" field.
  DocumentReference? _idFaseBase;
  DocumentReference? get idFaseBase => _idFaseBase;
  set idFaseBase(DocumentReference? val) => _idFaseBase = val;
  bool hasIdFaseBase() => _idFaseBase != null;

  static ConfigNextFaseStruct fromMap(Map<String, dynamic> data) =>
      ConfigNextFaseStruct(
        idFase: data['id_fase'] as DocumentReference?,
        idGrupo: data['id_grupo'] as DocumentReference?,
        posicao: castToType<int>(data['posicao']),
        tipoFiltro: castToType<int>(data['tipo_filtro']),
        faseNome: data['fase_nome'] as String?,
        grupoNome: data['grupo_nome'] as String?,
        participanteNome: data['participante_nome'] as String?,
        participanteId: data['participante_id'] as DocumentReference?,
        idGrupoBase: data['id_grupo_base'] as DocumentReference?,
        idFaseBase: data['id_fase_base'] as DocumentReference?,
      );

  static ConfigNextFaseStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigNextFaseStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id_fase': _idFase,
        'id_grupo': _idGrupo,
        'posicao': _posicao,
        'tipo_filtro': _tipoFiltro,
        'fase_nome': _faseNome,
        'grupo_nome': _grupoNome,
        'participante_nome': _participanteNome,
        'participante_id': _participanteId,
        'id_grupo_base': _idGrupoBase,
        'id_fase_base': _idFaseBase,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id_fase': serializeParam(
          _idFase,
          ParamType.DocumentReference,
        ),
        'id_grupo': serializeParam(
          _idGrupo,
          ParamType.DocumentReference,
        ),
        'posicao': serializeParam(
          _posicao,
          ParamType.int,
        ),
        'tipo_filtro': serializeParam(
          _tipoFiltro,
          ParamType.int,
        ),
        'fase_nome': serializeParam(
          _faseNome,
          ParamType.String,
        ),
        'grupo_nome': serializeParam(
          _grupoNome,
          ParamType.String,
        ),
        'participante_nome': serializeParam(
          _participanteNome,
          ParamType.String,
        ),
        'participante_id': serializeParam(
          _participanteId,
          ParamType.DocumentReference,
        ),
        'id_grupo_base': serializeParam(
          _idGrupoBase,
          ParamType.DocumentReference,
        ),
        'id_fase_base': serializeParam(
          _idFaseBase,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ConfigNextFaseStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigNextFaseStruct(
        idFase: deserializeParam(
          data['id_fase'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Fase'],
        ),
        idGrupo: deserializeParam(
          data['id_grupo'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Grupo'],
        ),
        posicao: deserializeParam(
          data['posicao'],
          ParamType.int,
          false,
        ),
        tipoFiltro: deserializeParam(
          data['tipo_filtro'],
          ParamType.int,
          false,
        ),
        faseNome: deserializeParam(
          data['fase_nome'],
          ParamType.String,
          false,
        ),
        grupoNome: deserializeParam(
          data['grupo_nome'],
          ParamType.String,
          false,
        ),
        participanteNome: deserializeParam(
          data['participante_nome'],
          ParamType.String,
          false,
        ),
        participanteId: deserializeParam(
          data['participante_id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Participante'],
        ),
        idGrupoBase: deserializeParam(
          data['id_grupo_base'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Grupo'],
        ),
        idFaseBase: deserializeParam(
          data['id_fase_base'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Fase'],
        ),
      );

  @override
  String toString() => 'ConfigNextFaseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConfigNextFaseStruct &&
        idFase == other.idFase &&
        idGrupo == other.idGrupo &&
        posicao == other.posicao &&
        tipoFiltro == other.tipoFiltro &&
        faseNome == other.faseNome &&
        grupoNome == other.grupoNome &&
        participanteNome == other.participanteNome &&
        participanteId == other.participanteId &&
        idGrupoBase == other.idGrupoBase &&
        idFaseBase == other.idFaseBase;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idFase,
        idGrupo,
        posicao,
        tipoFiltro,
        faseNome,
        grupoNome,
        participanteNome,
        participanteId,
        idGrupoBase,
        idFaseBase
      ]);
}

ConfigNextFaseStruct createConfigNextFaseStruct({
  DocumentReference? idFase,
  DocumentReference? idGrupo,
  int? posicao,
  int? tipoFiltro,
  String? faseNome,
  String? grupoNome,
  String? participanteNome,
  DocumentReference? participanteId,
  DocumentReference? idGrupoBase,
  DocumentReference? idFaseBase,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigNextFaseStruct(
      idFase: idFase,
      idGrupo: idGrupo,
      posicao: posicao,
      tipoFiltro: tipoFiltro,
      faseNome: faseNome,
      grupoNome: grupoNome,
      participanteNome: participanteNome,
      participanteId: participanteId,
      idGrupoBase: idGrupoBase,
      idFaseBase: idFaseBase,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigNextFaseStruct? updateConfigNextFaseStruct(
  ConfigNextFaseStruct? configNextFase, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configNextFase
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigNextFaseStructData(
  Map<String, dynamic> firestoreData,
  ConfigNextFaseStruct? configNextFase,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configNextFase == null) {
    return;
  }
  if (configNextFase.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configNextFase.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configNextFaseData =
      getConfigNextFaseFirestoreData(configNextFase, forFieldValue);
  final nestedData =
      configNextFaseData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configNextFase.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigNextFaseFirestoreData(
  ConfigNextFaseStruct? configNextFase, [
  bool forFieldValue = false,
]) {
  if (configNextFase == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configNextFase.toMap());

  // Add any Firestore field values
  configNextFase.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigNextFaseListFirestoreData(
  List<ConfigNextFaseStruct>? configNextFases,
) =>
    configNextFases
        ?.map((e) => getConfigNextFaseFirestoreData(e, true))
        .toList() ??
    [];
