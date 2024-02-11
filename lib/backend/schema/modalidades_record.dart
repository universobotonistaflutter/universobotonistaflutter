import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModalidadesRecord extends FirestoreRecord {
  ModalidadesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Modalidades" field.
  String? _modalidades;
  String get modalidades => _modalidades ?? '';
  bool hasModalidades() => _modalidades != null;

  // "Fotos" field.
  String? _fotos;
  String get fotos => _fotos ?? '';
  bool hasFotos() => _fotos != null;

  // "Regras" field.
  String? _regras;
  String get regras => _regras ?? '';
  bool hasRegras() => _regras != null;

  // "Seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "Fotospb" field.
  String? _fotospb;
  String get fotospb => _fotospb ?? '';
  bool hasFotospb() => _fotospb != null;

  // "usuariosModalidade" field.
  List<DocumentReference>? _usuariosModalidade;
  List<DocumentReference> get usuariosModalidade =>
      _usuariosModalidade ?? const [];
  bool hasUsuariosModalidade() => _usuariosModalidade != null;

  // "federacoesModalidade" field.
  List<DocumentReference>? _federacoesModalidade;
  List<DocumentReference> get federacoesModalidade =>
      _federacoesModalidade ?? const [];
  bool hasFederacoesModalidade() => _federacoesModalidade != null;

  void _initializeFields() {
    _modalidades = snapshotData['Modalidades'] as String?;
    _fotos = snapshotData['Fotos'] as String?;
    _regras = snapshotData['Regras'] as String?;
    _seq = castToType<int>(snapshotData['Seq']);
    _fotospb = snapshotData['Fotospb'] as String?;
    _usuariosModalidade = getDataList(snapshotData['usuariosModalidade']);
    _federacoesModalidade = getDataList(snapshotData['federacoesModalidade']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Modalidades');

  static Stream<ModalidadesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModalidadesRecord.fromSnapshot(s));

  static Future<ModalidadesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModalidadesRecord.fromSnapshot(s));

  static ModalidadesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ModalidadesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModalidadesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModalidadesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModalidadesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModalidadesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModalidadesRecordData({
  String? modalidades,
  String? fotos,
  String? regras,
  int? seq,
  String? fotospb,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Modalidades': modalidades,
      'Fotos': fotos,
      'Regras': regras,
      'Seq': seq,
      'Fotospb': fotospb,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModalidadesRecordDocumentEquality implements Equality<ModalidadesRecord> {
  const ModalidadesRecordDocumentEquality();

  @override
  bool equals(ModalidadesRecord? e1, ModalidadesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.modalidades == e2?.modalidades &&
        e1?.fotos == e2?.fotos &&
        e1?.regras == e2?.regras &&
        e1?.seq == e2?.seq &&
        e1?.fotospb == e2?.fotospb &&
        listEquality.equals(e1?.usuariosModalidade, e2?.usuariosModalidade) &&
        listEquality.equals(e1?.federacoesModalidade, e2?.federacoesModalidade);
  }

  @override
  int hash(ModalidadesRecord? e) => const ListEquality().hash([
        e?.modalidades,
        e?.fotos,
        e?.regras,
        e?.seq,
        e?.fotospb,
        e?.usuariosModalidade,
        e?.federacoesModalidade
      ]);

  @override
  bool isValidKey(Object? o) => o is ModalidadesRecord;
}
