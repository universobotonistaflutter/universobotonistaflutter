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
import '../../custom_code/actions/cria_jogos_na_fase.dart';

Future criarJogosGrupoDestintosTipo2(
  ChampionRecord? docChampion,
  FaseRecord? docFase,
  int numMesas,
) async {
  print('JOGOS DE GRUPO DISTINTO - TIPO 2');

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
      await montarJogos2(grupos, docChampion, docFase);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  WriteBatch batch = firestore.batch();

  // Variáveis para armazenar a rodada atual
  int rodadaAtual = 1;

  // Registro dos participantes em cada rodada
  Map<int, Set<DocumentReference>> participantesPorRodada = {};

  // Iterar sobre cada jogo montado
  for (var jogo in jogos) {
    // Inicializar o conjunto para a rodada atual, se necessário
    participantesPorRodada.putIfAbsent(rodadaAtual, () => {});

    // Verificar se os participantes já estão na rodada atual
    if (participantesPorRodada[rodadaAtual]!
            .contains(jogo['idUsuarioMandante']) ||
        participantesPorRodada[rodadaAtual]!
            .contains(jogo['idUsuarioVisitante'])) {
      // Encontrar a próxima rodada disponível para esses participantes
      for (int r = 1; r <= rodadaAtual + 1; r++) {
        // Inicializar o conjunto para a rodada 'r', se necessário
        participantesPorRodada.putIfAbsent(r, () => {});

        if (!participantesPorRodada[r]!.contains(jogo['idUsuarioMandante']) &&
            !participantesPorRodada[r]!.contains(jogo['idUsuarioVisitante'])) {
          if (mesaAtualPorRodada.containsKey(r) &&
              mesaAtualPorRodada[r]! < numMesas) {
            rodadaAtual = r;
            break;
          }
        }
      }
    }

    // Adicionar os participantes à rodada atual
    participantesPorRodada[rodadaAtual]!.add(jogo['idUsuarioMandante']);
    participantesPorRodada[rodadaAtual]!.add(jogo['idUsuarioVisitante']);

    // Inicializar a mesa atual para a rodada atual, se necessário
    mesaAtualPorRodada.putIfAbsent(rodadaAtual, () => 1);

    // Adicionar informações de rodada e mesa ao jogo
    jogo['rodadaNumero'] = rodadaAtual;
    jogo['mesaNumero'] = mesaAtualPorRodada[rodadaAtual]!;

    // Adicionar operação ao batch
    batch.set(firestore.collection('Jogos').doc(), jogo);

    print(
        'Jogo adicionado: ${jogo['mandanteNome']} vs ${jogo['visitanteNome']} no ${jogo['tituloGrupo']} na Rodada $rodadaAtual na Mesa ${mesaAtualPorRodada[rodadaAtual]}');

    // Incrementar o contador de mesas para a rodada atual
    mesaAtualPorRodada.update(rodadaAtual, (mesaAtual) => mesaAtual + 1,
        ifAbsent: () => 1);

    // Verificar se alcançamos o limite de mesas para a rodada atual
    if (mesaAtualPorRodada[rodadaAtual]! > numMesas) {
      //mesaAtualPorRodada[rodadaAtual] = 1; // Resetar a mesa atual para a rodada
      rodadaAtual++;
    }
  }

  // Executar todas as operações em lote
  await batch.commit();
}

Future<List<Map<String, dynamic>>> montarJogos2(
    Map<DocumentReference, List<DocumentReference>> grupos,
    ChampionRecord? docChampion,
    FaseRecord? docFase) async {
  List<Map<String, dynamic>> jogos = [];
  Set<DocumentReference> participantesIncluidos = {};
  Set<String> jogosRealizados =
      {}; // Conjunto para armazenar os jogos já realizados
  bool novosJogos;

  List<DocumentSnapshot?> listaClube = [];
  List<DocumentSnapshot?> listaFederation = [];
  List<UserDatalhe?> listaUsuario = [];

  // Verifica se o documento existe
  DocumentSnapshot? docChampionSnapshot = await docChampion?.reference.get();

  // Inicializa variáveis
  int posicaoPartida = 0;

  // Se o documento existe e o campo 'ultimaPartida' também, atualize posicaoPartida
  if (docChampionSnapshot != null && docChampionSnapshot.exists) {
    posicaoPartida = docChampionSnapshot['ultimaPartida'] ?? 0;
  }

  // Calcular o número total de jogos possíveis
  int totalJogosPossiveis = 0;
  for (var grupo1 in grupos.values) {
    for (var grupo2 in grupos.values) {
      if (grupo1 != grupo2) {
        totalJogosPossiveis += grupo1.length * grupo2.length;
      }
    }
  }

  do {
    novosJogos = false;

    // Verificar se todos os jogos possíveis já foram adicionados
    if (jogos.length >= totalJogosPossiveis) {
      break;
    }

    // Iterar sobre cada grupo para o mandante
    for (var grupoMandante in grupos.entries) {
      DocumentReference refGrupoMandante =
          grupoMandante.key; // DocumentReference do grupo mandante
      List<DocumentReference> participantesMandante = grupoMandante.value;

      // Iterar sobre cada grupo para o visitante
      for (var grupoVisitante in grupos.entries) {
        // Evitar confrontos dentro do mesmo grupo
        if (refGrupoMandante == grupoVisitante.key) {
          continue;
        }

        DocumentReference refGrupoVisitante =
            grupoVisitante.key; // DocumentReference do grupo visitante
        List<DocumentReference> participantesVisitante = grupoVisitante.value;

        DocumentSnapshot grupoMandanteSnapshot = await refGrupoMandante.get();
        DocumentSnapshot grupoVisitanteSnapshot = await refGrupoVisitante.get();
        String tituloGrupo = "";

        // Verificar se o documento realmente existe
        if (grupoMandanteSnapshot.exists && grupoVisitanteSnapshot.exists) {
          tituloGrupo = grupoMandanteSnapshot['tituloGrupo'] +
              "/" +
              grupoVisitanteSnapshot['tituloGrupo'];
        }

        // Organizar as partidas entre grupos diferentes
        for (var mandanteID in participantesMandante) {
          for (var visitanteID in participantesVisitante) {
            // Verificar se os participantes já foram incluídos nesta rodada
            if (participantesIncluidos.contains(mandanteID.id) ||
                participantesIncluidos.contains(visitanteID.id)) {
              continue;
            }

            // Gerar uma chave única para o par de jogadores
            String chaveJogo = '${mandanteID.id}-${visitanteID.id}';
            String chaveJogo2 = '${visitanteID.id}-${mandanteID.id}';

            // Verificar se o jogo já foi realizado
            if (jogosRealizados.contains(chaveJogo)) {
              continue;
            }

            if (jogosRealizados.contains(chaveJogo2)) {
              continue;
            }

            //************************************************

            DocumentSnapshot? docParticipanteMandante = await mandanteID?.get();
            DocumentSnapshot? docParticipanteVisitante =
                await visitanteID?.get();

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
                docUserMandante?.reference, docUserMandante, mandanteID);
            var visitante = new UserDatalhe(
                docUserVisitante?.reference, docUserVisitante, visitanteID);

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
              if (docFederationSnapshot != null &&
                  docFederationSnapshot.exists) {
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
              if (docFederationSnapshot != null &&
                  docFederationSnapshot.exists) {
                listaFederation.add(docFederationSnapshot);
                federationVisitante =
                    docFederationSnapshot; // Agora docEncontrado contém o DocumentSnapshot buscado
              }
            }

            //*************************************

            // Adicionar a chave ao conjunto de jogos realizados
            jogosRealizados.add(chaveJogo);
            jogosRealizados.add(chaveJogo2);

            /*
            // Adicionar jogo à lista
            jogos.add({
              'idMandante': mandante,
              'idVisitante': visitante,
              'grupoMandante': refGrupoMandante,
              'grupoVisitante': refGrupoVisitante,
            });
            */

            // Adicionar jogo à lista
            jogos.add({
              // Adicione aqui os campos que você deseja para o jogo
              'idChampion': docChampion?.reference,
              'idModalidade': docChampion?.idModalidade,
              'idFederation': docChampion?.idFederation,
              'idClube': docChampion?.idClube,
              'idFase': docFase?.reference,
              'idGrupo': refGrupoMandante,
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

            // Adicionar os participantes ao conjunto de participantes incluídos nesta rodada
            participantesIncluidos.add(mandanteID);
            participantesIncluidos.add(visitanteID);

            novosJogos = true;
          }
        }
      }
    }

    // Limpar a lista de participantes incluídos para a próxima rodada
    participantesIncluidos.clear();
  } while (novosJogos);

  // atualiza a ultima posição no campeonato
  await docChampion?.reference.update({'ultimaPartida': posicaoPartida});

  await FirebaseFirestore.instance
      .collection('Fase')
      .doc(docFase?.reference.id)
      .update({'status': 1});

  return jogos;
}
