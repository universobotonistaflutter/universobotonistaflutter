import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const DrawerMenuWidget() : const HomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const DrawerMenuWidget() : const HomeWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/home',
          builder: (context, params) => const HomeWidget(),
        ),
        FFRoute(
          name: 'Modalidade',
          path: '/modalidade',
          requireAuth: true,
          builder: (context, params) => const ModalidadeWidget(),
        ),
        FFRoute(
          name: 'DrawerMenu',
          path: '/drawerMenu',
          requireAuth: true,
          builder: (context, params) => const DrawerMenuWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'ManutenoFederacoesClubes',
          path: '/manutenoFederacoesClubes',
          builder: (context, params) => const ManutenoFederacoesClubesWidget(),
        ),
        FFRoute(
          name: 'Participante',
          path: '/champ/:docChampion',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ParticipanteWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Partidas',
          path: '/Jogos',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => PartidasWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Sumula',
          path: '/Sumula',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => SumulaWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
            pageIndex: params.getParam('pageIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Endereco',
          path: '/endereco',
          requireAuth: true,
          asyncParams: {
            'geral': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => EnderecoWidget(
            geral: params.getParam('geral', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'PlanodeAssinatura',
          path: '/planodeAssinatura',
          requireAuth: true,
          builder: (context, params) => const PlanodeAssinaturaWidget(),
        ),
        FFRoute(
          name: 'SeuUniverso',
          path: '/seuUniverso',
          requireAuth: true,
          builder: (context, params) => const SeuUniversoWidget(),
        ),
        FFRoute(
          name: 'NewChampion',
          path: '/modifyChampion1',
          requireAuth: true,
          builder: (context, params) => const NewChampionWidget(),
        ),
        FFRoute(
          name: 'ModifyCampeonato',
          path: '/ModifyCampeonato',
          requireAuth: true,
          asyncParams: {
            'parcampeonato': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ModifyCampeonatoWidget(
            parcampeonato: params.getParam('parcampeonato', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Termos',
          path: '/termos',
          builder: (context, params) => const TermosWidget(),
        ),
        FFRoute(
          name: 'federacoes',
          path: '/federacoes',
          requireAuth: true,
          builder: (context, params) => FederacoesWidget(
            paramname: params.getParam('paramname', ParamType.String),
            paramimagem: params.getParam('paramimagem', ParamType.String),
            paramuffederer: params.getParam('paramuffederer', ParamType.String),
            paramiduser: params.getParam('paramiduser', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Tabela',
          path: '/HelpTabela',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => TabelaWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ConsultaChampion',
          path: '/Novo',
          requireAuth: true,
          builder: (context, params) => const ConsultaChampionWidget(),
        ),
        FFRoute(
          name: 'ManutencaoRanking',
          path: '/ConsultaRanking',
          requireAuth: true,
          builder: (context, params) => const ManutencaoRankingWidget(),
        ),
        FFRoute(
          name: 'TelaPcAcompanha',
          path: '/telaPcAcompanha',
          requireAuth: true,
          asyncParams: {
            'parchampionTv': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => TelaPcAcompanhaWidget(
            parchampionTv: params.getParam('parchampionTv', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'CalendarChampions',
          path: '/CalendarChampions',
          requireAuth: true,
          builder: (context, params) => const CalendarChampionsWidget(),
        ),
        FFRoute(
          name: 'CriaRanking',
          path: '/CriaRanking',
          requireAuth: true,
          builder: (context, params) => CriaRankingWidget(
            parModalidade: params.getParam('parModalidade',
                ParamType.DocumentReference, false, ['Modalidades']),
          ),
        ),
        FFRoute(
          name: 'ConsultaJogos',
          path: '/ConsultaJogos',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ConsultaJogosWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ColocacaoFederacao',
          path: '/ColocacaoFederacao',
          requireAuth: true,
          asyncParams: {
            'championfinal': getDoc(['Ranking'], RankingRecord.fromSnapshot),
          },
          builder: (context, params) => ColocacaoFederacaoWidget(
            championfinal: params.getParam('championfinal', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ColocacaoClube',
          path: '/ColocacaoClube',
          requireAuth: true,
          asyncParams: {
            'ranking': getDoc(['Ranking'], RankingRecord.fromSnapshot),
          },
          builder: (context, params) => ColocacaoClubeWidget(
            ranking: params.getParam('ranking', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ColocacaoAtleta',
          path: '/ColocacaoAtleta',
          requireAuth: true,
          asyncParams: {
            'ranking': getDoc(['Ranking'], RankingRecord.fromSnapshot),
          },
          builder: (context, params) => ColocacaoAtletaWidget(
            ranking: params.getParam('ranking', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ConsultaTabela',
          path: '/ConsultaTabela',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ConsultaTabelaWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ConsultaEstatistica',
          path: '/ConsultaEstatistica',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ConsultaEstatisticaWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
            pageIndex: params.getParam('pageIndex', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'NextGrupos',
          path: '/nextGrupos',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
            'docFase': getDoc(['Fase'], FaseRecord.fromSnapshot),
            'docGrupo': getDoc(['Grupo'], GrupoRecord.fromSnapshot),
          },
          builder: (context, params) => NextGruposWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
            docFase: params.getParam('docFase', ParamType.Document),
            docGrupo: params.getParam('docGrupo', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ConsultaFederacoeseClubes',
          path: '/consultaFederacoeseClubes',
          requireAuth: true,
          builder: (context, params) => const ConsultaFederacoeseClubesWidget(),
        ),
        FFRoute(
          name: 'ListaInscritos',
          path: '/ListaInscritos',
          requireAuth: true,
          asyncParams: {
            'docChampion': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ListaInscritosWidget(
            docChampion: params.getParam('docChampion', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ConsultaJogosEstatisticos',
          path: '/ConsultaJogosEstatisticos',
          requireAuth: true,
          builder: (context, params) => const ConsultaJogosEstatisticosWidget(),
        ),
        FFRoute(
          name: 'SalaTrofeus',
          path: '/salaTrofeus',
          requireAuth: true,
          asyncParams: {
            'paruser': getDoc(['user'], UserRecord.fromSnapshot),
          },
          builder: (context, params) => SalaTrofeusWidget(
            paruser: params.getParam('paruser', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ManutAtleta',
          path: '/manutAtleta',
          requireAuth: true,
          asyncParams: {
            'dadosatleta': getDoc(['user'], UserRecord.fromSnapshot),
          },
          builder: (context, params) => ManutAtletaWidget(
            dadosatleta: params.getParam('dadosatleta', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'colocacao',
          path: '/Posicionamento1',
          requireAuth: true,
          asyncParams: {
            'championfinal': getDoc(['Champion'], ChampionRecord.fromSnapshot),
          },
          builder: (context, params) => ColocacaoWidget(
            championfinal: params.getParam('championfinal', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'ManutencaoAdmin',
          path: '/ManutencaoAdmin',
          requireAuth: true,
          builder: (context, params) => const ManutencaoAdminWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/home';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/fundo.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
