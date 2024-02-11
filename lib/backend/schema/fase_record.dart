import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaseRecord extends FirestoreRecord {
  FaseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tituloFase" field.
  String? _tituloFase;
  String get tituloFase => _tituloFase ?? '';
  bool hasTituloFase() => _tituloFase != null;

  // "idChampion" field.
  DocumentReference? _idChampion;
  DocumentReference? get idChampion => _idChampion;
  bool hasIdChampion() => _idChampion != null;

  // "qtdGrupos" field.
  int? _qtdGrupos;
  int get qtdGrupos => _qtdGrupos ?? 0;
  bool hasQtdGrupos() => _qtdGrupos != null;

  // "rodadaAtual" field.
  int? _rodadaAtual;
  int get rodadaAtual => _rodadaAtual ?? 0;
  bool hasRodadaAtual() => _rodadaAtual != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "usuariosJaAgrupados" field.
  List<DocumentReference>? _usuariosJaAgrupados;
  List<DocumentReference> get usuariosJaAgrupados =>
      _usuariosJaAgrupados ?? const [];
  bool hasUsuariosJaAgrupados() => _usuariosJaAgrupados != null;

  // "tituloFaseUPPERCASE" field.
  String? _tituloFaseUPPERCASE;
  String get tituloFaseUPPERCASE => _tituloFaseUPPERCASE ?? '';
  bool hasTituloFaseUPPERCASE() => _tituloFaseUPPERCASE != null;

  // "orderFase" field.
  int? _orderFase;
  int get orderFase => _orderFase ?? 0;
  bool hasOrderFase() => _orderFase != null;

  // "configuracaoNextFase" field.
  ConfigNextStruct? _configuracaoNextFase;
  ConfigNextStruct get configuracaoNextFase =>
      _configuracaoNextFase ?? ConfigNextStruct();
  bool hasConfiguracaoNextFase() => _configuracaoNextFase != null;

  // "dataEncerramento" field.
  DateTime? _dataEncerramento;
  DateTime? get dataEncerramento => _dataEncerramento;
  bool hasDataEncerramento() => _dataEncerramento != null;

  void _initializeFields() {
    _tituloFase = snapshotData['tituloFase'] as String?;
    _idChampion = snapshotData['idChampion'] as DocumentReference?;
    _qtdGrupos = castToType<int>(snapshotData['qtdGrupos']);
    _rodadaAtual = castToType<int>(snapshotData['rodadaAtual']);
    _status = castToType<int>(snapshotData['status']);
    _usuariosJaAgrupados = getDataList(snapshotData['usuariosJaAgrupados']);
    _tituloFaseUPPERCASE = snapshotData['tituloFaseUPPERCASE'] as String?;
    _orderFase = castToType<int>(snapshotData['orderFase']);
    _configuracaoNextFase =
        ConfigNextStruct.maybeFromMap(snapshotData['configuracaoNextFase']);
    _dataEncerramento = snapshotData['dataEncerramento'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Fase');

  static Stream<FaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FaseRecord.fromSnapshot(s));

  static Future<FaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FaseRecord.fromSnapshot(s));

  static FaseRecord fromSnapshot(DocumentSnapshot snapshot) => FaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFaseRecordData({
  String? tituloFase,
  DocumentReference? idChampion,
  int? qtdGrupos,
  int? rodadaAtual,
  int? status,
  String? tituloFaseUPPERCASE,
  int? orderFase,
  ConfigNextStruct? configuracaoNextFase,
  DateTime? dataEncerramento,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tituloFase': tituloFase,
      'idChampion': idChampion,
      'qtdGrupos': qtdGrupos,
      'rodadaAtual': rodadaAtual,
      'status': status,
      'tituloFaseUPPERCASE': tituloFaseUPPERCASE,
      'orderFase': orderFase,
      'configuracaoNextFase': ConfigNextStruct().toMap(),
      'dataEncerramento': dataEncerramento,
    }.withoutNulls,
  );

  // Handle nested data for "configuracaoNextFase" field.
  addConfigNextStructData(
      firestoreData, configuracaoNextFase, 'configuracaoNextFase');

  return firestoreData;
}

class FaseRecordDocumentEquality implements Equality<FaseRecord> {
  const FaseRecordDocumentEquality();

  @override
  bool equals(FaseRecord? e1, FaseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tituloFase == e2?.tituloFase &&
        e1?.idChampion == e2?.idChampion &&
        e1?.qtdGrupos == e2?.qtdGrupos &&
        e1?.rodadaAtual == e2?.rodadaAtual &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.usuariosJaAgrupados, e2?.usuariosJaAgrupados) &&
        e1?.tituloFaseUPPERCASE == e2?.tituloFaseUPPERCASE &&
        e1?.orderFase == e2?.orderFase &&
        e1?.configuracaoNextFase == e2?.configuracaoNextFase &&
        e1?.dataEncerramento == e2?.dataEncerramento;
  }

  @override
  int hash(FaseRecord? e) => const ListEquality().hash([
        e?.tituloFase,
        e?.idChampion,
        e?.qtdGrupos,
        e?.rodadaAtual,
        e?.status,
        e?.usuariosJaAgrupados,
        e?.tituloFaseUPPERCASE,
        e?.orderFase,
        e?.configuracaoNextFase,
        e?.dataEncerramento
      ]);

  @override
  bool isValidKey(Object? o) => o is FaseRecord;
}
