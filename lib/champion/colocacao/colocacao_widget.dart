import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/button_sheet/help_final/help_final_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'colocacao_model.dart';
export 'colocacao_model.dart';

class ColocacaoWidget extends StatefulWidget {
  const ColocacaoWidget({
    super.key,
    required this.championfinal,
  });

  final ChampionRecord? championfinal;

  @override
  State<ColocacaoWidget> createState() => _ColocacaoWidgetState();
}

class _ColocacaoWidgetState extends State<ColocacaoWidget> {
  late ColocacaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColocacaoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'colocacao'});
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
              logFirebaseEvent('COLOCACAO_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'vdsw9pfi' /* Posicionamento */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('COLOCACAO_PAGE_Icon_vv2tqd4i_ON_TAP');
                  logFirebaseEvent('Icon_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: const Color(0x40558BF8),
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
                            child: const HelpFinalWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Icon(
                  Icons.help_outline_sharp,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
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
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: double.infinity,
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
                                    color: Color(0x71FFFFFF),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 3.0,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 5.0, 8.0, 10.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 2.0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              bottomRight: Radius.circular(6.0),
                                              topLeft: Radius.circular(25.0),
                                              topRight: Radius.circular(25.0),
                                            ),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  offset: const Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(6.0),
                                                topLeft: Radius.circular(25.0),
                                                topRight: Radius.circular(25.0),
                                              ),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'g10yxap5' /* Colocação Final */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: StreamBuilder<
                                              List<ChampionTotalGeralRecord>>(
                                            stream:
                                                queryChampionTotalGeralRecord(
                                              parent: widget
                                                  .championfinal?.reference,
                                              queryBuilder:
                                                  (championTotalGeralRecord) =>
                                                      championTotalGeralRecord
                                                          .orderBy(
                                                              'campeonatoPosicao')
                                                          .orderBy(
                                                              'totalPontos',
                                                              descending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 10.0,
                                                    height: 10.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 10.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<ChampionTotalGeralRecord>
                                                  columnChampionTotalGeralRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                      columnChampionTotalGeralRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnChampionTotalGeralRecord =
                                                        columnChampionTotalGeralRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(5.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 3.0,
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
                                                          height: 42.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/fundodetela.png',
                                                              ).image,
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '${valueOrDefault<String>(
                                                                        functions
                                                                            .indexPlusOneToString(columnIndex),
                                                                        '0',
                                                                      )}º',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: 35.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                  ),
                                                                ),
                                                                child: InkWell(
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
                                                                        'COLOCACAO_CircleImage_ymp4wpx7_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'CircleImage_expand_image');
                                                                    await Navigator
                                                                        .push(
                                                                      context,
                                                                      PageTransition(
                                                                        type: PageTransitionType
                                                                            .fade,
                                                                        child:
                                                                            FlutterFlowExpandedImageView(
                                                                          image:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                valueOrDefault<String>(
                                                                              columnChampionTotalGeralRecord.participantePhoto,
                                                                              'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                          allowRotation:
                                                                              false,
                                                                          tag: valueOrDefault<
                                                                              String>(
                                                                            columnChampionTotalGeralRecord.participantePhoto,
                                                                            'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png' '$columnIndex',
                                                                          ),
                                                                          useHeroAnimation:
                                                                              true,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Hero(
                                                                    tag: valueOrDefault<
                                                                        String>(
                                                                      columnChampionTotalGeralRecord
                                                                          .participantePhoto,
                                                                      'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png' '$columnIndex',
                                                                    ),
                                                                    transitionOnUserGestures:
                                                                        true,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          columnChampionTotalGeralRecord
                                                                              .participantePhoto,
                                                                          'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
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
                                                                        columnChampionTotalGeralRecord
                                                                            .participanteNome
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              25,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge,
                                                                      ),
                                                                      Text(
                                                                        columnChampionTotalGeralRecord
                                                                            .totalPontos
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).info,
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
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if ((currentUserReference ==
                              widget.championfinal?.administrador) &&
                          (widget.championfinal?.status != 6))
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                width: double.infinity,
                                height: 60.0,
                                constraints: const BoxConstraints(
                                  maxWidth: 550.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/fundodetela.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 3.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    if ((currentUserReference ==
                                            widget.championfinal
                                                ?.administrador) ||
                                        (valueOrDefault(
                                                currentUserDocument?.assinatura,
                                                0) ==
                                            4))
                                      AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'COLOCACAO_FINAL_CAMPEONATO_BTN_ON_TAP');
                                            var shouldSetState = false;
                                            if ((widget.championfinal
                                                        ?.tipoTorneio ==
                                                    valueOrDefault<String>(
                                                      widget.championfinal
                                                          ?.tipoTorneio,
                                                      'Treino',
                                                    )) ||
                                                (widget.championfinal
                                                        ?.tipoTorneio ==
                                                    valueOrDefault<String>(
                                                      widget.championfinal
                                                          ?.tipoTorneio,
                                                      'Aberto',
                                                    ))) {
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.confrontoGravado =
                                                  await actions
                                                      .gravarUserConfronto(
                                                widget.championfinal,
                                              );
                                              shouldSetState = true;
                                              if (_model.confrontoGravado !=
                                                      null &&
                                                  _model.confrontoGravado !=
                                                      '') {
                                                logFirebaseEvent(
                                                    'Button_show_snack_bar');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      _model.confrontoGravado!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .info,
                                                  ),
                                                );
                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                                return;
                                              }
                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              await widget
                                                  .championfinal!.reference
                                                  .update(
                                                      createChampionRecordData(
                                                status: 6,
                                                dataAtualizao:
                                                    getCurrentTimestamp,
                                                dataEncerramento:
                                                    getCurrentTimestamp,
                                              ));
                                              logFirebaseEvent(
                                                  'Button_firestore_query');
                                              _model.queryChampionTotalGeral =
                                                  await queryChampionTotalGeralRecordOnce(
                                                parent: widget
                                                    .championfinal?.reference,
                                                queryBuilder:
                                                    (championTotalGeralRecord) =>
                                                        championTotalGeralRecord
                                                            .orderBy(
                                                                'totalPontos',
                                                                descending:
                                                                    true)
                                                            .orderBy(
                                                                'campeonatoPosicao'),
                                              );
                                              shouldSetState = true;
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                        .qtddChampionTotalGeral =
                                                    _model
                                                        .queryChampionTotalGeral!
                                                        .length;
                                              });
                                              while (FFAppState()
                                                      .qtddChampionTotalGeral >
                                                  0) {
                                                logFirebaseEvent(
                                                    'Button_backend_call');

                                                await _model
                                                    .queryChampionTotalGeral![functions
                                                        .encontrarIndexPelaQtd(
                                                            FFAppState()
                                                                .qtddChampionTotalGeral)]
                                                    .reference
                                                    .update(
                                                        createChampionTotalGeralRecordData(
                                                  campeonatoPosicao: functions
                                                      .indexPlusOneToInteger(functions
                                                          .encontrarIndexPelaQtd(
                                                              FFAppState()
                                                                  .qtddChampionTotalGeral)),
                                                ));
                                                logFirebaseEvent(
                                                    'Button_update_app_state');
                                                setState(() {
                                                  FFAppState()
                                                          .qtddChampionTotalGeral =
                                                      FFAppState()
                                                              .qtddChampionTotalGeral +
                                                          -1;
                                                });
                                              }
                                              logFirebaseEvent(
                                                  'Button_update_app_state');
                                              setState(() {
                                                FFAppState()
                                                    .qtddChampionTotalGeral = 0;
                                              });
                                              logFirebaseEvent(
                                                  'Button_navigate_back');
                                              context.safePop();
                                            }
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'ujqyzi7f' /* Final Campeonato */,
                                          ),
                                          icon: const Icon(
                                            Icons.emoji_events_outlined,
                                            size: 20.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        '60s4vigl' /* Colocação
 */
                                        ,
                                      ),
                                      icon: const Icon(
                                        Icons.engineering,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
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
    );
  }
}
