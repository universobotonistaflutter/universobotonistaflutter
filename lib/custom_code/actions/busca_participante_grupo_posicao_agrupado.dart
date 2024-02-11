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

import 'index.dart'; // Imports other custom actions

Future<ParticipanteRecord?> buscaParticipanteGrupoPosicaoAgrupado(
    ConfigNextFaseStruct? nextFase) async {
  // Add your function code here!

  // Verifica se nextFase é nulo
  if (nextFase == null) {
    print('nextFase não pode ser nulo');
    return null;
  }

  // Referência para a coleção de participantes no Firestore
  var participantesRef = FirebaseFirestore.instance.collection('Participante');

  try {
    // Realiza a query para encontrar o participante
    var querySnapshot = await participantesRef
        .where('grupoPosicaoAgrupado', isEqualTo: nextFase.posicao)
        .where('idFase', isEqualTo: nextFase.idFase)
        .limit(1) // Assumindo que você quer apenas um registro
        .get();

    // Verifica se encontrou algum participante
    if (querySnapshot.docs.isEmpty) {
      print('Nenhum participante encontrado para os critérios fornecidos');
      return null;
    }

    // Converte o primeiro documento encontrado para ParticipanteRecord
    return ParticipanteRecord.fromSnapshot(querySnapshot.docs.first);
  } catch (e) {
    print('Erro ao buscar participante: $e');
    return null;
  }
}
