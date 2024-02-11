import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/button_sheet/administradores/administradores_widget.dart';
import '/button_sheet/help_new_champion/help_new_champion_widget.dart';
import '/button_sheet/mensagem_champion/mensagem_champion_widget.dart';
import '/button_sheet/share/share_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'consulta_champion_model.dart';
export 'consulta_champion_model.dart';

class ConsultaChampionWidget extends StatefulWidget {
  const ConsultaChampionWidget({super.key});

  @override
  State<ConsultaChampionWidget> createState() => _ConsultaChampionWidgetState();
}

class _ConsultaChampionWidgetState extends State<ConsultaChampionWidget>
    with TickerProviderStateMixin {
  late ConsultaChampionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultaChampionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConsultaChampion'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).info,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).info,
          elevation: 8.0,
          label: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CONSULTA_CHAMPION_Icon_5dcipovn_ON_TAP');
                  var shouldSetState = false;
                  if (valueOrDefault(currentUserDocument?.assinatura, 0) == 1) {
                    logFirebaseEvent('Icon_ad_mob');

                    _model.interstitialAdSuccessok =
                        await admob.showInterstitialAd();

                    shouldSetState = true;
                    if (_model.interstitialAdSuccessok!) {
                      logFirebaseEvent('Icon_ad_mob');

                      admob.loadInterstitialAd(
                        "",
                        "ca-app-pub-9245979386423612/4089977140",
                        false,
                      );
                    }
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: const Color(0x40558BF8),
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              child: const ShareWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  } else {
                    logFirebaseEvent('Icon_bottom_sheet');
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: const Color(0x40558BF8),
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              child: const ShareWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));

                    if (shouldSetState) setState(() {});
                    return;
                  }

                  if (shouldSetState) setState(() {});
                },
                child: Icon(
                  Icons.share_outlined,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('CONSULTA_CHAMPION_Icon_uox17xn5_ON_TAP');
                    var shouldSetState = false;
                    if (valueOrDefault(currentUserDocument?.assinatura, 0) <=
                        1) {
                      logFirebaseEvent('Icon_ad_mob');

                      _model.interstialNewChamp =
                          await admob.showInterstitialAd();

                      shouldSetState = true;
                      if (_model.interstialNewChamp == null) {
                        logFirebaseEvent('Icon_ad_mob');

                        admob.loadInterstitialAd(
                          "",
                          "ca-app-pub-9245979386423612/4089977140",
                          true,
                        );
                      }
                      logFirebaseEvent('Icon_firestore_query');
                      _model.championsAbertos = await queryChampionRecordOnce(
                        queryBuilder: (championRecord) => championRecord
                            .where(
                              'administrador',
                              isEqualTo: currentUserReference,
                            )
                            .where(
                              'Status',
                              isLessThanOrEqualTo: 6,
                            ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      shouldSetState = true;
                      if ((_model.championsAbertos != null) == true) {
                        logFirebaseEvent('Icon_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Atenção!'),
                              content: Text(
                                  '${_model.championsAbertos?.nomecampeonato} está criado, voce poderá usá-lo, ou deverá exclui-lo  antes de criar um novo Campeonato.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        if (shouldSetState) setState(() {});
                        return;
                      } else {
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed('NewChampion');

                        if (shouldSetState) setState(() {});
                        return;
                      }
                    } else if (valueOrDefault(
                            currentUserDocument?.assinatura, 0) >=
                        2) {
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('NewChampion');
                    } else {
                      logFirebaseEvent('Icon_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('ATENÇÃO Cadastro Incompleto...'),
                            content:
                                const Text('Voce necessita finalizar seu Cadastro'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                      logFirebaseEvent('Icon_navigate_to');

                      context.pushNamed('SeuUniverso');

                      if (shouldSetState) setState(() {});
                      return;
                    }

                    if (shouldSetState) setState(() {});
                  },
                  child: Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 40.0,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('CONSULTA_CHAMPION_Icon_tk65x813_ON_TAP');
                  var shouldSetState = false;
                  if (valueOrDefault(currentUserDocument?.assinatura, 0) == 1) {
                    logFirebaseEvent('Icon_ad_mob');

                    _model.interstitialAdSuccessook =
                        await admob.showInterstitialAd();

                    shouldSetState = true;
                    if (_model.interstitialAdSuccessook!) {
                      logFirebaseEvent('Icon_ad_mob');

                      admob.loadInterstitialAd(
                        "",
                        "ca-app-pub-9245979386423612/4089977140",
                        false,
                      );
                    }
                    logFirebaseEvent('Icon_navigate_to');

                    context.pushNamed('CalendarChampions');
                  } else {
                    logFirebaseEvent('Icon_navigate_to');

                    context.pushNamed('CalendarChampions');

                    if (shouldSetState) setState(() {});
                    return;
                  }

                  if (shouldSetState) setState(() {});
                },
                child: Icon(
                  Icons.search,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).info,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CONSULTA_CHAMPION_arrow_back_rounded_ICN');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('DrawerMenu');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'qcy4dqzb' /* Painel de Campeonatos */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<ChampionRecord>>(
            stream: queryChampionRecord(
              queryBuilder: (championRecord) =>
                  championRecord.orderBy('Data_atualizao', descending: true),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 10.0,
                    height: 10.0,
                    child: SpinKitRipple(
                      color: FlutterFlowTheme.of(context).info,
                      size: 10.0,
                    ),
                  ),
                );
              }
              List<ChampionRecord> containerChampionRecordList = snapshot.data!;
              return Container(
                width: double.infinity,
                height: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 750.0,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Imagem_2.jpeg',
                    ).image,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).info,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: FlutterFlowButtonTabBar(
                              useToggleButtonStyle: false,
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelLarge,
                              unselectedLabelStyle: const TextStyle(),
                              labelColor: FlutterFlowTheme.of(context).info,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              borderColor: FlutterFlowTheme.of(context).info,
                              unselectedBorderColor:
                                  FlutterFlowTheme.of(context).info,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              elevation: 0.0,
                              buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              padding: const EdgeInsets.all(4.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '4l3e8egn' /* Andamento */,
                                  ),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.peopleCarry,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'heo3k9y2' /* Encerrados */,
                                  ),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.trophy,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '6cq7as14' /* Confrontos */,
                                  ),
                                  icon: const FaIcon(
                                    FontAwesomeIcons.peopleArrows,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    StreamBuilder<
                                                        List<
                                                            FederationsRecord>>(
                                                  stream:
                                                      queryFederationsRecord(
                                                    queryBuilder:
                                                        (federationsRecord) =>
                                                            federationsRecord
                                                                .orderBy('UF'),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 10.0,
                                                          height: 10.0,
                                                          child: SpinKitRipple(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 10.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<FederationsRecord>
                                                        dropDownFederationsRecordList =
                                                        snapshot.data!;
                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.dropDownValue ??=
                                                            valueOrDefault<
                                                                String>(
                                                          currentUserDocument
                                                              ?.federation?.id,
                                                          '0',
                                                        ),
                                                      ),
                                                      options: List<
                                                              String>.from(
                                                          dropDownFederationsRecordList
                                                              .map((e) => e
                                                                  .reference.id)
                                                              .toList()),
                                                      optionLabels:
                                                          dropDownFederationsRecordList
                                                              .map(
                                                                  (e) => e.nome)
                                                              .toList(),
                                                      onChanged: (val) =>
                                                          setState(() => _model
                                                                  .dropDownValue =
                                                              val),
                                                      width: 300.0,
                                                      height: 45.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'ke8jhx7y' /* Consulte uma Federação? */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isOverButton: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'CONSULTA_CHAMPION_PAGE_TODOS_BTN_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Button_set_form_field');
                                                  setState(() {
                                                    _model.dropDownValueController
                                                            ?.value =
                                                        'Consulte uma Federação?';
                                                  });
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'm6fs2ia0' /* Todos */,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  elevation: 3.0,
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final championEmAberto = functions
                                                        .campeonatosEmAberto(
                                                            containerChampionRecordList
                                                                .toList(),
                                                            _model
                                                                .dropDownValue,
                                                            functions.strFederer(
                                                                _model
                                                                    .dropDownValue))
                                                        ?.toList() ??
                                                    [];
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      championEmAberto.length,
                                                  itemBuilder: (context,
                                                      championEmAbertoIndex) {
                                                    final championEmAbertoItem =
                                                        championEmAberto[
                                                            championEmAbertoIndex];
                                                    return Visibility(
                                                      visible:
                                                          championEmAbertoItem
                                                                  .status <=
                                                              5,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 235.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image:
                                                                    CachedNetworkImageProvider(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    championEmAbertoItem
                                                                        .fotoTorneio,
                                                                    'https://firebasestorage.googleapis.com/v0/b/universo-botonista-flutterflow.appspot.com/o/users%2FzNApvxTWOxZxnlpnYJjrhB9o7bG3%2Fuploads%2F1692451243056000.jpg?alt=media&token=54bd7fc0-31e0-4304-9efe-67d66910d643',
                                                                  ),
                                                                ),
                                                              ),
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x71FFFFFF),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                width: 3.0,
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xD9FFFFFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 45.0,
                                                                              height: 45.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                shape: BoxShape.circle,
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                              ),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_CircleImage_49jdmg15_O');
                                                                                  logFirebaseEvent('CircleImage_expand_image');
                                                                                  await Navigator.push(
                                                                                    context,
                                                                                    PageTransition(
                                                                                      type: PageTransitionType.fade,
                                                                                      child: FlutterFlowExpandedImageView(
                                                                                        image: CachedNetworkImage(
                                                                                          fadeInDuration: const Duration(milliseconds: 500),
                                                                                          fadeOutDuration: const Duration(milliseconds: 500),
                                                                                          imageUrl: championEmAbertoItem.fotoModalidade,
                                                                                          fit: BoxFit.contain,
                                                                                        ),
                                                                                        allowRotation: false,
                                                                                        tag: championEmAbertoItem.fotoModalidade,
                                                                                        useHeroAnimation: true,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Hero(
                                                                                  tag: championEmAbertoItem.fotoModalidade,
                                                                                  transitionOnUserGestures: true,
                                                                                  child: Container(
                                                                                    width: 45.0,
                                                                                    height: 45.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: const BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: const Duration(milliseconds: 500),
                                                                                      fadeOutDuration: const Duration(milliseconds: 500),
                                                                                      imageUrl: championEmAbertoItem.fotoModalidade,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('CONSULTA_CHAMPION_Container_izacqzvb_ON_');
                                                                                logFirebaseEvent('Container_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      '${championEmAbertoItem.nomecampeonato}--- Obs ->${championEmAbertoItem.observaoes}...${championEmAbertoItem.tipoTorneio}...${championEmAbertoItem.nomeFederation}',
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                    ),
                                                                                    duration: const Duration(milliseconds: 3550),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 1.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 36.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0x3F558BF8),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        championEmAbertoItem.nomecampeonato.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        maxLines: 1,
                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_Container_8wagjtpq_ON_');
                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'ListaInscritos',
                                                                                    queryParameters: {
                                                                                      'docChampion': serializeParam(
                                                                                        championEmAbertoItem,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'docChampion': championEmAbertoItem,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0x3F558BF8),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.format_list_numbered_rtl,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          championEmAbertoItem.participante.length.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                fontWeight: FontWeight.w300,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'x70nkh6z' /* / */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          championEmAbertoItem.numberParticipantes.toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                fontWeight: FontWeight.w300,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('CONSULTA_CHAMPION_Container_5r01so6o_ON_');
                                                                                logFirebaseEvent('Container_bottom_sheet');
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: const Color(0x00FFFFFF),
                                                                                  barrierColor: const Color(0x40558BF8),
                                                                                  useSafeArea: true,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Padding(
                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                        child: SizedBox(
                                                                                          height: MediaQuery.sizeOf(context).height * 0.85,
                                                                                          child: const HelpNewChampionWidget(),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 1.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 129.0,
                                                                                  height: 36.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0x3F558BF8),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    children: [
                                                                                      if (championEmAbertoItem.tipoParticipa == 'Individual')
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: FaIcon(
                                                                                            FontAwesomeIcons.male,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 18.0,
                                                                                          ),
                                                                                        ),
                                                                                      if (championEmAbertoItem.tipoParticipa == 'Equipe')
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.reduce_capacity,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: Text(
                                                                                          championEmAbertoItem.tipoParticipa,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_Container_tbj2k4qj_ON_');
                                                                                  logFirebaseEvent('Container_show_snack_bar');
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        () {
                                                                                          if (championEmAbertoItem.status == 1) {
                                                                                            return 'Em Programação';
                                                                                          } else if (championEmAbertoItem.status == 2) {
                                                                                            return 'Inscrições Abertas';
                                                                                          } else if (championEmAbertoItem.status == 3) {
                                                                                            return 'Configuração das Tebelas';
                                                                                          } else if (championEmAbertoItem.status == 4) {
                                                                                            return 'Configuração dos Jogos';
                                                                                          } else if (championEmAbertoItem.status == 5) {
                                                                                            return 'Jogos em Andamento';
                                                                                          } else if (championEmAbertoItem.status == 6) {
                                                                                            return 'Finalizado';
                                                                                          } else {
                                                                                            return championEmAbertoItem.status.toString();
                                                                                          }
                                                                                        }(),
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0x3F558BF8),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Align(
                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                      child: SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                () {
                                                                                                  if (championEmAbertoItem.status == 1) {
                                                                                                    return 'Em Programação';
                                                                                                  } else if (championEmAbertoItem.status == 2) {
                                                                                                    return 'Inscrições Abertas';
                                                                                                  } else if (championEmAbertoItem.status == 3) {
                                                                                                    return 'Preparando Tabelas';
                                                                                                  } else if (championEmAbertoItem.status == 4) {
                                                                                                    return 'Preparando Jogos';
                                                                                                  } else if (championEmAbertoItem.status == 5) {
                                                                                                    return 'Jogos em Andamento';
                                                                                                  } else if (championEmAbertoItem.status == 6) {
                                                                                                    return 'Finalizado';
                                                                                                  } else {
                                                                                                    return championEmAbertoItem.status.toString();
                                                                                                  }
                                                                                                }(),
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('CONSULTA_CHAMPION_Container_r9h9l1h3_ON_');
                                                                                logFirebaseEvent('Container_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      dateTimeFormat(
                                                                                        'd/M/y',
                                                                                        championEmAbertoItem.dataTorneio!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                    ),
                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 1.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                child: Container(
                                                                                  height: 36.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: const Color(0x3F558BF8),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.edit_calendar,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          'd/M/y',
                                                                                          championEmAbertoItem.dataTorneio!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontWeight: FontWeight.w300,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_Container_elposta5_ON_');
                                                                                  logFirebaseEvent('Container_show_snack_bar');
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        dateTimeFormat(
                                                                                          'jm',
                                                                                          championEmAbertoItem.dataTorneio!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    height: 36.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0x3F558BF8),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        Icon(
                                                                                          Icons.update,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        Text(
                                                                                          dateTimeFormat(
                                                                                            'jm',
                                                                                            championEmAbertoItem.dataTorneio!,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                fontWeight: FontWeight.w300,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('CONSULTA_CHAMPION_PAGE_LOCAL_BTN_ON_TAP');
                                                                                logFirebaseEvent('Button_navigate_to');

                                                                                context.pushNamed(
                                                                                  'Endereco',
                                                                                  queryParameters: {
                                                                                    'geral': serializeParam(
                                                                                      championEmAbertoItem,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'geral': championEmAbertoItem,
                                                                                  },
                                                                                );
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'jl3h5w8d' /* Local */,
                                                                              ),
                                                                              icon: const FaIcon(
                                                                                FontAwesomeIcons.mapMarkedAlt,
                                                                                size: 20.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 36.0,
                                                                                padding: const EdgeInsets.all(0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: const Color(0x3F558BF8),
                                                                                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontWeight: FontWeight.w300,
                                                                                    ),
                                                                                elevation: 2.0,
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          if ((championEmAbertoItem.administrador == currentUserReference) &&
                                                                              (championEmAbertoItem.status < 3))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Modifica_ON_TAP');
                                                                                  logFirebaseEvent('Modifica_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'ModifyCampeonato',
                                                                                    queryParameters: {
                                                                                      'parcampeonato': serializeParam(
                                                                                        championEmAbertoItem,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'parcampeonato': championEmAbertoItem,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 57.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'afa0vvkp' /* Modificar */,
                                                                                            ),
                                                                                            textAlign: TextAlign.center,
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.mode_outlined,
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((championEmAbertoItem.administrador == currentUserReference) &&
                                                                              (championEmAbertoItem.status < 3))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Excluir_ON_TAP');
                                                                                  logFirebaseEvent('Excluir_alert_dialog');
                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: const Text('Apagar Campeonato'),
                                                                                            content: const Text('Deseja apagar este campeonato?'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                child: const Text('Não!'),
                                                                                              ),
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                child: const Text('Sim!'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ) ??
                                                                                      false;
                                                                                  if (confirmDialogResponse) {
                                                                                    logFirebaseEvent('Excluir_backend_call');
                                                                                    await championEmAbertoItem.reference.delete();
                                                                                    logFirebaseEvent('Excluir_backend_call');

                                                                                    await currentUserReference!.update({
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'participanteIDChampion': FieldValue.arrayRemove([
                                                                                            championEmAbertoItem.reference
                                                                                          ]),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                  } else {
                                                                                    return;
                                                                                  }

                                                                                  logFirebaseEvent('Excluir_show_snack_bar');
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Campeonato Excluído com Sucesso!',
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 4000),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                    ),
                                                                                  );
                                                                                  logFirebaseEvent('Excluir_navigate_to');

                                                                                  context.pushNamed('ConsultaChampion');
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 57.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0x40558BF8),
                                                                                      borderRadius: const BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'iowgnlcg' /* Excluir */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.delete_sharp,
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((championEmAbertoItem.administrador == currentUserReference) &&
                                                                              (championEmAbertoItem.status == 1))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_PAGE_AbrirInscr_ON_TAP');
                                                                                  logFirebaseEvent('AbrirInscr_backend_call');

                                                                                  await currentUserReference!.update({
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'participanteIDChampion': FieldValue.arrayUnion([
                                                                                          championEmAbertoItem.reference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  if ((championEmAbertoItem.tipoTorneio == 'Torneio Regional') || (championEmAbertoItem.tipoTorneio == 'Torneio Aberto') || (championEmAbertoItem.tipoTorneio == 'Torneio Nacional')) {
                                                                                    logFirebaseEvent('AbrirInscr_firestore_query');
                                                                                    _model.listaUsuariosDoMesmoEstado = await queryUserRecordOnce(
                                                                                      queryBuilder: (userRecord) => userRecord.where(
                                                                                        'Federation',
                                                                                        isEqualTo: championEmAbertoItem.idFederation,
                                                                                      ),
                                                                                    );
                                                                                    if (_model.listaUsuariosDoMesmoEstado!.isNotEmpty) {
                                                                                      logFirebaseEvent('AbrirInscr_trigger_push_notification');
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: 'Aberta as Inscrições para o;  ${'${championEmAbertoItem.nomecampeonato}, '}${championEmAbertoItem.observaoes}',
                                                                                        notificationText: 'Torneio será realizado no dia; ${dateTimeFormat(
                                                                                          'd/M/y',
                                                                                          championEmAbertoItem.dataTorneio,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )}  as   ${dateTimeFormat(
                                                                                          'jm',
                                                                                          championEmAbertoItem.dataTorneio,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )}',
                                                                                        notificationImageUrl: championEmAbertoItem.fotoTorneio,
                                                                                        notificationSound: 'default',
                                                                                        userRefs: _model.listaUsuariosDoMesmoEstado!.map((e) => e.reference).toList(),
                                                                                        initialPageName: 'ConsultaChampion',
                                                                                        parameterData: {},
                                                                                      );
                                                                                      logFirebaseEvent('AbrirInscr_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Foram convidados ${_model.listaUsuariosDoMesmoEstado?.length.toString()} Atletas',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('AbrirInscr_alert_dialog');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: const Text('Nao  Enviado Convite'),
                                                                                          content: Text(championEmAbertoItem.nomecampeonato),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: const Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }

                                                                                  logFirebaseEvent('AbrirInscr_backend_call');

                                                                                  await championEmAbertoItem.reference.update({
                                                                                    ...createChampionRecordData(
                                                                                      dataAtualizao: getCurrentTimestamp,
                                                                                      status: 2,
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'Participante': FieldValue.arrayUnion([
                                                                                          currentUserReference
                                                                                        ]),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                  logFirebaseEvent('AbrirInscr_show_snack_bar');
                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'Botonistas já podem se inscrever!',
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                      ),
                                                                                      duration: const Duration(milliseconds: 1950),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                    ),
                                                                                  );
                                                                                  logFirebaseEvent('AbrirInscr_navigate_to');

                                                                                  context.pushNamed('ConsultaChampion');

                                                                                  setState(() {});
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 57.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: const Color(0x3F558BF8),
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'pnax768q' /* Abrir Ins */,
                                                                                            ),
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.emoji_people,
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((championEmAbertoItem.status == 2) ||
                                                                              (valueOrDefault(currentUserDocument?.assinatura, 0) == 4))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Confirma_ON_TAP');
                                                                                    var shouldSetState = false;
                                                                                    if (championEmAbertoItem.participante.contains(currentUserReference)) {
                                                                                      logFirebaseEvent('Confirma_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Participante',
                                                                                        pathParameters: {
                                                                                          'docChampion': serializeParam(
                                                                                            championEmAbertoItem,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'docChampion': championEmAbertoItem,
                                                                                        },
                                                                                      );

                                                                                      if (shouldSetState) setState(() {});
                                                                                      return;
                                                                                    } else {
                                                                                      if (currentUserDocument?.federation != championEmAbertoItem.idFederation) {
                                                                                        logFirebaseEvent('Confirma_alert_dialog');
                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: const Text('ATENÇÃO!'),
                                                                                                  content: const Text('Você não pertence a esta federação,  Deseja continuar?'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                      child: const Text('Não!'),
                                                                                                    ),
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                      child: const Text('Sim!'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ) ??
                                                                                            false;
                                                                                        if (confirmDialogResponse) {
                                                                                          logFirebaseEvent('Confirma_custom_action');
                                                                                          _model.championAtual = await actions.getDocChampion(
                                                                                            championEmAbertoItem.reference,
                                                                                          );
                                                                                          shouldSetState = true;
                                                                                          logFirebaseEvent('Confirma_backend_call');

                                                                                          await championEmAbertoItem.reference.update({
                                                                                            ...createChampionRecordData(
                                                                                              dataAtualizao: getCurrentTimestamp,
                                                                                            ),
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'Participante': FieldValue.arrayUnion([
                                                                                                  currentUserReference
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Confirma_backend_call');

                                                                                          await currentUserReference!.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'participanteIDChampion': FieldValue.arrayUnion([
                                                                                                  championEmAbertoItem.reference
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('Confirma_navigate_to');

                                                                                          context.pushNamed(
                                                                                            'Participante',
                                                                                            pathParameters: {
                                                                                              'docChampion': serializeParam(
                                                                                                _model.championAtual,
                                                                                                ParamType.Document,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                            extra: <String, dynamic>{
                                                                                              'docChampion': _model.championAtual,
                                                                                            },
                                                                                          );

                                                                                          if (shouldSetState) setState(() {});
                                                                                          return;
                                                                                        } else {
                                                                                          if (shouldSetState) setState(() {});
                                                                                          return;
                                                                                        }
                                                                                      }
                                                                                    }

                                                                                    logFirebaseEvent('Confirma_alert_dialog');
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: const Text('Confirma sua Participação?'),
                                                                                              content: Text(championEmAbertoItem.nomecampeonato),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: const Text('Não!'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: const Text('Sim!'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      logFirebaseEvent('Confirma_custom_action');
                                                                                      _model.championAtualizado = await actions.getDocChampion(
                                                                                        championEmAbertoItem.reference,
                                                                                      );
                                                                                      shouldSetState = true;
                                                                                      logFirebaseEvent('Confirma_backend_call');

                                                                                      await championEmAbertoItem.reference.update({
                                                                                        ...createChampionRecordData(
                                                                                          dataAtualizao: getCurrentTimestamp,
                                                                                          nomeAdmin: currentUserDisplayName,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'Participante': FieldValue.arrayUnion([
                                                                                              currentUserReference
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      logFirebaseEvent('Confirma_backend_call');

                                                                                      await currentUserReference!.update({
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'participanteIDChampion': FieldValue.arrayUnion([
                                                                                              championEmAbertoItem.reference
                                                                                            ]),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      logFirebaseEvent('Confirma_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'Participante',
                                                                                        pathParameters: {
                                                                                          'docChampion': serializeParam(
                                                                                            _model.championAtualizado,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'docChampion': _model.championAtualizado,
                                                                                        },
                                                                                      );

                                                                                      if (shouldSetState) setState(() {});
                                                                                      return;
                                                                                    } else {
                                                                                      if (shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    if (shouldSetState) setState(() {});
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1.0,
                                                                                    shape: const RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 57.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(35.0),
                                                                                          bottomRight: Radius.circular(35.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'td1w2t9q' /* Confirme */,
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                    fontSize: 10.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.add_task_sharp,
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((championEmAbertoItem.status >= 2) ||
                                                                              (valueOrDefault(currentUserDocument?.assinatura, 0) == 4))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Table_ON_TAP');
                                                                                    logFirebaseEvent('Table_backend_call');

                                                                                    await championEmAbertoItem.reference.update(createChampionRecordData(
                                                                                      dataAtualizao: getCurrentTimestamp,
                                                                                    ));
                                                                                    if (championEmAbertoItem.participante.length == 1) {
                                                                                      logFirebaseEvent('Table_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return AlertDialog(
                                                                                            title: const Text('Atenção!'),
                                                                                            content: const Text('Precisará ter mais de um Participante Inscrito neste Campeonato para a geração de Tabelas.'),
                                                                                            actions: [
                                                                                              TextButton(
                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                child: const Text('Ok'),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                      return;
                                                                                    }
                                                                                    logFirebaseEvent('Table_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Tabela',
                                                                                      queryParameters: {
                                                                                        'docChampion': serializeParam(
                                                                                          championEmAbertoItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'docChampion': championEmAbertoItem,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1.0,
                                                                                    shape: const RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 57.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(35.0),
                                                                                          bottomRight: Radius.circular(35.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '8ncn7b73' /* Tabela */,
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                    fontSize: 10.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.schema_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((championEmAbertoItem.status >= 3) ||
                                                                              (valueOrDefault(currentUserDocument?.assinatura, 0) == 4))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Jogos_ON_TAP');
                                                                                    logFirebaseEvent('Jogos_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'Partidas',
                                                                                      queryParameters: {
                                                                                        'docChampion': serializeParam(
                                                                                          championEmAbertoItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'docChampion': championEmAbertoItem,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1.0,
                                                                                    shape: const RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 57.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(35.0),
                                                                                          bottomRight: Radius.circular(35.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'h2c6cjw9' /* Jogos */,
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                    fontSize: 10.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.table_restaurant_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (championEmAbertoItem.status >=
                                                                              4)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Sumul_ON_TAP');
                                                                                  logFirebaseEvent('Sumul_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'Sumula',
                                                                                    queryParameters: {
                                                                                      'docChampion': serializeParam(
                                                                                        championEmAbertoItem,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'docChampion': championEmAbertoItem,
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 57.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'ryppdphl' /* Sumula */,
                                                                                            ),
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          FFIcons.ksoccerCourt,
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (championEmAbertoItem.status >=
                                                                              4)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Estatistic_ON_TAP');
                                                                                  var shouldSetState = false;
                                                                                  if (valueOrDefault(currentUserDocument?.assinatura, 0) <= 1) {
                                                                                    logFirebaseEvent('Estatistic_ad_mob');

                                                                                    _model.interstitialconsChampion = await admob.showInterstitialAd();

                                                                                    shouldSetState = true;
                                                                                    if (_model.interstitialconsChampion!) {
                                                                                      logFirebaseEvent('Estatistic_ad_mob');

                                                                                      admob.loadInterstitialAd(
                                                                                        "",
                                                                                        "ca-app-pub-9245979386423612/4089977140",
                                                                                        false,
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('Estatistic_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'ConsultaEstatistica',
                                                                                      queryParameters: {
                                                                                        'docChampion': serializeParam(
                                                                                          championEmAbertoItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'docChampion': championEmAbertoItem,
                                                                                      },
                                                                                    );

                                                                                    if (shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }

                                                                                  logFirebaseEvent('Estatistic_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'ConsultaEstatistica',
                                                                                    queryParameters: {
                                                                                      'docChampion': serializeParam(
                                                                                        championEmAbertoItem,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'docChampion': championEmAbertoItem,
                                                                                    },
                                                                                  );

                                                                                  if (shouldSetState) setState(() {});
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 57.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '3stim9b9' /* Desemp */,
                                                                                            ),
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.query_stats,
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (championEmAbertoItem.status >=
                                                                              4)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_Posicionamento_ON_TAP');
                                                                                  var shouldSetState = false;
                                                                                  if (valueOrDefault(currentUserDocument?.assinatura, 0) <= 1) {
                                                                                    logFirebaseEvent('Posicionamento_ad_mob');

                                                                                    _model.interstitialPosChampion = await admob.showInterstitialAd();

                                                                                    shouldSetState = true;
                                                                                    if (_model.interstitialPosChampion!) {
                                                                                      logFirebaseEvent('Posicionamento_ad_mob');

                                                                                      admob.loadInterstitialAd(
                                                                                        "",
                                                                                        "ca-app-pub-9245979386423612/4089977140",
                                                                                        false,
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    logFirebaseEvent('Posicionamento_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'colocacao',
                                                                                      queryParameters: {
                                                                                        'championfinal': serializeParam(
                                                                                          championEmAbertoItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'championfinal': championEmAbertoItem,
                                                                                      },
                                                                                    );

                                                                                    if (shouldSetState) setState(() {});
                                                                                    return;
                                                                                  }

                                                                                  logFirebaseEvent('Posicionamento_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'colocacao',
                                                                                    queryParameters: {
                                                                                      'championfinal': serializeParam(
                                                                                        championEmAbertoItem,
                                                                                        ParamType.Document,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      'championfinal': championEmAbertoItem,
                                                                                    },
                                                                                  );

                                                                                  if (shouldSetState) setState(() {});
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 1.0,
                                                                                  shape: const RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 50.0,
                                                                                    height: 57.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      borderRadius: const BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        width: 2.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '5z7iazlf' /* Final */,
                                                                                            ),
                                                                                            maxLines: 1,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Poppins',
                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        FaIcon(
                                                                                          FontAwesomeIcons.award,
                                                                                          color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (valueOrDefault(currentUserDocument?.assinatura, 0) !=
                                                                              1)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CONSULTA_CHAMPION_PAGE_Mensage_ON_TAP');
                                                                                    var shouldSetState = false;
                                                                                    if (valueOrDefault(currentUserDocument?.assinatura, 0) <= 1) {
                                                                                      logFirebaseEvent('Mensage_ad_mob');

                                                                                      _model.interstitialmsgChampion = await admob.showInterstitialAd();

                                                                                      shouldSetState = true;
                                                                                      if (_model.interstitialmsgChampion!) {
                                                                                        logFirebaseEvent('Mensage_ad_mob');

                                                                                        admob.loadInterstitialAd(
                                                                                          "",
                                                                                          "ca-app-pub-9245979386423612/4089977140",
                                                                                          false,
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      logFirebaseEvent('Mensage_bottom_sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: const Color(0x01000000),
                                                                                        barrierColor: const Color(0x3F558BF8),
                                                                                        useSafeArea: true,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: SizedBox(
                                                                                                height: MediaQuery.sizeOf(context).height * 0.75,
                                                                                                child: MensagemChampionWidget(
                                                                                                  parMsgChamp: championEmAbertoItem,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));

                                                                                      if (shouldSetState) setState(() {});
                                                                                      return;
                                                                                    }

                                                                                    logFirebaseEvent('Mensage_bottom_sheet');
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: const Color(0x01000000),
                                                                                      barrierColor: const Color(0x3F558BF8),
                                                                                      useSafeArea: true,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: SizedBox(
                                                                                              height: MediaQuery.sizeOf(context).height * 0.75,
                                                                                              child: MensagemChampionWidget(
                                                                                                parMsgChamp: championEmAbertoItem,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));

                                                                                    if (shouldSetState) setState(() {});
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1.0,
                                                                                    shape: const RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 57.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(35.0),
                                                                                          bottomRight: Radius.circular(35.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'kwcpvy51' /* Informe */,
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                    fontSize: 10.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.wechat_sharp,
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (valueOrDefault(currentUserDocument?.assinatura, 0) !=
                                                                              1)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CONSULTA_CHAMPION_PAGE_ChampionTV_ON_TAP');
                                                                                    logFirebaseEvent('ChampionTV_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'TelaPcAcompanha',
                                                                                      queryParameters: {
                                                                                        'parchampionTv': serializeParam(
                                                                                          championEmAbertoItem,
                                                                                          ParamType.Document,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        'parchampionTv': championEmAbertoItem,
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: Material(
                                                                                    color: Colors.transparent,
                                                                                    elevation: 1.0,
                                                                                    shape: const RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(35.0),
                                                                                        bottomRight: Radius.circular(35.0),
                                                                                        topLeft: Radius.circular(8.0),
                                                                                        topRight: Radius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: 50.0,
                                                                                      height: 57.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        borderRadius: const BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(35.0),
                                                                                          bottomRight: Radius.circular(35.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                's5z361um' /* TV */,
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                    fontSize: 10.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.personal_video_outlined,
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                logFirebaseEvent('CONSULTA_CHAMPION_ChampionInvite_ON_TAP');
                                                                                logFirebaseEvent('ChampionInvite_copy_to_clipboard');
                                                                                await Clipboard.setData(ClipboardData(text: 'https://universo-botonista-u880rv.flutterflow.app/novo/${championEmAbertoItem.reference.id}'));
                                                                                logFirebaseEvent('ChampionInvite_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Copiado para area de transferencia!',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                    ),
                                                                                    duration: const Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                );
                                                                              },
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 1.0,
                                                                                shape: const RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(35.0),
                                                                                    bottomRight: Radius.circular(35.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 50.0,
                                                                                  height: 57.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    borderRadius: const BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(35.0),
                                                                                      bottomRight: Radius.circular(35.0),
                                                                                      topLeft: Radius.circular(8.0),
                                                                                      topRight: Radius.circular(8.0),
                                                                                    ),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      width: 2.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '0rl4l88f' /* Share */,
                                                                                          ),
                                                                                          maxLines: 1,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Poppins',
                                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                fontSize: 10.0,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Icon(
                                                                                        Icons.share,
                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                        size: 22.0,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            5.0,
                                                                            8.0,
                                                                            2.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            championEmAbertoItem.nomeAdmin.maybeHandleOverflow(
                                                                              maxChars: 15,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'rrihm3ii' /* Atualiz.: */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              'd/M H:mm',
                                                                              championEmAbertoItem.dataAtualizao!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 12.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if ((championEmAbertoItem.administrador ==
                                                                                currentUserReference) &&
                                                                            (valueOrDefault(currentUserDocument?.assinatura, 0) !=
                                                                                1))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                AuthUserStreamWidget(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  logFirebaseEvent('CONSULTA_CHAMPION_Icon_sms99e90_ON_TAP');
                                                                                  logFirebaseEvent('Icon_bottom_sheet');
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    barrierColor: const Color(0x3F558BF8),
                                                                                    useSafeArea: true,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: SizedBox(
                                                                                            height: MediaQuery.sizeOf(context).height * 0.9,
                                                                                            child: AdministradoresWidget(
                                                                                              champion: championEmAbertoItem,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.more_vert,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Builder(
                                  builder: (context) {
                                    final championEncerrado =
                                        containerChampionRecordList
                                            .where((e) => e.participante
                                                .contains(currentUserReference))
                                            .toList();
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            championEncerrado.length,
                                            (championEncerradoIndex) {
                                          final championEncerradoItem =
                                              championEncerrado[
                                                  championEncerradoIndex];
                                          return Visibility(
                                            visible:
                                                championEncerradoItem.status ==
                                                    6,
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 10.0, 10.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/fundodetela.png',
                                                    ).image,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      offset: const Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'blk567re' /* Nome:  */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            championEncerradoItem
                                                                .nomecampeonato
                                                                .maybeHandleOverflow(
                                                              maxChars: 20,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3numpvz1' /* Data:  */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                    'd/M/y',
                                                                    championEncerradoItem
                                                                        .dataTorneio!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'a52gcfqk' /* Modalidade: */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  championEncerradoItem
                                                                      .modalidadeTorneio,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 3.0,
                                                      indent: 10.0,
                                                      endIndent: 10.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CONSULTA_CHAMPION_POSIÇÃO_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.pushNamed(
                                                                'colocacao',
                                                                queryParameters:
                                                                    {
                                                                  'championfinal':
                                                                      serializeParam(
                                                                    championEncerradoItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'championfinal':
                                                                      championEncerradoItem,
                                                                },
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ybdvanan' /* Posição */,
                                                            ),
                                                            icon: const Icon(
                                                              Icons.pin,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CONSULTA_CHAMPION_PAGE_TABELA_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.pushNamed(
                                                                'ConsultaTabela',
                                                                queryParameters:
                                                                    {
                                                                  'docChampion':
                                                                      serializeParam(
                                                                    championEncerradoItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'docChampion':
                                                                      championEncerradoItem,
                                                                },
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'ygul2pwv' /* Tabela */,
                                                            ),
                                                            icon: const Icon(
                                                              Icons
                                                                  .table_rows_outlined,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'CONSULTA_CHAMPION_PAGE_JOGOS_BTN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Button_navigate_to');

                                                              context.pushNamed(
                                                                'ConsultaJogos',
                                                                queryParameters:
                                                                    {
                                                                  'docChampion':
                                                                      serializeParam(
                                                                    championEncerradoItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'docChampion':
                                                                      championEncerradoItem,
                                                                },
                                                              );
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'tl4hgebp' /* Jogos */,
                                                            ),
                                                            icon: const Icon(
                                                              Icons
                                                                  .table_restaurant,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width: 100.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              currentUserPhoto,
                                                              'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                            ),
                                                            width: 40.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Text(
                                                          currentUserDisplayName,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (valueOrDefault(
                                            currentUserDocument?.assinatura,
                                            0) !=
                                        1)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 5.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              constraints: const BoxConstraints(
                                                maxWidth: 600.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/fundo_transparente.png',
                                                  ).image,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    offset: const Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: StreamBuilder<
                                                        List<
                                                            UserConfrontoRecord>>(
                                                      stream:
                                                          queryUserConfrontoRecord(
                                                        parent:
                                                            currentUserReference,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UserConfrontoRecord>
                                                            dataTableUserConfrontoRecordList =
                                                            snapshot.data!;
                                                        return SizedBox(
                                                          width: 600.0,
                                                          child: DataTable2(
                                                            columns: [
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'e5gdkzyu' /* Adversário */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    150.0,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ky401b8e' /* PJ */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'd1x0m4sf' /* V+ */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          fontSize:
                                                                              14.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'fmxzz5jx' /* E */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sf26zgde' /* D- */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'fhnvheks' /* GP */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'acoqs8tb' /* GC */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vxbo8nf3' /* SD */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                            rows:
                                                                dataTableUserConfrontoRecordList
                                                                    .mapIndexed((dataTableIndex,
                                                                            dataTableUserConfrontoRecord) =>
                                                                        [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('CONSULTA_CHAMPION_Icon_fvqt6glh_ON_TAP');
                                                                                      logFirebaseEvent('Icon_navigate_to');

                                                                                      context.pushNamed('ConsultaJogosEstatisticos');
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.search_sharp,
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      dataTableUserConfrontoRecord.idAdversario?.id,
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontSize: 8.0,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalPartidas.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalDerrotas.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalEmpates.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalVitorias.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalGolsPro.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalGolsContra.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            dataTableUserConfrontoRecord.totalSaldoGols.toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                ),
                                                                          ),
                                                                        ]
                                                                            .map((c) => DataCell(
                                                                                c))
                                                                            .toList())
                                                                    .map((e) =>
                                                                        DataRow(
                                                                            cells:
                                                                                e))
                                                                    .toList(),
                                                            headingRowColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .info,
                                                            ),
                                                            headingRowHeight:
                                                                40.0,
                                                            dataRowColor:
                                                                MaterialStateProperty
                                                                    .all(
                                                              const Color(0x00000000),
                                                            ),
                                                            dataRowHeight: 45.0,
                                                            border: TableBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            dividerThickness:
                                                                1.0,
                                                            columnSpacing: 10.0,
                                                            showBottomBorder:
                                                                true,
                                                            minWidth: 49.0,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault(
                                            currentUserDocument?.assinatura,
                                            0) ==
                                        1)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 10.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 600.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: Image.asset(
                                                      'assets/images/fundo_transparente.png',
                                                    ).image,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 2.0,
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            25.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            25.0),
                                                                  ),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        offset: const Offset(
                                                                            0.0,
                                                                            2.0),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              25.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              25.0),
                                                                    ),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                  child: Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'xga1q3gk' /* Área exclusiva de Assinantes */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        5.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'CONSULTA_CHAMPION_Container_kr65jh9w_ON_');
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context.pushNamed(
                                                                    'PlanodeAssinatura');
                                                              },
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    width: 2.0,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaleFactor:
                                                                          MediaQuery.of(context)
                                                                              .textScaleFactor,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'tmfa39em' /* Clique aqui e torne-se um Assi... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'npogsioh' /*  Torne-se um usuário Prata e t... */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  10.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowAdBanner(
                                                        width: 320.0,
                                                        height: 100.0,
                                                        showsTestAd: false,
                                                        androidAdUnitID:
                                                            'ca-app-pub-9245979386423612/1041138407',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
