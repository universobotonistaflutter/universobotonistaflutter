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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<List<JogosRecord>> getJogosUser(
  DocumentReference? refUsuario,
  DocumentReference? refChampion,
) async {
  // Conectando à coleção "Jogos"
  CollectionReference jogosRef = FirebaseFirestore.instance.collection('Jogos');

  // Criando a consulta para pesquisar o campo "idUsuarioMandante" com o DocumentReference informado
  Query queryMandante = jogosRef
      .where('idUsuarioMandante', isEqualTo: refUsuario)
      .where('idChampion', isEqualTo: refChampion);

  // Criando a consulta para pesquisar o campo "isUsuarioVisitante" com o DocumentReference informado
  Query queryVisitante = jogosRef
      .where('idUsuarioVisitante', isEqualTo: refUsuario)
      .where('idChampion', isEqualTo: refChampion);

  // Lista para armazenar os registros
  List<JogosRecord> jogos = [];

  try {
    // Executando a consulta para "idUsuarioMandante"
    QuerySnapshot snapshotMandante = await queryMandante.get();
    for (QueryDocumentSnapshot doc in snapshotMandante.docs) {
      var document = await FirebaseFirestore.instance
          .collection('Jogos')
          .doc(doc.reference.id)
          .get();
      JogosRecord jogo =
          JogosRecord.getDocumentFromData(document.data()!, document.reference);
      jogos.add(jogo);
    }

    // Executando a consulta para "isUsuarioVisitante"
    QuerySnapshot snapshotVisitante = await queryVisitante.get();
    for (QueryDocumentSnapshot doc in snapshotVisitante.docs) {
      var document = await FirebaseFirestore.instance
          .collection('Jogos')
          .doc(doc.reference.id)
          .get();
      JogosRecord jogo =
          JogosRecord.getDocumentFromData(document.data()!, document.reference);
      jogos.add(jogo);
    }
  } catch (error) {
    // Tratando qualquer erro que possa ocorrer durante a consulta
    print('Erro ao obter os documentos: $error');
  }

  // Ordenando a lista de jogos pelo campo "numeroRodada" e, em seguida, pelo campo "mesaNumero"
  jogos.sort((a, b) {
    int compareRodada = a.rodadaNumero.compareTo(b.rodadaNumero);
    if (compareRodada != 0) return compareRodada;

    return a.mesaNumero.compareTo(b.mesaNumero);
  });

  return jogos;
}
