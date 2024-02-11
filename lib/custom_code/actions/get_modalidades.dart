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

Future<List<ModalidadesRecord>> getModalidades(
    List<DocumentReference>? modalidadeFixed) async {
  // Add your function code here!

  // Verifique se modalidadeFixed é nulo ou vazio
  if (modalidadeFixed == null || modalidadeFixed.isEmpty) {
    return [];
  }

  List<ModalidadesRecord> modalidadesList = [];

  // Loop sobre a lista de DocumentReference
  for (DocumentReference docRef in modalidadeFixed) {
    // Obtenha o DocumentSnapshot correspondente
    DocumentSnapshot docSnapshot = await docRef.get();

    // Verifique se o documento existe
    if (docSnapshot.exists) {
      // Adicione o ModalidadesRecord à lista
      modalidadesList.add(ModalidadesRecord.fromSnapshot(docSnapshot));
    }
  }

  return modalidadesList;
}
