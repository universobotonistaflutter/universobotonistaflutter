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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<void> adicionarGruposNaFase(int quantidade, DocumentReference idFase,
    DocumentReference idChampion) async {
  // Obtém uma instância do Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Obtém a referência da coleção "grupo"
    final CollectionReference grupoCollection = firestore.collection('Grupo');

    // Loop para adicionar os documentos
    for (int i = 1; i <= quantidade; i++) {
      // Cria um novo documento na coleção "grupo"
      await grupoCollection.add({
        'tituloGrupo': 'Grupo $i',
        'idFase': idFase,
        'idChampion': idChampion,
      });
    }

    print('$quantidade grupos adicionados com sucesso.');
  } catch (e) {
    print('Erro ao adicionar grupos: $e');
  }
}
