import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "display_apelido" field.
  String? _displayApelido;
  String get displayApelido => _displayApelido ?? '';
  bool hasDisplayApelido() => _displayApelido != null;

  // "Assinatura" field.
  int? _assinatura;
  int get assinatura => _assinatura ?? 0;
  bool hasAssinatura() => _assinatura != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "aniversario" field.
  DateTime? _aniversario;
  DateTime? get aniversario => _aniversario;
  bool hasAniversario() => _aniversario != null;

  // "Federation" field.
  DocumentReference? _federation;
  DocumentReference? get federation => _federation;
  bool hasFederation() => _federation != null;

  // "Club" field.
  DocumentReference? _club;
  DocumentReference? get club => _club;
  bool hasClub() => _club != null;

  // "photo_feder" field.
  String? _photoFeder;
  String get photoFeder => _photoFeder ?? '';
  bool hasPhotoFeder() => _photoFeder != null;

  // "Modalidade" field.
  List<String>? _modalidade;
  List<String> get modalidade => _modalidade ?? const [];
  bool hasModalidade() => _modalidade != null;

  // "photo_club" field.
  String? _photoClub;
  String get photoClub => _photoClub ?? '';
  bool hasPhotoClub() => _photoClub != null;

  // "nome_federer" field.
  String? _nomeFederer;
  String get nomeFederer => _nomeFederer ?? '';
  bool hasNomeFederer() => _nomeFederer != null;

  // "nome_club" field.
  String? _nomeClub;
  String get nomeClub => _nomeClub ?? '';
  bool hasNomeClub() => _nomeClub != null;

  // "UF" field.
  String? _uf;
  String get uf => _uf ?? '';
  bool hasUf() => _uf != null;

  // "participanteIngressoData" field.
  DateTime? _participanteIngressoData;
  DateTime? get participanteIngressoData => _participanteIngressoData;
  bool hasParticipanteIngressoData() => _participanteIngressoData != null;

  // "MinhasModalidades" field.
  List<DocumentReference>? _minhasModalidades;
  List<DocumentReference> get minhasModalidades =>
      _minhasModalidades ?? const [];
  bool hasMinhasModalidades() => _minhasModalidades != null;

  // "termos" field.
  bool? _termos;
  bool get termos => _termos ?? false;
  bool hasTermos() => _termos != null;

  // "participanteIDChampion" field.
  List<DocumentReference>? _participanteIDChampion;
  List<DocumentReference> get participanteIDChampion =>
      _participanteIDChampion ?? const [];
  bool hasParticipanteIDChampion() => _participanteIDChampion != null;

  // "AssinaturaExpira" field.
  DateTime? _assinaturaExpira;
  DateTime? get assinaturaExpira => _assinaturaExpira;
  bool hasAssinaturaExpira() => _assinaturaExpira != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _displayApelido = snapshotData['display_apelido'] as String?;
    _assinatura = castToType<int>(snapshotData['Assinatura']);
    _uid = snapshotData['uid'] as String?;
    _aniversario = snapshotData['aniversario'] as DateTime?;
    _federation = snapshotData['Federation'] as DocumentReference?;
    _club = snapshotData['Club'] as DocumentReference?;
    _photoFeder = snapshotData['photo_feder'] as String?;
    _modalidade = getDataList(snapshotData['Modalidade']);
    _photoClub = snapshotData['photo_club'] as String?;
    _nomeFederer = snapshotData['nome_federer'] as String?;
    _nomeClub = snapshotData['nome_club'] as String?;
    _uf = snapshotData['UF'] as String?;
    _participanteIngressoData =
        snapshotData['participanteIngressoData'] as DateTime?;
    _minhasModalidades = getDataList(snapshotData['MinhasModalidades']);
    _termos = snapshotData['termos'] as bool?;
    _participanteIDChampion =
        getDataList(snapshotData['participanteIDChampion']);
    _assinaturaExpira = snapshotData['AssinaturaExpira'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? displayApelido,
  int? assinatura,
  String? uid,
  DateTime? aniversario,
  DocumentReference? federation,
  DocumentReference? club,
  String? photoFeder,
  String? photoClub,
  String? nomeFederer,
  String? nomeClub,
  String? uf,
  DateTime? participanteIngressoData,
  bool? termos,
  DateTime? assinaturaExpira,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'display_apelido': displayApelido,
      'Assinatura': assinatura,
      'uid': uid,
      'aniversario': aniversario,
      'Federation': federation,
      'Club': club,
      'photo_feder': photoFeder,
      'photo_club': photoClub,
      'nome_federer': nomeFederer,
      'nome_club': nomeClub,
      'UF': uf,
      'participanteIngressoData': participanteIngressoData,
      'termos': termos,
      'AssinaturaExpira': assinaturaExpira,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.displayApelido == e2?.displayApelido &&
        e1?.assinatura == e2?.assinatura &&
        e1?.uid == e2?.uid &&
        e1?.aniversario == e2?.aniversario &&
        e1?.federation == e2?.federation &&
        e1?.club == e2?.club &&
        e1?.photoFeder == e2?.photoFeder &&
        listEquality.equals(e1?.modalidade, e2?.modalidade) &&
        e1?.photoClub == e2?.photoClub &&
        e1?.nomeFederer == e2?.nomeFederer &&
        e1?.nomeClub == e2?.nomeClub &&
        e1?.uf == e2?.uf &&
        e1?.participanteIngressoData == e2?.participanteIngressoData &&
        listEquality.equals(e1?.minhasModalidades, e2?.minhasModalidades) &&
        e1?.termos == e2?.termos &&
        listEquality.equals(
            e1?.participanteIDChampion, e2?.participanteIDChampion) &&
        e1?.assinaturaExpira == e2?.assinaturaExpira;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.displayApelido,
        e?.assinatura,
        e?.uid,
        e?.aniversario,
        e?.federation,
        e?.club,
        e?.photoFeder,
        e?.modalidade,
        e?.photoClub,
        e?.nomeFederer,
        e?.nomeClub,
        e?.uf,
        e?.participanteIngressoData,
        e?.minhasModalidades,
        e?.termos,
        e?.participanteIDChampion,
        e?.assinaturaExpira
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
