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

class Club {
  final DocumentReference? refClub;
  final List<UserDatalhe> membros;

  Club(this.refClub, this.membros);
}

class Rodada {
  final int NumeroRoda;
  final List<DocumentReference?> participante;

  Rodada(this.NumeroRoda, this.participante);
}

class UserDatalhe {
  final DocumentReference? refUsuario;
  final UserRecord? docUsuario;
  final DocumentReference? refParticipante;

  UserDatalhe(this.refUsuario, this.docUsuario, this.refParticipante);
}

class Jogo {
  final UserDatalhe? Mandante;
  final UserDatalhe? Visitante;
  int partida;
  int rodada;
  int mesa;
  Jogo(this.Mandante, this.Visitante, this.partida, this.rodada, this.mesa);
}

Future<GrupoRecord?> getGrupo(DocumentReference grupoDocRef) async {
  var getDocGrupo =
      await FirebaseFirestore.instance.doc(grupoDocRef.path).get();

  GrupoRecord docGrupo = GrupoRecord.getDocumentFromData(
      getDocGrupo.data()!, getDocGrupo.reference);

  return docGrupo;
}

Future<UserRecord?> getUser(ChampionRecord docChampion, FaseRecord docFase,
    DocumentReference userDocRef) async {
  var getDocMandanteUsuario =
      await FirebaseFirestore.instance.doc(userDocRef.path).get();

  UserRecord docUsuario = UserRecord.getDocumentFromData(
      getDocMandanteUsuario.data()!, getDocMandanteUsuario.reference);

  return docUsuario;
}

// Consulta para usuário
Future<DocumentReference?> getParticipante(ChampionRecord docChampion,
    FaseRecord docFase, DocumentReference userDocRef) async {
  // Iniciar a consulta
  Query query = FirebaseFirestore.instance.collection('Participante');

  // Aplicar filtros
  query = query.where('idChampion', isEqualTo: docChampion.reference);
  /*
  query = query.where('idModalidade', isEqualTo: docChampion.idModalidade);
  query = query.where('idFederation', isEqualTo: docChampion.idFederation);
  query = query.where('idClube', isEqualTo: docChampion.idClube);
  */
  query = query.where('idFase', isEqualTo: docFase.reference);
  query = query.where('idParticipante', isEqualTo: userDocRef);

  // Obter os documentos que correspondem à consulta
  QuerySnapshot result = await query.get();

  // Verificar se a consulta retornou algum documento
  if (result.docs.isNotEmpty) {
    // Obter o primeiro DocumentSnapshot
    DocumentSnapshot firstDoc = result.docs.first;

    // Obter a DocumentReference do primeiro DocumentSnapshot
    return firstDoc.reference;
  }

  return null;
}

int getTotalPartidas(int qtdUsuario, int qtdMesas) {
  // Calculando o número total de partidas necessárias para que todos joguem entre si
  return qtdUsuario * (qtdUsuario - 1) ~/ 2;
}

int getTotalRodadas(int qtdUsuario, int qtdMesas) {
  // Calculando o número total de partidas necessárias para que todos joguem entre si
  int totalPartidas = qtdUsuario * (qtdUsuario - 1) ~/ 2;

  // Calculando o número total de rodadas necessárias com base no número de mesas disponíveis
  int totalRodadas = totalPartidas ~/ qtdMesas;

  // Se houver partidas extras que não se encaixem nas mesas disponíveis, adicione uma rodada extra
  if (totalPartidas % qtdMesas != 0) {
    totalRodadas += 1;
  }

  return totalRodadas;
}

Future criaJogosNaFase(
  ChampionRecord docChampion,
  FaseRecord docFase,
  int modoJogos,
  int qtdMesas,
) async {
  try {
    // Localizar o tamanho do UNIVERSO DE JOGOS, exemplo 50 100 jogos que serão produzidon, como que se encontra esse valor ?
    // Talvez usar probablidadelidade de combinaçõa
    /*
      Grupo tem um limite de 5 usuários todas as combinações 2
    *   Lista [0,1],[0,2],[0,3][0,4],[0,5]
    *
    * */

    // Busca todos os Grupos que têm idFase = docFase.reference
    QuerySnapshot gruposSnapshot = await FirebaseFirestore.instance
        .collection('Grupo')
        .where('idFase', isEqualTo: docFase.reference)
        .get();

    // Verifica se gruposSnapshot.docs não está vazio
    if (gruposSnapshot.docs.isEmpty) {
      print('gruposSnapshot.docs está vazio');
      return;
    }

    int mesaIndex = 0;
    int numeroRodada = 0;
    int totalPartidas = 1;

    // Verificações baseadas no modo de jogos
    switch (modoJogos) {
      case 1:
        // Código para o modo de jogos 1

        // roda grupo por grupo
        for (var grupo in gruposSnapshot.docs) {
          GrupoRecord? docGrupo = await getGrupo(grupo.reference);

          // ARMAZENA OS PARTICIAPNTES
          List<UserDatalhe?> listaUsuario = [];

          // ---------- DESATIVADO

          // LISTA MADANTE
          //List<DocumentReference> listaUsuarioGrupoMandate =
          //List<DocumentReference>.from(grupo['listaParticipante']);

          // LISTA VISITANTE
          //List<DocumentReference> listaUsuarioGrupoVisitante = listaUsuarioGrupoMandate;

          // ---------- DESATIVADO

          // MANDANTE
          // Busca os registros da coleção 'Participante' e ordena pelo campo que você deseja (por exemplo, 'nome')
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('Participante')
              .where('idGrupo', isEqualTo: grupo.reference)
              .orderBy(
                  'participanteNome') // Substitua 'nome' pelo campo que você quer usar para ordenação
              .get();

          // Converte os documentos em uma lista de DocumentReference
          List<DocumentReference> listaUsuarioGrupoMandate =
              querySnapshot.docs.map((doc) => doc.reference).toList();

          // CARREGA TODOS OS PARTICIPANTE DO CAMPEONATO
          await Future.forEach(querySnapshot.docs,
              (QueryDocumentSnapshot participanteItem) async {
            UserRecord? docUser;
            Map<String, dynamic>? data =
                participanteItem.data() as Map<String, dynamic>?;
            if (data != null && data.containsKey('idParticipante')) {
              docUser =
                  await getUser(docChampion, docFase, data['idParticipante']);
            }

            // armazena na lista temporaria de usuários suspensa na memoria aqui no dart
            listaUsuario.add(new UserDatalhe(
                docUser?.reference, docUser, participanteItem.reference));
          });

          /*
          // VISITANTE
          // Busca os registros da coleção 'Participante' e ordena pelo campo que você deseja (por exemplo, 'nome')
          QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance.collection('Participante')
              .orderBy('participanteNome',descending: true)  // Substitua 'nome' pelo campo que você quer usar para ordenação
              .get();

          // Converte os documentos em uma lista de DocumentReference
          List<DocumentReference> listaUsuarioGrupoVisitante = querySnapshot2.docs
              .map((doc) => doc.reference)
              .toList();
          */

          // Embaralhe a lista.
          //listaUsuarioGrupoMandate.shuffle();
          //listaUsuarioGrupoVisitante.shuffle();

          // ##################################################################
          // LOCALIZA TOTAL DE RODADAS DA FASE
          //totalRodadas = getTotalRodadas(listaUsuarioGrupoMandate.length, qtdMesas);
          totalPartidas =
              getTotalPartidas(listaUsuarioGrupoMandate.length, qtdMesas);
/*

          // CARREGA TODOS OS PARTICIPANTE DO CAMPEONATO
          await Future.forEach(listaUsuarioGrupoMandate,
                  (DocumentReference userItem) async {
                // carrega dados do firestore
                UserRecord? docUser = await getUser(docChampion, docFase, userItem);
                DocumentReference? refParticipante =
                await getParticipante(docChampion, docFase, userItem);

                // armazena na lista temporaria de usuários suspensa na memoria aqui no dart
                listaUsuario
                    .add(new UserDatalhe(userItem, docUser, refParticipante));
              });

*/
          // LISTA DOS USUÀRIOS QUE NÃO POSSUEM USUARIOS DO MESMO CLUBE NA COMPETIÇÃO
          List<UserDatalhe?> loboSolitarios = [];
          List<Club?> clubes = [];

          await Future.forEach(listaUsuario, (UserDatalhe? mandante) async {
            bool isSolitare = true;

            // VAMOS ENCONTRAR AMIGOS DO MADANTE
            await Future.forEach(listaUsuario, (UserDatalhe? visitante) async {
              // EVITA DO MADNANTE JOGAR COM ELE
              if (mandante?.refUsuario != visitante?.refUsuario) {
                // CASO EXISTA ALGUEM COM MESMO CLUBE
                if (mandante?.docUsuario?.club == visitante?.docUsuario?.club) {
                  isSolitare = false;

                  Club clubeNovo = new Club(mandante!.docUsuario?.club, []);
                  bool cadastrarClube = true;

                  // RODA TODOS OS CLUBES
                  for (var ccc = 0; ccc < clubes.length; ccc += 1) {
                    // O CLUBE EXISTE CADASTRADO
                    if (clubes?[ccc]!.refClub == mandante!.docUsuario?.club) {
                      // NAO CADASTRA O CLUBE POR QUE ACHOU ELE
                      cadastrarClube = false;
                      bool cadastraVisitante = true;

                      // RODA TODOS OS MEMBROS
                      for (var mmm = 0;
                          mmm < clubes[ccc]!.membros.length;
                          mmm += 1) {
                        // VEIRIFCA SE O USUARIO JA EXISTE NA LISTA DE MEMBROS DO CLUBE
                        if (clubes?[ccc]!.membros[mmm].refUsuario ==
                            visitante!.refUsuario) {
                          cadastraVisitante = false;
                        }
                      }

                      // ADICIONA O VISITANTE A LISTA
                      if (cadastraVisitante) {
                        clubes?[ccc]!.membros.add(visitante!);
                      }
                    }
                    ;
                  }

                  // PRIMEIRO CADASTRO DO CLUBE
                  if (cadastrarClube) {
                    // ADICIONA O VISITANTE
                    clubeNovo.membros.add(visitante!);

                    // E ADICIOAN OC LUBE
                    clubes.add(clubeNovo);
                  }
                }
              }
            });

            // MADANTE ESTA SOZINHO NA HISTORIA
            if (isSolitare) {
              loboSolitarios.add(mandante);
            } else {
              // ADICIONA O MADANTE TAMBÈM, POR QUE EXISTEM VISITANTES DO MESMO CLUBE
              //clubeMandante.membros.add(mandante);
            }
          });

          // #########################################################################
          // #########################################################################
          // #########################################################################
          // #########################################################################
          // #########################################################################
          // #########################################################################
          // #########################################################################

          // REINICIA PARAMETROS PARA PREPARAR CRIAÇÂO DE RODADAS
          mesaIndex = 0;
          List<Jogo> jogosDoGrupo = [];

          // INICIALIZA AMBIENTE DE JOGO
          UserDatalhe? mandante;
          UserDatalhe? visitante;

          List<DocumentReference?> historicoAdicionados = [];

          // EXISTEM MEMBROS DO MESMO CLUBE
          if (clubes.length > 0) {
            // RODA OS CLUBES COM DUPLAS OU MAIS INTEGRANTE
            for (int c = 0; c < clubes.length; c += 1) {
              // ROTA TODOS OS MEMBROS PARA MONTAR OS MANDANTES
              for (int mu = 0; mu < clubes[c]!.membros.length; mu += 1) {
                // CARREGA O MANDANTE
                mandante = clubes[c]?.membros[mu];
                bool LastJaFoiAdicionado = false;

                // RODA TODOS OS MEMBROS PARA ENCONTRAR OS ADVERSARIOS
                for (int vu = 0; vu < clubes[c]!.membros.length; vu += 1) {
                  // CARREGA O MANDANTE
                  visitante = clubes[c]?.membros[vu];

                  // PULA O REGISTRO DO MADNANTE
                  if (mandante?.refUsuario == visitante?.refUsuario) {
                    continue;
                  }

                  // VERIFICAR SE JA JOGOU COM ESTE USUARIO
                  bool JaFoiAdicionado = false;

                  // VERIFICA SE JÁ FOI ADICIONADO
                  for (int ha = 0; ha < jogosDoGrupo.length; ha += 1) {
                    // IDENTIFICA SE EXISTEM REGISTROS DO MANDANTE JÁ NA TABELA
                    if (jogosDoGrupo[ha].Mandante?.refUsuario ==
                        mandante?.refUsuario) {
                      if (jogosDoGrupo[ha].Visitante?.refUsuario ==
                          visitante?.refUsuario) {
                        JaFoiAdicionado = true;
                        break;
                      }
                    } else if (jogosDoGrupo[ha].Visitante?.refUsuario ==
                        mandante?.refUsuario) {
                      if (jogosDoGrupo[ha].Mandante?.refUsuario ==
                          visitante?.refUsuario) {
                        JaFoiAdicionado = true;
                        break;
                      }
                    }
                  }

                  // armazena o ultimo satatus do adicioando
                  LastJaFoiAdicionado = JaFoiAdicionado;

                  // CASO JÁ EXISTA PULA PARA O PROXIMO
                  if (JaFoiAdicionado) {
                    continue;
                  } else {
                    if (!JaFoiAdicionado) {
                      jogosDoGrupo.add(new Jogo(mandante, visitante, 0, -2, 0));
                    }
                  }
                }

                // CASO TERMINE COM FALSE, O MADNANTE FICOU SEM ADVERSÁRIO
                if (!LastJaFoiAdicionado) {
                  //jogosDoGrupo.add(new Jogo( mandante, mandante, partida, rodada, mesa));
                }

                //break;
              }

              // ENCONTROU MANDANTE E VISITANTE
              /*
              if ((mandante!=null) && (visitante!=null)) {

                break;
              }
              */
            }

            //clubes.clear();
          }

          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################
          // #################################################################################

          // ROTA TODOS OS MEMBROS PARA MONTAR OS MANDANTES
          for (int mu = 0; mu < listaUsuario.length; mu += 1) {
            // CARREGA O MANDANTE
            mandante = listaUsuario[mu];

            // RODA TODOS OS MEMBROS PARA ENCONTRAR OS ADVERSARIOS
            for (int vu = 0;
                vu < listaUsuario.reversed.toList().length;
                vu += 1) {
              // CARREGA O MANDANTE
              visitante = listaUsuario.reversed.toList()[vu];

              // PULA O REGISTRO DO MADNANTE
              if (mandante?.refUsuario == visitante?.refUsuario) {
                continue;
              }

              // VERIFICAR SE JA JOGOU COM ESTE USUARIO
              bool JaFoiAdicionado = false;

              // VERIFICA SE JÁ FOI ADICIONADO
              for (int ha = 0; ha < jogosDoGrupo.length; ha += 1) {
                // IDENTIFICA SE EXISTEM REGISTROS DO MANDANTE JÁ NA TABELA
                if (jogosDoGrupo[ha].Mandante?.refUsuario ==
                    mandante?.refUsuario) {
                  if (jogosDoGrupo[ha].Visitante?.refUsuario ==
                      visitante?.refUsuario) {
                    JaFoiAdicionado = true;
                    break;
                  }
                } else if (jogosDoGrupo[ha].Visitante?.refUsuario ==
                    mandante?.refUsuario) {
                  if (jogosDoGrupo[ha].Mandante?.refUsuario ==
                      visitante?.refUsuario) {
                    JaFoiAdicionado = true;
                    break;
                  }
                }
              }

              // CASO JÁ EXISTA PULA PARA O PROXIMO
              if (JaFoiAdicionado) {
                continue;
              } else {
                if (!JaFoiAdicionado) {
                  jogosDoGrupo.add(new Jogo(mandante, visitante, 0, -1, 0));
                }
              }
            }
          }

          // #######################################################################
          // #######################################################################
          // #######################################################################
          // #######################################################################
          // #######################################################################

          List<Rodada> listaRodadas = [];
          List<DocumentReference?> usuarioDaRodada = [];

          Map<int, int> mesasPorRodada = {}; // Novo mapa para mesas por rodada
          int partida = 0; // Contador de partidas
          int rodada = 0; // Número da rodada atual
          int mesa = 0; // Número da mesa atual

          // Sua função para buscar a próxima rodada
          int buscaProximaRodada(dynamic mandante, dynamic visitante) {
            // Substituir 'dynamic' pelo tipo real
            if (listaRodadas.isEmpty) {
              return 1;
            }

            int maiorRodada = 0;
            for (var rodada in listaRodadas) {
              maiorRodada = max(maiorRodada, rodada.NumeroRoda);
            }

            for (int i = 1; i <= maiorRodada; i++) {
              bool mandanteJogou = false;
              bool visitanteJogou = false;
              for (var rodada in listaRodadas) {
                if (rodada.NumeroRoda == i) {
                  if (rodada.participante.contains(mandante))
                    mandanteJogou = true;
                  if (rodada.participante.contains(visitante))
                    visitanteJogou = true;
                }
              }
              if (!mandanteJogou && !visitanteJogou) {
                return i;
              }
            }

            return maiorRodada + 1;
          }

          // Função modificada para buscar mesa disponível
          int buscaMesaDisponivel(int rodada, int qtdMesas) {
            int mesasUsadas = mesasPorRodada.containsKey(rodada)
                ? mesasPorRodada[rodada]!
                : 0;
            if (mesasUsadas < qtdMesas) {
              return mesasUsadas + 1;
            } else {
              return -1;
            }
          }

          // #######################################################################################

          var continuaRodando = true;

          while (continuaRodando) {
            for (int ha = 0; ha < jogosDoGrupo.length; ha += 1) {
              if (jogosDoGrupo[ha].rodada == -2) {
                // Substituir com a lógica correta
                partida += 1;
                rodada = buscaProximaRodada(
                    jogosDoGrupo[ha].Mandante?.refUsuario,
                    jogosDoGrupo[ha]
                        .Visitante
                        ?.refUsuario); // Substituir com os campos corretos
                mesa = buscaMesaDisponivel(rodada, qtdMesas);

                if (mesa != -1) {
                  if (!mesasPorRodada.containsKey(rodada)) {
                    mesasPorRodada[rodada] = 0;
                  }
                  mesasPorRodada[rodada] = (mesasPorRodada[rodada] ?? 0) + 1;

                  String print_debug =
                      '-2: [ ] partida:$partida - rodada:$rodada - mesa:$mesa | mandante: ' +
                          jogosDoGrupo[ha]
                              .Mandante!
                              .docUsuario!
                              .displayApelido +
                          '| visitante:' +
                          jogosDoGrupo[ha]
                              .Visitante!
                              .docUsuario!
                              .displayApelido;
                  print(print_debug);
                } else {
                  mesa = 1;
                  rodada += 1;

                  String print_debug =
                      '-2: [X] partida:$partida - rodada:$rodada - mesa:$mesa | mandante: ' +
                          jogosDoGrupo[ha]
                              .Mandante!
                              .docUsuario!
                              .displayApelido +
                          '| visitante:' +
                          jogosDoGrupo[ha]
                              .Visitante!
                              .docUsuario!
                              .displayApelido;
                  print(print_debug);
                }

                listaRodadas.add(Rodada(rodada, [
                  jogosDoGrupo[ha]
                      .Mandante
                      ?.refUsuario, // Substituir com os campos corretos
                  jogosDoGrupo[ha]
                      .Visitante
                      ?.refUsuario // Substituir com os campos corretos
                ]));

                jogosDoGrupo[ha].partida =
                    partida; // Substituir com os campos corretos
                jogosDoGrupo[ha].rodada =
                    rodada; // Substituir com os campos corretos
                jogosDoGrupo[ha].mesa =
                    mesa; // Substituir com os campos corretos
              }
            }

            // Código para terminar o loop, você já tinha algo similar
            continuaRodando = false;

            for (int ha = 0; ha < jogosDoGrupo.length; ha += 1) {
              if (jogosDoGrupo[ha].rodada == -2) {
                // Substituir com a lógica correta
                continuaRodando = true;
              }
            }
          }

          // LIMPA OS USUÁRIOS DA RODA
          usuarioDaRodada.clear();
          continuaRodando = true;

          print(
              '##################################################################');

          while (continuaRodando) {
            for (int ha = 0; ha < jogosDoGrupo.length; ha += 1) {
              if (jogosDoGrupo[ha].rodada == -1) {
                // Substituir com a lógica correta
                partida += 1;
                rodada = buscaProximaRodada(
                    jogosDoGrupo[ha].Mandante?.refUsuario,
                    jogosDoGrupo[ha]
                        .Visitante
                        ?.refUsuario); // Substituir com os campos corretos
                mesa = buscaMesaDisponivel(rodada, qtdMesas);

                if (mesa != -1) {
                  if (!mesasPorRodada.containsKey(rodada)) {
                    mesasPorRodada[rodada] = 0;
                  }
                  mesasPorRodada[rodada] = (mesasPorRodada[rodada] ?? 0) + 1;

                  String print_debug =
                      '-1: [ ] partida:$partida - rodada:$rodada - mesa:$mesa | mandante: ' +
                          jogosDoGrupo[ha]
                              .Mandante!
                              .docUsuario!
                              .displayApelido +
                          '| visitante:' +
                          jogosDoGrupo[ha]
                              .Visitante!
                              .docUsuario!
                              .displayApelido;
                  print(print_debug);
                } else {
                  String print_debug =
                      '-1: [X] partida:$partida - rodada:$rodada - mesa:$mesa | mandante: ' +
                          jogosDoGrupo[ha]
                              .Mandante!
                              .docUsuario!
                              .displayApelido +
                          '| visitante:' +
                          jogosDoGrupo[ha]
                              .Visitante!
                              .docUsuario!
                              .displayApelido;
                  print(print_debug);

                  mesa = 1;
                  rodada += 1;
                }

                listaRodadas.add(Rodada(rodada, [
                  jogosDoGrupo[ha]
                      .Mandante
                      ?.refUsuario, // Substituir com os campos corretos
                  jogosDoGrupo[ha]
                      .Visitante
                      ?.refUsuario // Substituir com os campos corretos
                ]));

                jogosDoGrupo[ha].partida =
                    partida; // Substituir com os campos corretos
                jogosDoGrupo[ha].rodada =
                    rodada; // Substituir com os campos corretos
                jogosDoGrupo[ha].mesa =
                    mesa; // Substituir com os campos corretos
              }
            }

            // Código para terminar o loop, você já tinha algo similar
            continuaRodando = false;
            for (int ha = 0; ha < jogosDoGrupo.length; ha += 1) {
              if (jogosDoGrupo[ha].rodada == -1) {
                // Substituir com a lógica correta
                continuaRodando = true;
              }
            }
          }

          // Verifica se o documento existe
          DocumentSnapshot? docChampionSnapshot =
              await docChampion.reference.get();

          // Inicializa variáveis
          int posicaoPartida = 0;
          int jp = 0;

          // Se o documento existe e o campo 'ultimaPartida' também, atualize posicaoPartida
          if (docChampionSnapshot != null && docChampionSnapshot.exists) {
            posicaoPartida = docChampionSnapshot!['ultimaPartida'] ?? 0;
          }

          // roda todos os jogos e organiza os jogos pela posição
          for (jp = 0; jp < jogosDoGrupo.length; jp += 1) {
            // incrementa cada posicao da partida
            posicaoPartida += 1;

            // atualiza na lista
            jogosDoGrupo[jp].partida = posicaoPartida;
          }

          // atualiza a ultima posição no campeonato
          await docChampion.reference.update({'ultimaPartida': jp});

          List<DocumentSnapshot?> listaClube = [];
          List<DocumentSnapshot?> listaFederation = [];

          // PREPARAR PARA INCLUIR OS JOGOS
          await Future.forEach(jogosDoGrupo, (Jogo? jogo) async {
            var clubeRef = jogo?.Mandante?.docUsuario!.club;

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

            clubeRef = jogo?.Visitante?.docUsuario!.club;

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

            var federationRef = jogo?.Mandante?.docUsuario!.federation;

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

            federationRef = jogo?.Visitante?.docUsuario!.federation;

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

            await FirebaseFirestore.instance.collection('Jogos').add({
              // Adicione aqui os campos que você deseja para o jogo
              'idChampion': docChampion.reference,
              'idModalidade': docChampion.idModalidade,
              'idFederation': docChampion.idFederation,
              'idClube': docChampion.idClube,
              'idFase': docFase.reference,
              'idGrupo': grupo.reference,
              'idParticipanteMandante': jogo?.Mandante?.refParticipante,
              'idParticipanteVisitante': jogo?.Visitante?.refParticipante,
              'idUsuarioMandante': jogo?.Mandante?.refUsuario,
              'idUsuarioVisitante': jogo?.Visitante?.refUsuario,

              'faseNome': docFase.tituloFase,
              'grupoNome': docGrupo?.tituloGrupo,
              'partida': jogo?.partida,
              'rodadaNumero': jogo?.rodada,

              'mesaNumero': jogo?.mesa,
              'partida': jogo?.partida,
              'rodadaNumero': jogo?.rodada,

              'mandanteNome': jogo?.Mandante?.docUsuario!?.displayName,
              'mandanteApelido': jogo?.Mandante?.docUsuario!?.displayApelido,
              'mandantePhoto': jogo?.Mandante?.docUsuario!?.photoUrl,
              'idClubeMandante': clubeMandante?.reference,
              'idFederationMandante': federationMandante?.reference,
              'FotoClubeMandante': clubeMandante?['Foto'] ?? "",
              'NomeClubeMandante': clubeMandante?['Nome'] ?? "",
              'FotoFederationMandante': federationMandante?['Foto'] ?? "",
              'NomeFederationMandante': federationMandante?['Nome'] ?? "",

              'visitanteNome': jogo?.Visitante?.docUsuario!?.displayName,
              'visitanteApelido': jogo?.Visitante?.docUsuario!?.displayApelido,
              'visitantePhoto': jogo?.Visitante?.docUsuario!?.photoUrl,
              'idClubeVisitante': clubeVisitante?.reference,
              'idFederationVisitante': federationVisitante?.reference,
              'FotoClubeVisitante': clubeVisitante?['Foto'] ?? "",
              'NomeClubeVisitante': clubeVisitante?['Nome'] ?? "",
              'FotoFederationVisitante': federationVisitante?['Foto'] ?? "",
              'NomeFederationVisitante': federationVisitante?['Nome'] ?? "",

              'listaUsuario': [
                jogo?.Mandante?.refUsuario,
                jogo?.Visitante?.refUsuario
              ]
            });
          });
        }

        break;
      case 2:
        // Código para o modo de jogos 2
        break;
      case 3:
        // Código para o modo de jogos 3
        break;
      default:
        // Código para outros modos de jogos
        break;
    }

    // Atualiza o status da fase no Firestore
    /*


    await FirebaseFirestore.instance
        .collection('Fase')
        .doc(docFase.reference.id)
        .update({'status': 1});


     */
  } catch (e) {
    print(e.toString());
  }
}
