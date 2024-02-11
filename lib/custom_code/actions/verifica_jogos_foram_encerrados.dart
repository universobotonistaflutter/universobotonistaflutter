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

Future<int> verificaJogosForamEncerrados(
  DocumentReference? idChampion,
  DocumentReference? idFase,
) async {
  // Verifica se os DocumentReferences são nulos
  if (idChampion == null || idFase == null) {
    return 0;
  }

  // Obtém a coleção de jogos
  var jogosCollection = FirebaseFirestore.instance.collection('Jogos');

  // Consulta os jogos filtrando por idChampion e idFase, e onde data_jogo é null
  var querySnapshot = await jogosCollection
      .where('idChampion', isEqualTo: idChampion)
      .where('idFase', isEqualTo: idFase)
      .where('data_jogo', isNull: true)
      .get();

  // Retorna o número de jogos encontrados que ainda não foram encerrados
  return querySnapshot.docs.length;
}
