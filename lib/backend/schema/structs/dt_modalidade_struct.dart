// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DtModalidadeStruct extends FFFirebaseStruct {
  DtModalidadeStruct({
    String? nomeModalidade,
    String? iDModalidade,
    String? fotoModalidade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomeModalidade = nomeModalidade,
        _iDModalidade = iDModalidade,
        _fotoModalidade = fotoModalidade,
        super(firestoreUtilData);

  // "Nome_modalidade" field.
  String? _nomeModalidade;
  String get nomeModalidade => _nomeModalidade ?? '';
  set nomeModalidade(String? val) => _nomeModalidade = val;
  bool hasNomeModalidade() => _nomeModalidade != null;

  // "ID_Modalidade" field.
  String? _iDModalidade;
  String get iDModalidade => _iDModalidade ?? '';
  set iDModalidade(String? val) => _iDModalidade = val;
  bool hasIDModalidade() => _iDModalidade != null;

  // "Foto_Modalidade" field.
  String? _fotoModalidade;
  String get fotoModalidade => _fotoModalidade ?? '';
  set fotoModalidade(String? val) => _fotoModalidade = val;
  bool hasFotoModalidade() => _fotoModalidade != null;

  static DtModalidadeStruct fromMap(Map<String, dynamic> data) =>
      DtModalidadeStruct(
        nomeModalidade: data['Nome_modalidade'] as String?,
        iDModalidade: data['ID_Modalidade'] as String?,
        fotoModalidade: data['Foto_Modalidade'] as String?,
      );

  static DtModalidadeStruct? maybeFromMap(dynamic data) => data is Map
      ? DtModalidadeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Nome_modalidade': _nomeModalidade,
        'ID_Modalidade': _iDModalidade,
        'Foto_Modalidade': _fotoModalidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Nome_modalidade': serializeParam(
          _nomeModalidade,
          ParamType.String,
        ),
        'ID_Modalidade': serializeParam(
          _iDModalidade,
          ParamType.String,
        ),
        'Foto_Modalidade': serializeParam(
          _fotoModalidade,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtModalidadeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtModalidadeStruct(
        nomeModalidade: deserializeParam(
          data['Nome_modalidade'],
          ParamType.String,
          false,
        ),
        iDModalidade: deserializeParam(
          data['ID_Modalidade'],
          ParamType.String,
          false,
        ),
        fotoModalidade: deserializeParam(
          data['Foto_Modalidade'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtModalidadeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtModalidadeStruct &&
        nomeModalidade == other.nomeModalidade &&
        iDModalidade == other.iDModalidade &&
        fotoModalidade == other.fotoModalidade;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nomeModalidade, iDModalidade, fotoModalidade]);
}

DtModalidadeStruct createDtModalidadeStruct({
  String? nomeModalidade,
  String? iDModalidade,
  String? fotoModalidade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DtModalidadeStruct(
      nomeModalidade: nomeModalidade,
      iDModalidade: iDModalidade,
      fotoModalidade: fotoModalidade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DtModalidadeStruct? updateDtModalidadeStruct(
  DtModalidadeStruct? dtModalidade, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dtModalidade
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDtModalidadeStructData(
  Map<String, dynamic> firestoreData,
  DtModalidadeStruct? dtModalidade,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dtModalidade == null) {
    return;
  }
  if (dtModalidade.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dtModalidade.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dtModalidadeData =
      getDtModalidadeFirestoreData(dtModalidade, forFieldValue);
  final nestedData =
      dtModalidadeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dtModalidade.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDtModalidadeFirestoreData(
  DtModalidadeStruct? dtModalidade, [
  bool forFieldValue = false,
]) {
  if (dtModalidade == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dtModalidade.toMap());

  // Add any Firestore field values
  dtModalidade.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDtModalidadeListFirestoreData(
  List<DtModalidadeStruct>? dtModalidades,
) =>
    dtModalidades?.map((e) => getDtModalidadeFirestoreData(e, true)).toList() ??
    [];
