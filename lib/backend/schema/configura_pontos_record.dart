import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfiguraPontosRecord extends FirestoreRecord {
  ConfiguraPontosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Colocacao" field.
  int? _colocacao;
  int get colocacao => _colocacao ?? 0;
  bool hasColocacao() => _colocacao != null;

  // "Qtdade_Pontos" field.
  int? _qtdadePontos;
  int get qtdadePontos => _qtdadePontos ?? 0;
  bool hasQtdadePontos() => _qtdadePontos != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _colocacao = castToType<int>(snapshotData['Colocacao']);
    _qtdadePontos = castToType<int>(snapshotData['Qtdade_Pontos']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ConfiguraPontos')
          : FirebaseFirestore.instance.collectionGroup('ConfiguraPontos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ConfiguraPontos').doc(id);

  static Stream<ConfiguraPontosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfiguraPontosRecord.fromSnapshot(s));

  static Future<ConfiguraPontosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfiguraPontosRecord.fromSnapshot(s));

  static ConfiguraPontosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ConfiguraPontosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfiguraPontosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfiguraPontosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfiguraPontosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfiguraPontosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfiguraPontosRecordData({
  int? colocacao,
  int? qtdadePontos,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Colocacao': colocacao,
      'Qtdade_Pontos': qtdadePontos,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfiguraPontosRecordDocumentEquality
    implements Equality<ConfiguraPontosRecord> {
  const ConfiguraPontosRecordDocumentEquality();

  @override
  bool equals(ConfiguraPontosRecord? e1, ConfiguraPontosRecord? e2) {
    return e1?.colocacao == e2?.colocacao &&
        e1?.qtdadePontos == e2?.qtdadePontos;
  }

  @override
  int hash(ConfiguraPontosRecord? e) =>
      const ListEquality().hash([e?.colocacao, e?.qtdadePontos]);

  @override
  bool isValidKey(Object? o) => o is ConfiguraPontosRecord;
}
