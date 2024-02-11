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

import 'package:cloud_firestore/cloud_firestore.dart';

Future atualziarResultadoChampionGeral(ChampionRecord? docChampion) async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Buscar todos os registros da coleção 'Participante'
  QuerySnapshot jogosSnapshot = await _firestore
      .collection('Participante')
      .where('idChampion', isEqualTo: docChampion?.reference)
      .get();

  // Mapa para armazenar os totais agrupados por idParticipante
  Map<DocumentReference, Map<String, dynamic>> totaisPorParticipante = {};

  // Agrupar e somar
  for (QueryDocumentSnapshot doc in jogosSnapshot.docs) {
    DocumentReference idParticipante = doc['idParticipante'];

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
        'campeonatoPosicao': 0,
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
}
