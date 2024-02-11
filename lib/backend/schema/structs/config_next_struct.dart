// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigNextStruct extends FFFirebaseStruct {
  ConfigNextStruct({
    List<ConfigNextFaseStruct>? listaScriptNextFase,
    int? posicao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _listaScriptNextFase = listaScriptNextFase,
        _posicao = posicao,
        super(firestoreUtilData);

  // "listaScriptNextFase" field.
  List<ConfigNextFaseStruct>? _listaScriptNextFase;
  List<ConfigNextFaseStruct> get listaScriptNextFase =>
      _listaScriptNextFase ?? const [];
  set listaScriptNextFase(List<ConfigNextFaseStruct>? val) =>
      _listaScriptNextFase = val;
  void updateListaScriptNextFase(
          Function(List<ConfigNextFaseStruct>) updateFn) =>
      updateFn(_listaScriptNextFase ??= []);
  bool hasListaScriptNextFase() => _listaScriptNextFase != null;

  // "posicao" field.
  int? _posicao;
  int get posicao => _posicao ?? 0;
  set posicao(int? val) => _posicao = val;
  void incrementPosicao(int amount) => _posicao = posicao + amount;
  bool hasPosicao() => _posicao != null;

  static ConfigNextStruct fromMap(Map<String, dynamic> data) =>
      ConfigNextStruct(
        listaScriptNextFase: getStructList(
          data['listaScriptNextFase'],
          ConfigNextFaseStruct.fromMap,
        ),
        posicao: castToType<int>(data['posicao']),
      );

  static ConfigNextStruct? maybeFromMap(dynamic data) => data is Map
      ? ConfigNextStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'listaScriptNextFase':
            _listaScriptNextFase?.map((e) => e.toMap()).toList(),
        'posicao': _posicao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'listaScriptNextFase': serializeParam(
          _listaScriptNextFase,
          ParamType.DataStruct,
          true,
        ),
        'posicao': serializeParam(
          _posicao,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConfigNextStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConfigNextStruct(
        listaScriptNextFase: deserializeStructParam<ConfigNextFaseStruct>(
          data['listaScriptNextFase'],
          ParamType.DataStruct,
          true,
          structBuilder: ConfigNextFaseStruct.fromSerializableMap,
        ),
        posicao: deserializeParam(
          data['posicao'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConfigNextStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConfigNextStruct &&
        listEquality.equals(listaScriptNextFase, other.listaScriptNextFase) &&
        posicao == other.posicao;
  }

  @override
  int get hashCode => const ListEquality().hash([listaScriptNextFase, posicao]);
}

ConfigNextStruct createConfigNextStruct({
  int? posicao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConfigNextStruct(
      posicao: posicao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConfigNextStruct? updateConfigNextStruct(
  ConfigNextStruct? configNext, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    configNext
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConfigNextStructData(
  Map<String, dynamic> firestoreData,
  ConfigNextStruct? configNext,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (configNext == null) {
    return;
  }
  if (configNext.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && configNext.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final configNextData = getConfigNextFirestoreData(configNext, forFieldValue);
  final nestedData = configNextData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = configNext.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConfigNextFirestoreData(
  ConfigNextStruct? configNext, [
  bool forFieldValue = false,
]) {
  if (configNext == null) {
    return {};
  }
  final firestoreData = mapToFirestore(configNext.toMap());

  // Add any Firestore field values
  configNext.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConfigNextListFirestoreData(
  List<ConfigNextStruct>? configNexts,
) =>
    configNexts?.map((e) => getConfigNextFirestoreData(e, true)).toList() ?? [];
