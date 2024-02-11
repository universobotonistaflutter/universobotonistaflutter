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

import '../../custom_code/actions/cria_jogos_na_fase.dart';
import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

Future criarJogosMesmoGrupoTipo1Copy(
  ChampionRecord? docChampion,
  FaseRecord? docFase,
  int numMesas,
) async {
  print('JOGOS DO MESMO GRUPO - TIPO 1');

  // Mapa para armazenar a mesa atual para cada rodada
  Map<int, int> mesaAtualPorRodada = {};

  // Inicializa um mapa vazio para armazenar os grupos e seus participantes
  Map<DocumentReference, List<DocumentReference>> grupos = {};

// Busca todos os Grupos que têm idFase = docFase.reference
  QuerySnapshot gruposSnapshot = await FirebaseFirestore.instance
      .collection('Grupo')
      .where('idFase', isEqualTo: docFase?.reference)
      .get();

// Verifica se gruposSnapshot.docs não está vazio
  if (gruposSnapshot.docs.isEmpty) {
    print('gruposSnapshot.docs está vazio');
    return;
  }

// Itera sobre cada documento no snapshot
  for (var grupoDoc in gruposSnapshot.docs) {
    // Obtém o DocumentReference do grupo
    DocumentReference refGrupo = grupoDoc.reference;

    // Obtém a lista de participantes (DocumentReference) do grupo
    List<DocumentReference> listaParticipantes =
        List.from(grupoDoc['listaParticipanteIds']);

    // Adiciona o grupo e seus participantes ao mapa
    grupos[refGrupo] = listaParticipantes;
  }

  // Ordena os jogos (a função montarJogos deve ser definida)
  List<Map<String, dynamic>> jogos =
      await montarJogos1(grupos, docChampion, docFase);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  WriteBatch batch = firestore.batch();

  // Variáveis para armazenar a rodada atual
  int rodadaAtual = 1;

  // Registro dos participantes em cada rodada
  Map<int, Set<DocumentReference>> participantesPorRodada = {};

  // Iterar sobre cada jogo montado
  for (var jogo in jogos) {
    bool jogoAdicionado =
        false; // Variável para verificar se o jogo foi adicionado

    // Procurar uma rodada adequada para o jogo
    for (int r = 1; r <= rodadaAtual + 1; r++) {
      // Inicializar o conjunto para a rodada 'r', se necessário
      participantesPorRodada.putIfAbsent(r, () => {});

      // Verificar se os participantes já estão na rodada 'r'
      if (!participantesPorRodada[r]!.contains(jogo['idUsuarioMandante']) &&
          !participantesPorRodada[r]!.contains(jogo['idUsuarioVisitante'])) {
        // Adicionar os participantes à rodada 'r'
        participantesPorRodada[r]!.add(jogo['idUsuarioMandante']);
        participantesPorRodada[r]!.add(jogo['idUsuarioVisitante']);

        // Inicializar a mesa atual para a rodada 'r', se necessário
        mesaAtualPorRodada.putIfAbsent(r, () => 1);

        // Adicionar informações de rodada e mesa ao jogo
        jogo['rodadaNumero'] = r;
        jogo['mesaNumero'] = mesaAtualPorRodada[r]!;

        // Adicionar operação ao batch
        batch.set(firestore.collection('Jogos').doc(), jogo);

        print(
            'Jogo adicionado: ${jogo['idUsuarioMandante']} vs ${jogo['idUsuarioVisitante']} no ${jogo['grupo']} na Rodada $r na Mesa ${mesaAtualPorRodada[r]}');

        // Incrementar o contador de mesas para a rodada 'r'
        mesaAtualPorRodada.update(r, (mesaAtual) => mesaAtual + 1);

        // Atualizar a rodada atual, se necessário
        if (r > rodadaAtual) {
          rodadaAtual = r;
        }

        jogoAdicionado = true; // O jogo foi adicionado
        break; // Sair do loop de rodadas
      }
    }

    // Se o jogo não foi adicionado, isso significa que não há mais rodadas disponíveis
    if (!jogoAdicionado) {
      print('Não foi possível adicionar mais jogos.');
      break;
    }
  }

  // Executar todas as operações em lote
  await batch.commit();
}

Future<List<Map<String, dynamic>>> montarJogos1(
    Map<DocumentReference, List<DocumentReference>> grupos,
    ChampionRecord? docChampion,
    FaseRecord? docFase) async {
  List<Map<String, dynamic>> jogos = [];
  Set<String> jogosRealizados = {};
  Set<String> participantesIncluidos = {};

  List<DocumentSnapshot?> listaClube = [];
  List<DocumentSnapshot?> listaFederation = [];
  List<UserDatalhe?> listaUsuario = [];

  // Verifica se o documento existe
  DocumentSnapshot? docChampionSnapshot = await docChampion?.reference.get();

  // Inicializa variáveis
  int posicaoPartida = 0;

  // Se o documento existe e o campo 'ultimaPartida' também, atualize posicaoPartida
  if (docChampionSnapshot != null && docChampionSnapshot.exists) {
    posicaoPartida = docChampionSnapshot!['ultimaPartida'] ?? 0;
  }

  // LOOP INFINITO
  while (true) {
    bool novosJogos = false;

    // Iterar sobre cada grupo
    for (var grupo in grupos.entries) {
      DocumentReference idGrupo = grupo.key;
      List<DocumentReference> participantes = grupo.value;

      DocumentSnapshot grupoSnapshot = await idGrupo.get();
      String tituloGrupo = "";

      // Verificar se o documento realmente existe
      if (grupoSnapshot.exists) {
        tituloGrupo = grupoSnapshot['tituloGrupo'];
      }

      // Organizar as partidas dentro do grupo
      //for (int i = 0; i < participantes.length; i++) {
      //  for (int j = i + 1; j < participantes.length; j++) {

      for (int i = 0; i < participantes.length; i++) {
        for (int j = participantes.length - 1; j > i; j--) {
          if (i == j) {
            continue;
          }

          // Verificar se os participantes já foram incluídos
          if (participantesIncluidos.contains(participantes[i].id) ||
              participantesIncluidos.contains(participantes[j].id)) {
            continue;
          }

          // Gerar uma chave única para o par de jogadores
          String chaveJogo = '${participantes[i].id}-${participantes[j].id}';

          // Verificar se o jogo já foi realizado
          if (jogosRealizados.contains(chaveJogo)) {
            continue;
          }

          //************************************************

          DocumentSnapshot? docParticipanteMandante =
              await participantes[i]?.get();
          DocumentSnapshot? docParticipanteVisitante =
              await participantes[j]?.get();

          // avança para primeira ou próxima partida!
          posicaoPartida += 1;

          UserRecord? docUserMandante = await getUser(
              docChampion!,
              docFase!,
              docParticipanteMandante
                  ?.get('idParticipante')); // Adicionado 'await' aqui
          UserRecord? docUserVisitante = await getUser(
              docChampion!,
              docFase!,
              docParticipanteVisitante
                  ?.get('idParticipante')); // Adicionado 'await' aqui

          var mandante = new UserDatalhe(
              docUserMandante?.reference, docUserMandante, participantes[i]);
          var visitante = new UserDatalhe(
              docUserVisitante?.reference, docUserVisitante, participantes[j]);

          var clubeRef = mandante?.docUsuario!.club;

          // Encontrar o DocumentSnapshot correspondente na lista
          DocumentSnapshot? clubeMandante = listaClube.firstWhere(
            (docSnapshot) =>
                docSnapshot != null && docSnapshot.reference == clubeRef,
            orElse: () => null,
          );

          // Se docEncontrado for null, buscar e adicionar à lista
          if (clubeMandante == null) {
            DocumentSnapshot? docClubeSnapshot = await clubeRef?.get();
            if (docClubeSnapshot != null && docClubeSnapshot.exists) {
              listaClube.add(docClubeSnapshot);
              clubeMandante =
                  docClubeSnapshot; // Agora docEncontrado contém o DocumentSnapshot buscado
            }
          }

          clubeRef = visitante?.docUsuario!.club;

          // Encontrar o DocumentSnapshot correspondente na lista
          DocumentSnapshot? clubeVisitante = listaClube.firstWhere(
            (docSnapshot) =>
                docSnapshot != null && docSnapshot.reference == clubeRef,
            orElse: () => null,
          );

          // Se docEncontrado for null, buscar e adicionar à lista
          if (clubeVisitante == null) {
            DocumentSnapshot? docClubeSnapshot = await clubeRef?.get();
            if (docClubeSnapshot != null && docClubeSnapshot.exists) {
              listaClube.add(docClubeSnapshot);
              clubeVisitante =
                  docClubeSnapshot; // Agora docEncontrado contém o DocumentSnapshot buscado
            }
          }

          var federationRef = mandante?.docUsuario!.federation;

          // Encontrar o DocumentSnapshot correspondente na lista
          DocumentSnapshot? federationMandante = listaFederation.firstWhere(
            (docSnapshot) =>
                docSnapshot != null && docSnapshot.reference == federationRef,
            orElse: () => null,
          );

          // Se docEncontrado for null, buscar e adicionar à lista
          if (federationMandante == null) {
            DocumentSnapshot? docFederationSnapshot =
                await federationRef?.get();
            if (docFederationSnapshot != null && docFederationSnapshot.exists) {
              listaFederation.add(docFederationSnapshot);
              federationMandante =
                  docFederationSnapshot; // Agora docEncontrado contém o DocumentSnapshot buscado
            }
          }

          federationRef = visitante?.docUsuario!.federation;

          // Encontrar o DocumentSnapshot correspondente na lista
          DocumentSnapshot? federationVisitante = listaFederation.firstWhere(
            (docSnapshot) =>
                docSnapshot != null && docSnapshot.reference == federationRef,
            orElse: () => null,
          );

          // Se docEncontrado for null, buscar e adicionar à lista
          if (federationVisitante == null) {
            DocumentSnapshot? docFederationSnapshot =
                await federationRef?.get();
            if (docFederationSnapshot != null && docFederationSnapshot.exists) {
              listaFederation.add(docFederationSnapshot);
              federationVisitante =
                  docFederationSnapshot; // Agora docEncontrado contém o DocumentSnapshot buscado
            }
          }

          // Adicionar jogo à lista
          jogos.add({
            // Adicione aqui os campos que você deseja para o jogo
            'idChampion': docChampion?.reference,
            'idModalidade': docChampion?.idModalidade,
            'idFederation': docChampion?.idFederation,
            'idClube': docChampion?.idClube,
            'idFase': docFase?.reference,
            'idGrupo': idGrupo,
            'idParticipanteMandante': mandante?.refParticipante,
            'idParticipanteVisitante': visitante?.refParticipante,
            'idUsuarioMandante': mandante?.refUsuario,
            'idUsuarioVisitante': visitante?.refUsuario,

            'faseNome': docFase.tituloFase,
            'grupoNome': tituloGrupo,
            'partida': posicaoPartida,

            'mandanteNome': mandante?.docUsuario!?.displayName,
            'mandanteApelido': mandante?.docUsuario!?.displayApelido,
            'mandantePhoto': mandante?.docUsuario!?.photoUrl,
            'idClubeMandante': clubeMandante?.reference,
            'idFederationMandante': federationMandante?.reference,
            'FotoClubeMandante': clubeMandante?['Foto'] ?? "",
            'NomeClubeMandante': clubeMandante?['Nome'] ?? "",
            'FotoFederationMandante': federationMandante?['Foto'] ?? "",
            'NomeFederationMandante': federationMandante?['Nome'] ?? "",

            'visitanteNome': visitante?.docUsuario!?.displayName,
            'visitanteApelido': visitante?.docUsuario!?.displayApelido,
            'visitantePhoto': visitante?.docUsuario!?.photoUrl,
            'idClubeVisitante': clubeVisitante?.reference,
            'idFederationVisitante': federationVisitante?.reference,
            'FotoClubeVisitante': clubeVisitante?['Foto'] ?? "",
            'NomeClubeVisitante': clubeVisitante?['Nome'] ?? "",
            'FotoFederationVisitante': federationVisitante?['Foto'] ?? "",
            'NomeFederationVisitante': federationVisitante?['Nome'] ?? "",

            'listaUsuario': [mandante?.refUsuario, visitante?.refUsuario],
            'data_jogo': null,
          });

          // Adicionar a chave ao conjunto de jogos realizados
          jogosRealizados.add(chaveJogo);

          // Adicionar os participantes ao conjunto de participantes incluídos
          participantesIncluidos.add(participantes[i].id);
          participantesIncluidos.add(participantes[j].id);

          novosJogos = true;
        }
      }
    }

    // Verificar se novos jogos foram adicionados
    if (!novosJogos) {
      break;
    }

    // Limpar a lista de participantes incluídos para a próxima iteração
    participantesIncluidos.clear();
  }

  // atualiza a ultima posição no campeonato
  await docChampion?.reference.update({'ultimaPartida': posicaoPartida});

  await FirebaseFirestore.instance
      .collection('Fase')
      .doc(docFase?.reference.id)
      .update({'status': 1});

  return jogos;
}
