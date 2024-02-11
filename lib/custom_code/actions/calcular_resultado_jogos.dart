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

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future calcularResultadoJogos(
  ChampionRecord? docChampion,
  JogosRecord? docJogos,
) async {
  // Add your function code here!

  // Inicialize o Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Variável para armazenar o total de jogos no grupo
  int totalJogosGrupo = 0;

  // Localize todos os registros da coleção Jogos
  QuerySnapshot jogosSnapshot = await _firestore
      .collection('Jogos')
      .where('idChampion', isEqualTo: docChampion?.reference)
      .where('idFase', isEqualTo: docJogos?.idFase)
      .where('idGrupo', isEqualTo: docJogos?.idGrupo)
      .get();

  // Inicialize os mapas para armazenar os totais
  Map<String, Map<String, num>> totais = {};

  // Mapa para armazenar os participantes agrupados por sua posição no grupo
  Map<int, List<String>> agrupadosPorPosicao = {};

  // Itere sobre cada jogo na coleção Jogos
  for (var jogo in jogosSnapshot.docs) {
    Map<String, dynamic> docJogo = jogo.data() as Map<String, dynamic>;

    // Validação de campos nulos ou vazios
    if (docJogo['idParticipanteMandante'] == null ||
        docJogo['idParticipanteVisitante'] == null) {
      continue;
    }

    // Validação de campos nulos ou vazios
    if (docJogo['mandanteGols'] == null || docJogo['visitanteGols'] == null) {
      continue;
    }

    // IDs dos participantes
    DocumentReference idMandante = docJogo['idParticipanteMandante'];
    DocumentReference idVisitante = docJogo['idParticipanteVisitante'];

    // Inicialize os totais para os participantes, se necessário
    String mandanteId = idMandante.id;
    String visitanteId = idVisitante.id;

    if (totais[mandanteId] == null) {
      totais[mandanteId] = {
        'totalPartidas': 0,
        'totalGols': 0,
        'totalPontos': 0,
        'totalVitorias': 0,
        'totalEmpates': 0,
        'totalDerrotas': 0,
        'totalGolsPro': 0,
        'totalGolsContra': 0,
        'totalSaldoGols': 0,
        'grupoAproveitamento': 0,
        'grupoPosicao': 0,
      };
    }
    if (totais[visitanteId] == null) {
      totais[visitanteId] = {
        'totalPartidas': 0,
        'totalGols': 0,
        'totalPontos': 0,
        'totalVitorias': 0,
        'totalEmpates': 0,
        'totalDerrotas': 0,
        'totalGolsPro': 0,
        'totalGolsContra': 0,
        'totalSaldoGols': 0,
        'grupoAproveitamento': 0,
        'grupoPosicao': 0,
      };
    }

    // Atualize os totais com base nos dados do jogo
    totais[mandanteId]!['totalPartidas'] =
        (totais[mandanteId]!['totalPartidas'] ?? 0) + 1;
    totais[visitanteId]!['totalPartidas'] =
        (totais[visitanteId]!['totalPartidas'] ?? 0) + 1;

    // Atualize total de gols
    if (docJogo['mandanteGols'] != null) {
      totais[mandanteId]!['totalGols'] =
          (totais[mandanteId]!['totalGols'] ?? 0) + docJogo['mandanteGols'];
    }
    if (docJogo['visitanteGols'] != null) {
      totais[visitanteId]!['totalGols'] =
          (totais[visitanteId]!['totalGols'] ?? 0) + docJogo['visitanteGols'];
    }

    // Atualize total de pontos
    if (docJogo['mandantePontos'] != null) {
      totais[mandanteId]!['totalPontos'] =
          (totais[mandanteId]!['totalPontos'] ?? 0) + docJogo['mandantePontos'];
    }
    if (docJogo['visitantePontos'] != null) {
      totais[visitanteId]!['totalPontos'] =
          (totais[visitanteId]!['totalPontos'] ?? 0) +
              docJogo['visitantePontos'];
    }

    // Atualize total de vitórias, empates e derrotas
    if (docJogo['mandanteGols'] > docJogo['visitanteGols']) {
      totais[mandanteId]!['totalVitorias'] =
          (totais[mandanteId]!['totalVitorias'] ?? 0) + 1;
      totais[visitanteId]!['totalDerrotas'] =
          (totais[visitanteId]!['totalDerrotas'] ?? 0) + 1;
    } else if (docJogo['mandanteGols'] < docJogo['visitanteGols']) {
      totais[visitanteId]!['totalVitorias'] =
          (totais[visitanteId]!['totalVitorias'] ?? 0) + 1;
      totais[mandanteId]!['totalDerrotas'] =
          (totais[mandanteId]!['totalDerrotas'] ?? 0) + 1;
    } else {
      totais[mandanteId]!['totalEmpates'] =
          (totais[mandanteId]!['totalEmpates'] ?? 0) + 1;
      totais[visitanteId]!['totalEmpates'] =
          (totais[visitanteId]!['totalEmpates'] ?? 0) + 1;
    }

    // Atualize total de saldo de gols
    totais[mandanteId]!['totalSaldoGols'] =
        (totais[mandanteId]!['totalSaldoGols'] ?? 0) +
            docJogo['mandanteGols'] -
            docJogo['visitanteGols'];
    totais[visitanteId]!['totalSaldoGols'] =
        (totais[visitanteId]!['totalSaldoGols'] ?? 0) +
            docJogo['visitanteGols'] -
            docJogo['mandanteGols'];

    // Atualize o total de jogos no grupo
    totalJogosGrupo += 1;

    // Atualize total de gols pró e contra
    totais[mandanteId]!['totalGolsPro'] =
        (totais[mandanteId]!['totalGolsPro'] ?? 0) + docJogo['mandanteGols'];
    totais[mandanteId]!['totalGolsContra'] =
        (totais[mandanteId]!['totalGolsContra'] ?? 0) +
            docJogo['visitanteGols'];
    totais[visitanteId]!['totalGolsPro'] =
        (totais[visitanteId]!['totalGolsPro'] ?? 0) + docJogo['visitanteGols'];
    totais[visitanteId]!['totalGolsContra'] =
        (totais[visitanteId]!['totalGolsContra'] ?? 0) +
            docJogo['mandanteGols'];
  }

  // ORDENAR OS PARTICIPANTES PELA POTUAÇÂO
  totais = ordenarTotaisPorPontos(totais, 'grupoPosicao');
  int posicao = 0;
  // Calcule o aproveitamento e posição no grupo
  for (var idParticipante in totais.keys) {
    posicao += 1;

    // euler: correção calculo
    num? totalPartidas = totais[idParticipante]!['totalPartidas'];
    num? totalPontos = totais[idParticipante]!['totalPontos'];

    totais[idParticipante]!['grupoAproveitamento'] =
        (totalPontos! / (totalPartidas! * 3)) * 100;
    totais[idParticipante]!['grupoPosicao'] = posicao;
  }

/*
  // Lista para armazenar os objetos finais
  List<Map<String, dynamic>> listaFinal = [];

   // Crie a lista de objetos com o campo da melhor posição e os participantes na mesma posição em outros grupos
  for (var posicao in agrupadosPorPosicao.keys) {
    Map<String, dynamic> objeto = {
      'melhorPosicao': posicao,
      'participantesMesmaPosicao': agrupadosPorPosicao[posicao],
    };
    listaFinal.add(objeto);
  }

  */

  // Atualize a coleção Participante com os totais calculados
  for (var idParticipante in totais.keys) {
    await _firestore
        .collection('Participante')
        .doc(idParticipante)
        .update(totais[idParticipante]!);
  }

  // calcula a posição de todos os participantes na FASE
  ordernarTotaisPorFasePosicao(docJogos);
}

Map<String, Map<String, num>> ordenarTotaisPorPontos(
    Map<String, Map<String, num>> totais, String fieldNamePosicao) {
  // Converte o mapa 'totais' para uma lista de mapas
  List<Map<String, dynamic>> listaTotais = totais.entries.map((entry) {
    return {
      'id': entry.key,
      ...entry.value,
    };
  }).toList();

  // Ordena a lista com base em múltiplos critérios
  listaTotais.sort((a, b) {
    int compare = (b['totalPontos'] ?? 0)
        .compareTo(a['totalPontos'] ?? 0); // Primeiro por 'totalPontos'

    if (compare == 0) {
      compare = (b['totalVitorias'] ?? 0)
          .compareTo(a['totalVitorias'] ?? 0); // Segundo por 'totalVitorias'
    }

    if (compare == 0) {
      compare = (b['totalSaldoGols'] ?? 0)
          .compareTo(a['totalSaldoGols'] ?? 0); // Terceiro por 'totalSaldoGols'
    }

    if (compare == 0) {
      compare = (b['totalGolsPro'] ?? 0)
          .compareTo(a['totalGolsPro'] ?? 0); // Segundo por 'totalGolsPro'
    }

    if (compare == 0) {
      compare = (a['totalGolsContra'] ?? 0)
          .compareTo(b['totalGolsContra'] ?? 0); // Último por 'totalGolsContra'
    }

    return compare;
  });

  // Atualiza o campo 'grupoPosicao' para cada elemento
  for (int i = 0; i < listaTotais.length; i++) {
    listaTotais[i][fieldNamePosicao] = i + 1; // A contagem começa em 1
  }

  // Converte a lista ordenada de volta para um mapa
  Map<String, Map<String, num>> totaisOrdenados = {};
  for (var item in listaTotais) {
    String id = item['id'];
    item.remove('id'); // Remove o campo 'id'

    // Filtra apenas campos numéricos
    Map<String, num> camposNumericos = {};
    for (var key in item.keys) {
      if (item[key] is num) {
        camposNumericos[key] = item[key] as num;
      }
    }

    totaisOrdenados[id] = camposNumericos; // Adiciona ao mapa ordenado
  }

  return totaisOrdenados; // Retorna o mapa ordenado
}

Future<Map<String, Map<String, num>>> ordernarTotaisPorFasePosicao(
    JogosRecord? Jogo) async {
  // Inicialize o Firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Localize todos os registros da coleção Jogos
  QuerySnapshot jogosSnapshot = await _firestore
      .collection('Jogos')
      .where('idChampion', isEqualTo: Jogo?.idChampion)
      .where('idFase', isEqualTo: Jogo?.idFase)
      .get();

  // Inicialize os mapas para armazenar os totais
  Map<String, Map<String, num>> totais = {};

  // Preencha o mapa 'totais' com dados dos documentos (isso é um exemplo, você deve preencher com seus próprios dados)
  for (var doc in jogosSnapshot.docs) {
    Map<String, dynamic> docJogo = doc.data() as Map<String, dynamic>;

    // IDs dos participantes
    DocumentReference idMandante = docJogo['idParticipanteMandante'];
    DocumentReference idVisitante = docJogo['idParticipanteVisitante'];
    var docMandante = await buscarDadosParticipantes(idMandante);
    var docVisitante = await buscarDadosParticipantes(idVisitante);

    // Inicialize os totais para os participantes, se necessário
    String idParticipanteMandante = idMandante.id;
    String idParticipanteVisitante = idVisitante.id;

    if (idParticipanteMandante != null && idParticipanteVisitante != null) {
      if (totais[idParticipanteMandante] == null) {
        totais[idParticipanteMandante] = {
          'totalPontos': 0,
          'grupoPosicao': 0,
          // outros campos aqui
        };
      }
      if (totais[idParticipanteVisitante] == null) {
        totais[idParticipanteVisitante] = {
          'totalPontos': 0,
          'grupoPosicao': 0,
          // outros campos aqui
        };
      }

      totais[idParticipanteMandante]!['grupoPosicao'] =
          (docMandante?['grupoPosicao'] ?? 0);
      totais[idParticipanteVisitante]!['grupoPosicao'] =
          (docVisitante?['grupoPosicao'] ?? 0);

      // Atualize os campos de 'totais' com base nos dados do documento
      totais[idParticipanteMandante]!['totalPontos'] =
          (totais[idParticipanteMandante]!['totalPontos'] ?? 0) +
              (docJogo?['mandantePontos'] ?? 0);
      totais[idParticipanteVisitante]!['totalPontos'] =
          (totais[idParticipanteVisitante]!['totalPontos'] ?? 0) +
              (docJogo?['visitantePontos'] ?? 0);
    }
  }

  // Filtra os totais para incluir apenas os participantes do idChampion e idFase informados
  Map<String, Map<String, num>> totaisFiltrados = {};
  for (var id in totais.keys) {
    totaisFiltrados[id] = totais[id]!;
  }

  // Ordena os totais filtrados
  Map<String, Map<String, num>> totaisOrdenados =
      ordenarTotaisPorPontos(totaisFiltrados, 'fasePosicao');

  // Atualiza o campo 'fasePosicao' para cada participante
  int posicao = 1;

  // Mapa para armazenar os participantes agrupados por sua posição no grupo
  Map<int, List<String>> agrupadosPorPosicao = {};

  for (var id in totaisOrdenados.keys) {
    // Agrupe os participantes por sua posição no grupo
    int posicaoGrupo = totaisOrdenados[id]!['grupoPosicao'] as int;

    // ignora posições não calculadasa ainda
    if (posicaoGrupo > 0) {
      // inicializar uma nova posição no array
      if (agrupadosPorPosicao[posicaoGrupo] == null) {
        agrupadosPorPosicao[posicaoGrupo] = [];
      }
      // vou adicionar a esta posição um participante
      agrupadosPorPosicao[posicaoGrupo]!.add(id);

      // aplica atualização no banco de dados
      await _firestore.collection('Participante').doc(id).update({
        'fasePosicao': posicao,
        'grupoPosicaoAgrupado': int.parse(posicaoGrupo.toString() +
            agrupadosPorPosicao[posicaoGrupo]!.length.toString())
      });
    } else {
      // aplica atualização no banco de dados
      await _firestore
          .collection('Participante')
          .doc(id)
          .update({'fasePosicao': posicao});
    }

    // incrementa posição da FASE
    posicao++;
  }

  return totaisOrdenados;
}

Future<Map<String, dynamic>> buscarDadosParticipantes(
    DocumentReference idParticipante) async {
  // Buscar o documento do participante
  DocumentSnapshot docParticipante = await idParticipante.get();

  // Retorna os dados do documento como Map<String, dynamic>
  return docParticipante.data() as Map<String, dynamic>;
}
