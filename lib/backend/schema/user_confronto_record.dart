import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserConfrontoRecord extends FirestoreRecord {
  UserConfrontoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "idAdversario" field.
  DocumentReference? _idAdversario;
  DocumentReference? get idAdversario => _idAdversario;
  bool hasIdAdversario() => _idAdversario != null;

  // "totalPartidas" field.
  int? _totalPartidas;
  int get totalPartidas => _totalPartidas ?? 0;
  bool hasTotalPartidas() => _totalPartidas != null;

  // "totalVitorias" field.
  int? _totalVitorias;
  int get totalVitorias => _totalVitorias ?? 0;
  bool hasTotalVitorias() => _totalVitorias != null;

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

  // "dataLastUpdate" field.
  DateTime? _dataLastUpdate;
  DateTime? get dataLastUpdate => _dataLastUpdate;
  bool hasDataLastUpdate() => _dataLastUpdate != null;

  // "adversario_nome" field.
  String? _adversarioNome;
  String get adversarioNome => _adversarioNome ?? '';
  bool hasAdversarioNome() => _adversarioNome != null;

  // "adversario_photo" field.
  String? _adversarioPhoto;
  String get adversarioPhoto => _adversarioPhoto ?? '';
  bool hasAdversarioPhoto() => _adversarioPhoto != null;

  // "adversario_apelido" field.
  String? _adversarioApelido;
  String get adversarioApelido => _adversarioApelido ?? '';
  bool hasAdversarioApelido() => _adversarioApelido != null;

  // "listaChampion" field.
  List<DocumentReference>? _listaChampion;
  List<DocumentReference> get listaChampion => _listaChampion ?? const [];
  bool hasListaChampion() => _listaChampion != null;

  // "listaJogos" field.
  List<DocumentReference>? _listaJogos;
  List<DocumentReference> get listaJogos => _listaJogos ?? const [];
  bool hasListaJogos() => _listaJogos != null;

  // "totalEmpates" field.
  int? _totalEmpates;
  int get totalEmpates => _totalEmpates ?? 0;
  bool hasTotalEmpates() => _totalEmpates != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _idAdversario = snapshotData['idAdversario'] as DocumentReference?;
    _totalPartidas = castToType<int>(snapshotData['totalPartidas']);
    _totalVitorias = castToType<int>(snapshotData['totalVitorias']);
    _totalDerrotas = castToType<int>(snapshotData['totalDerrotas']);
    _totalGolsPro = castToType<int>(snapshotData['totalGolsPro']);
    _totalGolsContra = castToType<int>(snapshotData['totalGolsContra']);
    _totalSaldoGols = castToType<int>(snapshotData['totalSaldoGols']);
    _dataLastUpdate = snapshotData['dataLastUpdate'] as DateTime?;
    _adversarioNome = snapshotData['adversario_nome'] as String?;
    _adversarioPhoto = snapshotData['adversario_photo'] as String?;
    _adversarioApelido = snapshotData['adversario_apelido'] as String?;
    _listaChampion = getDataList(snapshotData['listaChampion']);
    _listaJogos = getDataList(snapshotData['listaJogos']);
    _totalEmpates = castToType<int>(snapshotData['totalEmpates']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('UserConfronto')
          : FirebaseFirestore.instance.collectionGroup('UserConfronto');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('UserConfronto').doc(id);

  static Stream<UserConfrontoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserConfrontoRecord.fromSnapshot(s));

  static Future<UserConfrontoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserConfrontoRecord.fromSnapshot(s));

  static UserConfrontoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserConfrontoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserConfrontoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserConfrontoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserConfrontoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserConfrontoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserConfrontoRecordData({
  DocumentReference? idAdversario,
  int? totalPartidas,
  int? totalVitorias,
  int? totalDerrotas,
  int? totalGolsPro,
  int? totalGolsContra,
  int? totalSaldoGols,
  DateTime? dataLastUpdate,
  String? adversarioNome,
  String? adversarioPhoto,
  String? adversarioApelido,
  int? totalEmpates,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'idAdversario': idAdversario,
      'totalPartidas': totalPartidas,
      'totalVitorias': totalVitorias,
      'totalDerrotas': totalDerrotas,
      'totalGolsPro': totalGolsPro,
      'totalGolsContra': totalGolsContra,
      'totalSaldoGols': totalSaldoGols,
      'dataLastUpdate': dataLastUpdate,
      'adversario_nome': adversarioNome,
      'adversario_photo': adversarioPhoto,
      'adversario_apelido': adversarioApelido,
      'totalEmpates': totalEmpates,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserConfrontoRecordDocumentEquality
    implements Equality<UserConfrontoRecord> {
  const UserConfrontoRecordDocumentEquality();

  @override
  bool equals(UserConfrontoRecord? e1, UserConfrontoRecord? e2) {
    const listEquality = ListEquality();
    return e1?.idAdversario == e2?.idAdversario &&
        e1?.totalPartidas == e2?.totalPartidas &&
        e1?.totalVitorias == e2?.totalVitorias &&
        e1?.totalDerrotas == e2?.totalDerrotas &&
        e1?.totalGolsPro == e2?.totalGolsPro &&
        e1?.totalGolsContra == e2?.totalGolsContra &&
        e1?.totalSaldoGols == e2?.totalSaldoGols &&
        e1?.dataLastUpdate == e2?.dataLastUpdate &&
        e1?.adversarioNome == e2?.adversarioNome &&
        e1?.adversarioPhoto == e2?.adversarioPhoto &&
        e1?.adversarioApelido == e2?.adversarioApelido &&
        listEquality.equals(e1?.listaChampion, e2?.listaChampion) &&
        listEquality.equals(e1?.listaJogos, e2?.listaJogos) &&
        e1?.totalEmpates == e2?.totalEmpates;
  }

  @override
  int hash(UserConfrontoRecord? e) => const ListEquality().hash([
        e?.idAdversario,
        e?.totalPartidas,
        e?.totalVitorias,
        e?.totalDerrotas,
        e?.totalGolsPro,
        e?.totalGolsContra,
        e?.totalSaldoGols,
        e?.dataLastUpdate,
        e?.adversarioNome,
        e?.adversarioPhoto,
        e?.adversarioApelido,
        e?.listaChampion,
        e?.listaJogos,
        e?.totalEmpates
      ]);

  @override
  bool isValidKey(Object? o) => o is UserConfrontoRecord;
}
