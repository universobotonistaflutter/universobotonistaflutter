import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FederationsRecord extends FirestoreRecord {
  FederationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "Nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "Liga" field.
  bool? _liga;
  bool get liga => _liga ?? false;
  bool hasLiga() => _liga != null;

  // "UF" field.
  String? _uf;
  String get uf => _uf ?? '';
  bool hasUf() => _uf != null;

  // "Id_Clube" field.
  List<DocumentReference>? _idClube;
  List<DocumentReference> get idClube => _idClube ?? const [];
  bool hasIdClube() => _idClube != null;

  // "usuariosFederation" field.
  List<DocumentReference>? _usuariosFederation;
  List<DocumentReference> get usuariosFederation =>
      _usuariosFederation ?? const [];
  bool hasUsuariosFederation() => _usuariosFederation != null;

  // "AssinaturaExpira" field.
  DateTime? _assinaturaExpira;
  DateTime? get assinaturaExpira => _assinaturaExpira;
  bool hasAssinaturaExpira() => _assinaturaExpira != null;

  // "adminFederer" field.
  List<DocumentReference>? _adminFederer;
  List<DocumentReference> get adminFederer => _adminFederer ?? const [];
  bool hasAdminFederer() => _adminFederer != null;

  // "site" field.
  String? _site;
  String get site => _site ?? '';
  bool hasSite() => _site != null;

  // "nome_presidente" field.
  String? _nomePresidente;
  String get nomePresidente => _nomePresidente ?? '';
  bool hasNomePresidente() => _nomePresidente != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "Phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "Id_Modalidade" field.
  List<DocumentReference>? _idModalidade;
  List<DocumentReference> get idModalidade => _idModalidade ?? const [];
  bool hasIdModalidade() => _idModalidade != null;

  // "Pais" field.
  String? _pais;
  String get pais => _pais ?? '';
  bool hasPais() => _pais != null;

  void _initializeFields() {
    _foto = snapshotData['Foto'] as String?;
    _nome = snapshotData['Nome'] as String?;
    _liga = snapshotData['Liga'] as bool?;
    _uf = snapshotData['UF'] as String?;
    _idClube = getDataList(snapshotData['Id_Clube']);
    _usuariosFederation = getDataList(snapshotData['usuariosFederation']);
    _assinaturaExpira = snapshotData['AssinaturaExpira'] as DateTime?;
    _adminFederer = getDataList(snapshotData['adminFederer']);
    _site = snapshotData['site'] as String?;
    _nomePresidente = snapshotData['nome_presidente'] as String?;
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['Phone'] as String?;
    _idModalidade = getDataList(snapshotData['Id_Modalidade']);
    _pais = snapshotData['Pais'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Federations');

  static Stream<FederationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FederationsRecord.fromSnapshot(s));

  static Future<FederationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FederationsRecord.fromSnapshot(s));

  static FederationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FederationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FederationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FederationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FederationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FederationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFederationsRecordData({
  String? foto,
  String? nome,
  bool? liga,
  String? uf,
  DateTime? assinaturaExpira,
  String? site,
  String? nomePresidente,
  String? email,
  String? phone,
  String? pais,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Foto': foto,
      'Nome': nome,
      'Liga': liga,
      'UF': uf,
      'AssinaturaExpira': assinaturaExpira,
      'site': site,
      'nome_presidente': nomePresidente,
      'email': email,
      'Phone': phone,
      'Pais': pais,
    }.withoutNulls,
  );

  return firestoreData;
}

class FederationsRecordDocumentEquality implements Equality<FederationsRecord> {
  const FederationsRecordDocumentEquality();

  @override
  bool equals(FederationsRecord? e1, FederationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.foto == e2?.foto &&
        e1?.nome == e2?.nome &&
        e1?.liga == e2?.liga &&
        e1?.uf == e2?.uf &&
        listEquality.equals(e1?.idClube, e2?.idClube) &&
        listEquality.equals(e1?.usuariosFederation, e2?.usuariosFederation) &&
        e1?.assinaturaExpira == e2?.assinaturaExpira &&
        listEquality.equals(e1?.adminFederer, e2?.adminFederer) &&
        e1?.site == e2?.site &&
        e1?.nomePresidente == e2?.nomePresidente &&
        e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        listEquality.equals(e1?.idModalidade, e2?.idModalidade) &&
        e1?.pais == e2?.pais;
  }

  @override
  int hash(FederationsRecord? e) => const ListEquality().hash([
        e?.foto,
        e?.nome,
        e?.liga,
        e?.uf,
        e?.idClube,
        e?.usuariosFederation,
        e?.assinaturaExpira,
        e?.adminFederer,
        e?.site,
        e?.nomePresidente,
        e?.email,
        e?.phone,
        e?.idModalidade,
        e?.pais
      ]);

  @override
  bool isValidKey(Object? o) => o is FederationsRecord;
}
