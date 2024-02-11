import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/button_sheet/gerar_jogos/gerar_jogos_widget.dart';
import '/button_sheet/hekp_partidas/hekp_partidas_widget.dart';
import '/button_sheet/select_placar/select_placar_widget.dart';
import '/button_sheet/select_placar_copy2/select_placar_copy2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'partidas_model.dart';
export 'partidas_model.dart';

class PartidasWidget extends StatefulWidget {
  const PartidasWidget({
    super.key,
    required this.docChampion,
  });

  final ChampionRecord? docChampion;

  @override
  State<PartidasWidget> createState() => _PartidasWidgetState();
}

class _PartidasWidgetState extends State<PartidasWidget> {
  late PartidasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartidasModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Partidas'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PARTIDAS_PAGE_Partidas_ON_INIT_STATE');
      logFirebaseEvent('Partidas_backend_call');
      _model.checkFaseExists =
          await FaseRecord.getDocumentOnce(widget.docChampion!.idFase!);
      if (!(_model.checkFaseExists != null)) {
        logFirebaseEvent('Partidas_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('ATENÇÃO!'),
              content: const Text('Fase do campeonato não existe!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Ok'),
                ),
              ],
            );
          },
        );
        logFirebaseEvent('Partidas_navigate_back');
        context.safePop();
        return;
      }
      logFirebaseEvent('Partidas_update_page_state');
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
              logFirebaseEvent('PARTIDAS_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'bfruakq7' /* Manutenção das Partidas */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.help_outline,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('PARTIDAS_PAGE_help_outline_ICN_ON_TAP');
                logFirebaseEvent('IconButton_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: const Color(0x3F558BF8),
                  useSafeArea: true,
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
                          height: MediaQuery.sizeOf(context).height * 0.85,
                          child: const HekpPartidasWidget(),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
            ),
          ],
          centerTitle: false,
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
                                                          GerarJogosWidget(
                                                            key: Key(
                                                                'Keyz29_${pageViewIndex}_of_${pageViewFaseRecordList.length}'),
                                                            docChampion: widget
                                                                .docChampion!,
                                                            docFase:
                                                                pageViewFaseRecord,
                                                            actionFinalizar:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'PARTIDAS_Container_z29mzh12_CALLBACK');
                                                              logFirebaseEvent(
                                                                  'gerarJogos_page_view');
                                                              await _model
                                                                  .pageViewController
                                                                  ?.nextPage(
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
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
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'PARTIDAS_PAGE_Icon_4x6tamgb_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_page_view');
                                                                          await _model
                                                                              .pageViewController
                                                                              ?.previousPage(
                                                                            duration:
                                                                                const Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .chevron_left,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '3tjajvrh' /* Fase: */,
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
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        pageViewFaseRecord
                                                                            .tituloFase
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              30,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
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
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'PARTIDAS_PAGE_Icon_66keud7h_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_page_view');
                                                                          await _model
                                                                              .pageViewController
                                                                              ?.nextPage(
                                                                            duration:
                                                                                const Duration(milliseconds: 300),
                                                                            curve:
                                                                                Curves.ease,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .chevron_right,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                    ],
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.asset(
                                                                                'assets/images/fundodetela.png',
                                                                              ).image,
                                                                            ),
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
                                                                              SingleChildScrollView(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '4b6o7p23' /* Rodada Nº:  */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      fontSize: 13.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                listViewJogosRecord.rodadaNumero.toString(),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            listViewJogosRecord.grupoNome.maybeHandleOverflow(maxChars: 10),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '1dvhye2q' /* Mesa Nº: */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontSize: 13.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    listViewJogosRecord.mesaNumero.toString(),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      listViewJogosRecord.partida.toString(),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 100.0,
                                                                                                    height: 28.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        listViewJogosRecord.mandanteNome.maybeHandleOverflow(
                                                                                                          maxChars: 10,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 1.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  width: 94.0,
                                                                                                  height: 28.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: listViewJogosRecord.dataJogo != null ? FlutterFlowTheme.of(context).info : const Color(0x40558BF8),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                    children: [
                                                                                                      if (listViewJogosRecord.dataJogo != null)
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                          child: Text(
                                                                                                            listViewJogosRecord.mandanteGols.toString(),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      Text(
                                                                                                        FFLocalizations.of(context).getText(
                                                                                                          'nd8ek9e9' /* VS */,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                              fontWeight: FontWeight.w800,
                                                                                                              fontStyle: FontStyle.italic,
                                                                                                            ),
                                                                                                      ),
                                                                                                      if (listViewJogosRecord.dataJogo != null)
                                                                                                        Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            listViewJogosRecord.visitanteGols.toString(),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: 100.0,
                                                                                                height: 28.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
                                                                                                  child: Text(
                                                                                                    listViewJogosRecord.visitanteNome.maybeHandleOverflow(
                                                                                                      maxChars: 10,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if ((currentUserReference == widget.docChampion?.administrador) || (valueOrDefault(currentUserDocument?.assinatura, 0) == 4))
                                                                                                AuthUserStreamWidget(
                                                                                                  builder: (context) => FlutterFlowIconButton(
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.scoreboard_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('PARTIDAS_scoreboard_outlined_ICN_ON_TAP');
                                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        barrierColor: const Color(0x3F558BF8),
                                                                                                        enableDrag: false,
                                                                                                        useSafeArea: true,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: SizedBox(
                                                                                                                height: MediaQuery.sizeOf(context).height * 0.35,
                                                                                                                child: SelectPlacarWidget(
                                                                                                                  docChampion: widget.docChampion!,
                                                                                                                  docJogo: listViewJogosRecord,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              if ((currentUserReference == widget.docChampion?.administrador) || (valueOrDefault(currentUserDocument?.assinatura, 0) == 4))
                                                                                                AuthUserStreamWidget(
                                                                                                  builder: (context) => FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.mode_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      logFirebaseEvent('PARTIDAS_PAGE_mode_outlined_ICN_ON_TAP');
                                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        barrierColor: const Color(0x3F558BF8),
                                                                                                        enableDrag: false,
                                                                                                        useSafeArea: true,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return GestureDetector(
                                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                                            child: Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: SizedBox(
                                                                                                                height: MediaQuery.sizeOf(context).height * 0.35,
                                                                                                                child: SelectPlacarCopy2Widget(
                                                                                                                  docChampion: widget.docChampion!,
                                                                                                                  docJogo: listViewJogosRecord,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                            ],
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
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          if ((widget.docChampion
                                                                      ?.administrador ==
                                                                  currentUserReference) ||
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.assinatura,
                                                                      0) ==
                                                                  4))
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          5.0),
                                                              child:
                                                                  AuthUserStreamWidget(
                                                                builder:
                                                                    (context) =>
                                                                        Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    if ((widget.docChampion?.administrador ==
                                                                            currentUserReference) ||
                                                                        (valueOrDefault(currentUserDocument?.assinatura,
                                                                                0) ==
                                                                            4))
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'PARTIDAS_PAGE_DELETE_JOGOS\n_BTN_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Button_alert_dialog');
                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: const Text('ATENÇÃO!'),
                                                                                    content: const Text('Deseja remover os jogos desta FASE?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: const Text('Não'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: const Text('Sim'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              ) ??
                                                                              false;
                                                                          if (confirmDialogResponse) {
                                                                            logFirebaseEvent('Button_firestore_query');
                                                                            _model.listaJogosCampeonatoFase =
                                                                                await queryJogosRecordOnce(
                                                                              queryBuilder: (jogosRecord) => jogosRecord
                                                                                  .where(
                                                                                    'idChampion',
                                                                                    isEqualTo: widget.docChampion?.reference,
                                                                                  )
                                                                                  .where(
                                                                                    'idFase',
                                                                                    isEqualTo: pageViewFaseRecord.reference,
                                                                                  ),
                                                                            );
                                                                            logFirebaseEvent('Button_update_page_state');
                                                                            setState(() {
                                                                              _model.index = 0;
                                                                            });
                                                                            while (_model.index <
                                                                                _model.listaJogosCampeonatoFase!.length) {
                                                                              logFirebaseEvent('Button_backend_call');
                                                                              await _model.listaJogosCampeonatoFase![_model.index].reference.delete();
                                                                              logFirebaseEvent('Button_update_page_state');
                                                                              setState(() {
                                                                                _model.index = _model.index + 1;
                                                                              });
                                                                            }
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await pageViewFaseRecord.reference.update(createFaseRecordData(
                                                                              status: 0,
                                                                            ));
                                                                            logFirebaseEvent('Button_firestore_query');
                                                                            _model.docFaseAnterior =
                                                                                await queryFaseRecordOnce(
                                                                              queryBuilder: (faseRecord) => faseRecord
                                                                                  .where(
                                                                                    'idChampion',
                                                                                    isEqualTo: widget.docChampion?.reference,
                                                                                  )
                                                                                  .where(
                                                                                    'orderFase',
                                                                                    isLessThan: pageViewFaseRecord.orderFase,
                                                                                  )
                                                                                  .orderBy('orderFase', descending: true),
                                                                              singleRecord: true,
                                                                            ).then((s) => s.firstOrNull);
                                                                            if (_model.docFaseAnterior !=
                                                                                null) {
                                                                              logFirebaseEvent('Button_backend_call');

                                                                              await _model.docFaseAnterior!.reference.update({
                                                                                ...createFaseRecordData(
                                                                                  status: 1,
                                                                                ),
                                                                                ...mapToFirestore(
                                                                                  {
                                                                                    'dataEncerramento': FieldValue.delete(),
                                                                                  },
                                                                                ),
                                                                              });
                                                                            }
                                                                            logFirebaseEvent('Button_firestore_query');
                                                                            _model.totalDeJogos =
                                                                                await queryJogosRecordCount(
                                                                              queryBuilder: (jogosRecord) => jogosRecord.where(
                                                                                'idChampion',
                                                                                isEqualTo: widget.docChampion?.reference,
                                                                              ),
                                                                            );
                                                                            logFirebaseEvent('Button_backend_call');

                                                                            await widget.docChampion!.reference.update(createChampionRecordData(
                                                                              ultimaPartida: _model.totalDeJogos,
                                                                              qtdPartidaJogadas: _model.totalDeJogos,
                                                                              dataAtualizao: getCurrentTimestamp,
                                                                              status: 3,
                                                                            ));
                                                                            logFirebaseEvent('Button_alert_dialog');
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: const Text('Jogos removidos com sucesso!'),
                                                                                  content: const Text('Status da fase reiniciado.'),
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

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        text: FFLocalizations.of(context)
                                                                            .getText(
                                                                          'iwi6hdgd' /* Delete Jogos
 */
                                                                          ,
                                                                        ),
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .delete_outline_sharp,
                                                                          color:
                                                                              Color(0xFFE21C3D),
                                                                          size:
                                                                              22.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              40.0,
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              const Color(0x40558BF8),
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: const Color(0xFFE21C3D),
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'PARTIDAS_PAGE_LIBERA_SUMULA_BTN_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        await widget
                                                                            .docChampion!
                                                                            .reference
                                                                            .update(createChampionRecordData(
                                                                          status:
                                                                              5,
                                                                          dataAtualizao:
                                                                              getCurrentTimestamp,
                                                                        ));
                                                                        logFirebaseEvent(
                                                                            'Button_navigate_to');

                                                                        context.pushNamed(
                                                                            'ConsultaChampion');
                                                                      },
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2dj5aff2' /* Libera Sumula */,
                                                                      ),
                                                                      icon:
                                                                          const FaIcon(
                                                                        FontAwesomeIcons
                                                                            .pencilAlt,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            40.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.white,
                                                                            ),
                                                                        elevation:
                                                                            3.0,
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
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
