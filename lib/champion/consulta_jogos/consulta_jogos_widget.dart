import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'consulta_jogos_model.dart';
export 'consulta_jogos_model.dart';

class ConsultaJogosWidget extends StatefulWidget {
  const ConsultaJogosWidget({
    super.key,
    required this.docChampion,
  });

  final ChampionRecord? docChampion;

  @override
  State<ConsultaJogosWidget> createState() => _ConsultaJogosWidgetState();
}

class _ConsultaJogosWidgetState extends State<ConsultaJogosWidget> {
  late ConsultaJogosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultaJogosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConsultaJogos'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CONSULTA_JOGOS_ConsultaJogos_ON_INIT_STA');
      logFirebaseEvent('ConsultaJogos_backend_call');
      _model.checkFaseExists =
          await FaseRecord.getDocumentOnce(widget.docChampion!.idFase!);
      if (!(_model.checkFaseExists != null)) {
        logFirebaseEvent('ConsultaJogos_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Atenção!'),
              content: const Text('Fase do campeonato não existe'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('ConsultaJogos_navigate_back');
        context.safePop();
        return;
      }
      logFirebaseEvent('ConsultaJogos_update_page_state');
      setState(() {
        _model.onTerminate = true;
      });
    });

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
              logFirebaseEvent('CONSULTA_JOGOS_arrow_back_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '34rmen40' /* Consulta Partidas */,
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
          child: Visibility(
            visible: _model.onTerminate,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Imagem_2.jpeg',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(0.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 8.0, 5.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 550.0,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/fundo_transparente.png',
                                    ).image,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x371C4494),
                                      offset: Offset(0.0, 2.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 3.0,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<List<FaseRecord>>(
                                        stream: queryFaseRecord(
                                          queryBuilder: (faseRecord) =>
                                              faseRecord
                                                  .where(
                                                    'idChampion',
                                                    isEqualTo: widget
                                                        .docChampion?.reference,
                                                  )
                                                  .orderBy('orderFase'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 10.0,
                                                height: 10.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 10.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<FaseRecord>
                                              pageViewFaseRecordList =
                                              snapshot.data!;
                                          return SizedBox(
                                            width: double.infinity,
                                            height: 500.0,
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 40.0),
                                                  child: PageView.builder(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: min(
                                                                0,
                                                                pageViewFaseRecordList
                                                                        .length -
                                                                    1)),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        pageViewFaseRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        pageViewIndex) {
                                                      final pageViewFaseRecord =
                                                          pageViewFaseRecordList[
                                                              pageViewIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ug1gg483' /* Nome: */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      widget
                                                                          .docChampion
                                                                          ?.nomecampeonato,
                                                                      '0',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          30,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'n1f7pbxk' /* Fase: */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    pageViewFaseRecord
                                                                        .tituloFase
                                                                        .maybeHandleOverflow(
                                                                      maxChars:
                                                                          30,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'CONSULTA_JOGOS_PAGE_Icon_lxrx58g8_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_page_view');
                                                                    await _model
                                                                        .pageViewController
                                                                        ?.previousPage(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .chevron_left,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'CONSULTA_JOGOS_PAGE_Icon_5li6mjvi_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_page_view');
                                                                    await _model
                                                                        .pageViewController
                                                                        ?.nextPage(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              300),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .chevron_right,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 24.0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    5.0),
                                                            child: StreamBuilder<
                                                                ChampionRecord>(
                                                              stream: ChampionRecord
                                                                  .getDocument(widget
                                                                      .docChampion!
                                                                      .reference),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final progressBarChampionRecord =
                                                                    snapshot
                                                                        .data!;
                                                                return LinearPercentIndicator(
                                                                  percent:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    progressBarChampionRecord
                                                                            .qtdPartidaJogadas /
                                                                        progressBarChampionRecord
                                                                            .ultimaPartida,
                                                                    1.0,
                                                                  ),
                                                                  lineHeight:
                                                                      5.0,
                                                                  animation:
                                                                      true,
                                                                  animateFromLastPercent:
                                                                      true,
                                                                  progressColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  backgroundColor:
                                                                      const Color(
                                                                          0x3F558BF8),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: StreamBuilder<
                                                                List<
                                                                    JogosRecord>>(
                                                              stream:
                                                                  queryJogosRecord(
                                                                queryBuilder: (jogosRecord) =>
                                                                    jogosRecord
                                                                        .where(
                                                                          'idChampion',
                                                                          isEqualTo: widget
                                                                              .docChampion
                                                                              ?.reference,
                                                                        )
                                                                        .where(
                                                                          'idFase',
                                                                          isEqualTo:
                                                                              pageViewFaseRecord.reference,
                                                                        )
                                                                        .orderBy(
                                                                            'rodadaNumero')
                                                                        .orderBy(
                                                                            'mesaNumero'),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          10.0,
                                                                      height:
                                                                          10.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<JogosRecord>
                                                                    listViewJogosRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      listViewJogosRecordList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          listViewIndex) {
                                                                    final listViewJogosRecord =
                                                                        listViewJogosRecordList[
                                                                            listViewIndex];
                                                                    return Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          10.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            3.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.asset(
                                                                                'assets/images/fundodetela.png',
                                                                              ).image,
                                                                            ),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                offset: const Offset(0.0, 2.0),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              width: 3.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'hvintwgo' /* Rodada Nº */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    listViewJogosRecord.rodadaNumero.toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'kr8uvbtq' /* Grupo:  */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    listViewJogosRecord.grupoNome,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 3.0,
                                                                                      shape: const CircleBorder(),
                                                                                      child: Container(
                                                                                        width: 35.0,
                                                                                        height: 35.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              offset: const Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                        ),
                                                                                        child: Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: const BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: CachedNetworkImage(
                                                                                            fadeInDuration: const Duration(milliseconds: 500),
                                                                                            fadeOutDuration: const Duration(milliseconds: 500),
                                                                                            imageUrl: valueOrDefault<String>(
                                                                                              listViewJogosRecord.mandantePhoto,
                                                                                              'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                                                            ),
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 220.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewJogosRecord.mandanteNome.maybeHandleOverflow(
                                                                                                maxChars: 16,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.justify,
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 15.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 3.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: 50.0,
                                                                                        height: 35.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              offset: const Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Visibility(
                                                                                          visible: listViewJogosRecord.dataJogo != null,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewJogosRecord.mandanteGols.toString(),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    fontSize: 15.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(5.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 3.0,
                                                                                      shape: const CircleBorder(),
                                                                                      child: Container(
                                                                                        width: 35.0,
                                                                                        height: 35.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              offset: const Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                        ),
                                                                                        child: Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          clipBehavior: Clip.antiAlias,
                                                                                          decoration: const BoxDecoration(
                                                                                            shape: BoxShape.circle,
                                                                                          ),
                                                                                          child: CachedNetworkImage(
                                                                                            fadeInDuration: const Duration(milliseconds: 500),
                                                                                            fadeOutDuration: const Duration(milliseconds: 500),
                                                                                            imageUrl: valueOrDefault<String>(
                                                                                              listViewJogosRecord.visitantePhoto,
                                                                                              'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                                                            ),
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 220.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewJogosRecord.visitanteNome.maybeHandleOverflow(
                                                                                                maxChars: 16,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    fontSize: 15.0,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 3.0,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: 50.0,
                                                                                        height: 35.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 4.0,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              offset: const Offset(0.0, 2.0),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                        child: Visibility(
                                                                                          visible: listViewJogosRecord.dataJogo != null,
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              listViewJogosRecord.visitanteGols.toString(),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Poppins',
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    fontSize: 15.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
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
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 16.0),
                                                    child: smooth_page_indicator
                                                        .SmoothPageIndicator(
                                                      controller: _model
                                                              .pageViewController ??=
                                                          PageController(
                                                              initialPage: min(
                                                                  0,
                                                                  pageViewFaseRecordList
                                                                          .length -
                                                                      1)),
                                                      count:
                                                          pageViewFaseRecordList
                                                              .length,
                                                      axisDirection:
                                                          Axis.horizontal,
                                                      onDotClicked: (i) async {
                                                        await _model
                                                            .pageViewController!
                                                            .animateToPage(
                                                          i,
                                                          duration: const Duration(
                                                              milliseconds:
                                                                  500),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      effect: smooth_page_indicator
                                                          .ExpandingDotsEffect(
                                                        expansionFactor: 3.0,
                                                        spacing: 8.0,
                                                        radius: 16.0,
                                                        dotWidth: 8.0,
                                                        dotHeight: 8.0,
                                                        dotColor:
                                                            const Color(0x3F558BF8),
                                                        activeDotColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        paintStyle:
                                                            PaintingStyle.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
