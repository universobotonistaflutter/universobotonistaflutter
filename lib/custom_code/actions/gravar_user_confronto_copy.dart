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

import 'index.dart'; // Imports other custom actions

Future<String?> gravarUserConfrontoCopy(ChampionRecord? docChampion) async {
  // Add your function code here!

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Buscar todos os registros da coleção 'Participante'
  QuerySnapshot participanteSnapshot = await _firestore
      .collection('Participante')
      .where('idChampion', isEqualTo: docChampion?.reference)
      .get();

  // Mapa para armazenar os totais agrupados por idParticipante
  Map<DocumentReference, Map<String, dynamic>> totaisPorParticipante = {};

  // Agrupar e somar
  for (QueryDocumentSnapshot doc in participanteSnapshot.docs) {
    DocumentReference idParticipante = doc['idParticipante'];

    // Realiza a consulta usando array-contains
    QuerySnapshot jogosSnapshot = await _firestore
        .collection('Jogos')
        .where('idChampion', isEqualTo: docChampion?.reference)
        .where('listaUsuario', arrayContains: idParticipante)
        .get();

    // Mapa para armazenar os totais agrupados por idParticipante
    Map<DocumentReference, Map<String, dynamic>> confrontoPorParticipante = {};

    // #######################################
    // #######################################
    // #######################################
    // roda a lista de meus jogos
    // #######################################
    for (QueryDocumentSnapshot docJogo in jogosSnapshot.docs) {
      // inicia variavel
      DocumentReference idAdversario;
      int GolsParticipante = 0;
      int GolsAdversario = 0;
      try {
        // seleciona qual posição o adversario esta
        if (docJogo['idParticipanteMandante'] != idParticipante) {
          idAdversario = docJogo['idParticipanteMandante'];
          GolsAdversario = docJogo['mandanteGols'] ?? 0;
          GolsParticipante = docJogo['visitanteGols'] ?? 0;
        } else {
          idAdversario = docJogo['idParticipanteVisitante'];
          GolsAdversario = docJogo['visitanteGols'] ?? 0;
          GolsParticipante = docJogo['mandanteGols'] ?? 0;
        }
      } catch (exception) {
        // Captura a mensagem de erro e armazena na variável resultado
        return "Jogos sem resultado marcado."; //"Ocorreu um erro: ${e.toString()}";
      }

      // Obtém o DocumentSnapshot
      DocumentSnapshot snapshot = await idAdversario.get();
      Map<String, dynamic>? adversarioSnapshot;

      // Verifica se o documento existe
      if (snapshot.exists) {
        // Converte o DocumentSnapshot em um Map
        adversarioSnapshot = snapshot.data() as Map<String, dynamic>?;
      } else {
        // O documento não existe
        return "Erro contato administrador, não encontramos o adverario."; //"Ocorreu um erro: ${e.toString()}";
      }

      // Inicializar se o idParticipante ainda não existe no mapa
      if (confrontoPorParticipante[idAdversario] == null) {
        confrontoPorParticipante[idAdversario] = {
          'totalPartidas': 0,
          'totalPontos': 0,
          'totalVitorias': 0,
          'totalEmpates': 0,
          'totalDerrotas': 0,
          'totalGolsPro': 0,
          'totalGolsContra': 0,
          'totalSaldoGols': 0,
          'idAdversario': idAdversario,
          'datalastUpdate': DateTime.now(),
          'adversario_nome': adversarioSnapshot?['participanteNome'],
          'adversario_photo': adversarioSnapshot?['participantePhoto'],
          'adversario_apelido': adversarioSnapshot?['participanteApelido'],
        };
      }

      // Somar os campos, garantindo que os valores sejam inteiros
      confrontoPorParticipante[idAdversario]!.update(
        'totalPartidas',
        (value) => value + 1,
      );

      // Atualize total de vitórias, empates e derrotas
      if (GolsAdversario > GolsParticipante) {
        confrontoPorParticipante[idAdversario]!.update(
          'totalVitorias',
          (value) => value + 1,
        );

        //confrontoPorParticipante[idAdversario]!['totalVitorias'] = (confrontoPorParticipante[idAdversario]!['totalVitorias'] ?? 0) + 1;
      } else if (GolsAdversario < GolsParticipante) {
        confrontoPorParticipante[idAdversario]!.update(
          'totalDerrotas',
          (value) => value + 1,
        );
        //confrontoPorParticipante[idAdversario]!['totalDerrotas'] =  (confrontoPorParticipante[idAdversario]!['totalDerrotas'] ?? 0) + 1;
      } else {
        confrontoPorParticipante[idAdversario]!.update(
          'totalEmpates',
          (value) => value + 1,
        );

        //confrontoPorParticipante[idAdversario]!['totalEmpates'] = (confrontoPorParticipante[idAdversario]!['totalEmpates'] ?? 0) + 1;
      }

      // Atualize total de saldo de gols
      confrontoPorParticipante[idAdversario]!.update(
        'totalSaldoGols',
        (value) => value + (GolsAdversario - GolsParticipante),
      );
      /*
      confrontoPorParticipante[idAdversario]!['totalSaldoGols'] =
          (confrontoPorParticipante[idAdversario]!['totalSaldoGols'] ?? 0) +
              GolsAdversario-
              GolsParticipante;
       */

      // Atualize total de gols pró e contra
      confrontoPorParticipante[idAdversario]!.update(
        'totalGolsPro',
        (value) => value + GolsParticipante,
      );
      /*
      confrontoPorParticipante[idAdversario]!['totalGolsPro'] =
          (confrontoPorParticipante[idAdversario]!['totalGolsPro'] ?? 0) + GolsParticipante;
      */

      confrontoPorParticipante[idAdversario]!.update(
        'totalGolsContra',
        (value) => value + GolsAdversario,
      );
      /*
      confrontoPorParticipante[idAdversario]!['totalGolsContra'] =
          (confrontoPorParticipante[idAdversario]!['totalGolsContra'] ?? 0) +
              GolsAdversario;
      */
    }

    // Gravar ou atualizar na subcoleção 'UserConfronto'
    for (var idAdversario in confrontoPorParticipante.keys) {
      DocumentReference docRefParticipante =
          idParticipante.collection('UserConfronto').doc(idAdversario.id);

      await docRefParticipante.set(
          confrontoPorParticipante[idAdversario]!, SetOptions(merge: true));
    }

    // ########## ########## ########## ########## ########## ########## ########## ##########
    // ########## ########## ########## ########## ########## ########## ########## ##########
    // ########## ########## ########## ########## ########## ########## ########## ##########

    // Inicializar se o idParticipante ainda não existe no mapa
    if (totaisPorParticipante[idParticipante] == null) {
      totaisPorParticipante[idParticipante] = {
        'totalPartidas': 0,
        'totalPontos': 0,
        'totalVitorias': 0,
        'totalEmpates': 0,
        'totalDerrotas': 0,
        'totalGolsPro': 0,
        'totalGolsContra': 0,
        'totalSaldoGols': 0,
      };
    }

    // Somar os campos, garantindo que os valores sejam inteiros
    totaisPorParticipante[idParticipante]!.update(
      'totalPartidas',
      (value) => value + (doc['totalPartidas'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalPontos',
      (value) => value + (doc['totalPontos'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalVitorias',
      (value) => value + (doc['totalVitorias'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalEmpates',
      (value) => value + (doc['totalEmpates'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalDerrotas',
      (value) => value + (doc['totalDerrotas'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalGolsPro',
      (value) => value + (doc['totalGolsPro'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalGolsContra',
      (value) => value + (doc['totalGolsContra'] as num).toInt(),
    );
    totaisPorParticipante[idParticipante]!.update(
      'totalSaldoGols',
      (value) =>
          value +
          (doc['totalGolsPro'] as num).toInt() -
          (doc['totalGolsContra'] as num).toInt(),
    );

    // Incluir campos adicionais
    totaisPorParticipante[idParticipante]!.addAll({
      'idParticipante': idParticipante, // Incluindo o idParticipante
      'participante_nome': doc['participanteNome'], // Substitua pelo valor real
      'participante_apelido':
          doc['participanteApelido'], // Substitua pelo valor real
      'participante_photo':
          doc['participantePhoto'] // Substitua pelo valor real
    });
  }

  // Gravar ou atualizar na subcoleção 'ChampionTotalGeral'
  for (var idParticipante in totaisPorParticipante.keys) {
    DocumentReference docRef = docChampion?.reference
        .collection('ChampionTotalGeral')
        .doc(idParticipante.id) as DocumentReference<Object?>;

    await docRef.set(
        totaisPorParticipante[idParticipante]!, SetOptions(merge: true));
  }

  return null;
}
