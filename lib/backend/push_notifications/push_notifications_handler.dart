import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/fundo.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Home': ParameterData.none(),
  'Modalidade': ParameterData.none(),
  'DrawerMenu': ParameterData.none(),
  'Login': ParameterData.none(),
  'ManutenoFederacoesClubes': ParameterData.none(),
  'Participante': (data) async {
    final allParams = {
      'docChampion': await getDocumentParameter<ChampionRecord>(
          data, 'docChampion', ChampionRecord.fromSnapshot),
    };
    return ParameterData(
      requiredParams: {
        'docChampion': serializeParam(
          allParams['docChampion'],
          ParamType.Document,
        ),
      },
      allParams: allParams,
    );
  },
  'Partidas': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
        },
      ),
  'Sumula': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
          'pageIndex': getParameter<int>(data, 'pageIndex'),
        },
      ),
  'Endereco': (data) async => ParameterData(
        allParams: {
          'geral': await getDocumentParameter<ChampionRecord>(
              data, 'geral', ChampionRecord.fromSnapshot),
        },
      ),
  'PlanodeAssinatura': ParameterData.none(),
  'SeuUniverso': ParameterData.none(),
  'NewChampion': ParameterData.none(),
  'ModifyCampeonato': (data) async => ParameterData(
        allParams: {
          'parcampeonato': await getDocumentParameter<ChampionRecord>(
              data, 'parcampeonato', ChampionRecord.fromSnapshot),
        },
      ),
  'Termos': ParameterData.none(),
  'federacoes': (data) async => ParameterData(
        allParams: {
          'paramname': getParameter<String>(data, 'paramname'),
          'paramimagem': getParameter<String>(data, 'paramimagem'),
          'paramuffederer': getParameter<String>(data, 'paramuffederer'),
          'paramiduser': getParameter<String>(data, 'paramiduser'),
        },
      ),
  'Tabela': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
        },
      ),
  'ConsultaChampion': ParameterData.none(),
  'ManutencaoRanking': ParameterData.none(),
  'TelaPcAcompanha': (data) async => ParameterData(
        allParams: {
          'parchampionTv': await getDocumentParameter<ChampionRecord>(
              data, 'parchampionTv', ChampionRecord.fromSnapshot),
        },
      ),
  'CalendarChampions': ParameterData.none(),
  'CriaRanking': (data) async => ParameterData(
        allParams: {
          'parModalidade':
              getParameter<DocumentReference>(data, 'parModalidade'),
        },
      ),
  'ConsultaJogos': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
        },
      ),
  'ColocacaoFederacao': (data) async => ParameterData(
        allParams: {
          'championfinal': await getDocumentParameter<RankingRecord>(
              data, 'championfinal', RankingRecord.fromSnapshot),
        },
      ),
  'ColocacaoClube': (data) async => ParameterData(
        allParams: {
          'ranking': await getDocumentParameter<RankingRecord>(
              data, 'ranking', RankingRecord.fromSnapshot),
        },
      ),
  'ColocacaoAtleta': (data) async => ParameterData(
        allParams: {
          'ranking': await getDocumentParameter<RankingRecord>(
              data, 'ranking', RankingRecord.fromSnapshot),
        },
      ),
  'ConsultaTabela': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
        },
      ),
  'ConsultaEstatistica': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
          'pageIndex': getParameter<int>(data, 'pageIndex'),
        },
      ),
  'NextGrupos': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
          'docFase': await getDocumentParameter<FaseRecord>(
              data, 'docFase', FaseRecord.fromSnapshot),
          'docGrupo': await getDocumentParameter<GrupoRecord>(
              data, 'docGrupo', GrupoRecord.fromSnapshot),
        },
      ),
  'ConsultaFederacoeseClubes': ParameterData.none(),
  'ListaInscritos': (data) async => ParameterData(
        allParams: {
          'docChampion': await getDocumentParameter<ChampionRecord>(
              data, 'docChampion', ChampionRecord.fromSnapshot),
        },
      ),
  'ConsultaJogosEstatisticos': ParameterData.none(),
  'SalaTrofeus': (data) async => ParameterData(
        allParams: {
          'paruser': await getDocumentParameter<UserRecord>(
              data, 'paruser', UserRecord.fromSnapshot),
        },
      ),
  'ManutAtleta': (data) async => ParameterData(
        allParams: {
          'dadosatleta': await getDocumentParameter<UserRecord>(
              data, 'dadosatleta', UserRecord.fromSnapshot),
        },
      ),
  'colocacao': (data) async => ParameterData(
        allParams: {
          'championfinal': await getDocumentParameter<ChampionRecord>(
              data, 'championfinal', ChampionRecord.fromSnapshot),
        },
      ),
  'ManutencaoAdmin': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
