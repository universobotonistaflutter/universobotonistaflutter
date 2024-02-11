// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:universo_botonista/backend/schema/user_record.dart';

Future<UserRecord?> cadastrarUsuarioNovo(String nome, String email) async {
  try {
    // Cria um novo usuário
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: '123456', // Considere usar uma senha mais segura
    );

    // Cria um novo documento na coleção 'Users'
    DocumentReference userDocRefnovo = FirebaseFirestore.instance
        .collection('user')
        .doc(userCredential.user!.uid);

    await userDocRefnovo.set({
      'display_name': nome,
      'display_apelido': nome,
      'created_time': FieldValue.serverTimestamp(),
      'AssinaturaExpira': FieldValue.serverTimestamp(),
      'aniversario': FieldValue.serverTimestamp(),
      'Assinatura': 0,
      'email': email,
      'uid': userCredential.user!.uid,
      // Adicione outros campos conforme necessário
    });

    // O usuário foi criado
    print("Usuário criado: ${userCredential.user!.email}");

    var getDocUser =
        await FirebaseFirestore.instance.doc(userDocRefnovo.path).get();
    UserRecord docUsuario = UserRecord.getDocumentFromData(
        getDocUser.data()!, getDocUser.reference);

    return docUsuario;
  } catch (e) {
    // Ocorreu um erro
    print("Erro ao criar usuário: $e");
    return null;
  }
}
