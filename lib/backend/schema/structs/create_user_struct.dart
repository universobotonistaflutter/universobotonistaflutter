// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CreateUserStruct extends FFFirebaseStruct {
  CreateUserStruct({
    String? nome,
    String? email,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _email = email,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;
  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  static CreateUserStruct fromMap(Map<String, dynamic> data) =>
      CreateUserStruct(
        nome: data['nome'] as String?,
        email: data['email'] as String?,
      );

  static CreateUserStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateUserStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static CreateUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateUserStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CreateUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CreateUserStruct &&
        nome == other.nome &&
        email == other.email;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, email]);
}

CreateUserStruct createCreateUserStruct({
  String? nome,
  String? email,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreateUserStruct(
      nome: nome,
      email: email,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreateUserStruct? updateCreateUserStruct(
  CreateUserStruct? createUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    createUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreateUserStructData(
  Map<String, dynamic> firestoreData,
  CreateUserStruct? createUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (createUser == null) {
    return;
  }
  if (createUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && createUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final createUserData = getCreateUserFirestoreData(createUser, forFieldValue);
  final nestedData = createUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = createUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreateUserFirestoreData(
  CreateUserStruct? createUser, [
  bool forFieldValue = false,
]) {
  if (createUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(createUser.toMap());

  // Add any Firestore field values
  createUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreateUserListFirestoreData(
  List<CreateUserStruct>? createUsers,
) =>
    createUsers?.map((e) => getCreateUserFirestoreData(e, true)).toList() ?? [];
