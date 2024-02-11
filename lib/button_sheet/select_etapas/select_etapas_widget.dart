import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'select_etapas_model.dart';
export 'select_etapas_model.dart';

class SelectEtapasWidget extends StatefulWidget {
  const SelectEtapasWidget({
    super.key,
    required this.paramRanking,
  });

  final RankingRecord? paramRanking;

  @override
  State<SelectEtapasWidget> createState() => _SelectEtapasWidgetState();
}

class _SelectEtapasWidgetState extends State<SelectEtapasWidget> {
  late SelectEtapasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectEtapasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
        child: Material(
          color: Colors.transparent,
          elevation: 3.0,
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
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: FlutterFlowTheme.of(context).info,
                  offset: const Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).info,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            logFirebaseEvent(
                                'SELECT_ETAPAS_COMP_Icon_hvw7sq3f_ON_TAP');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.keyboard_return_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vsxu10j7' /* Selecione as Etapas */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 22.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      color: FlutterFlowTheme.of(context).info,
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
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
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).info,
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder<List<ChampionRecord>>(
                              stream: queryChampionRecord(
                                queryBuilder: (championRecord) => championRecord
                                    .where(
                                      'idModalidade',
                                      isEqualTo:
                                          widget.paramRanking?.idModalidade,
                                    )
                                    .where(
                                      'Tipo_torneio',
                                      isEqualTo:
                                          widget.paramRanking?.tipoTorneio,
                                    ),
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
                                            FlutterFlowTheme.of(context).info,
                                        size: 10.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ChampionRecord>
                                    listViewChampionRecordList = snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewChampionRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewChampionRecord =
                                        listViewChampionRecordList[
                                            listViewIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                  checkboxTheme:
                                                      CheckboxThemeData(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  unselectedWidgetColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                ),
                                                child: Checkbox(
                                                  value: _model
                                                              .checkboxCalcRankingValueMap[
                                                          listViewChampionRecord] ??=
                                                      listViewChampionRecord
                                                          .calcRanking,
                                                  onChanged: (newValue) async {
                                                    setState(() => _model
                                                                .checkboxCalcRankingValueMap[
                                                            listViewChampionRecord] =
                                                        newValue!);
                                                    if (newValue!) {
                                                      logFirebaseEvent(
                                                          'SELECT_ETAPAS_CheckboxCalcRanking_ON_TOG');
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_backend_call');

                                                      await listViewChampionRecord
                                                          .reference
                                                          .update(
                                                              createChampionRecordData(
                                                        calcRanking: true,
                                                      ));
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_firestore_query');
                                                      _model.listachampiongeral =
                                                          await queryChampionTotalGeralRecordOnce(
                                                        parent:
                                                            listViewChampionRecord
                                                                .reference,
                                                        queryBuilder: (championTotalGeralRecord) =>
                                                            championTotalGeralRecord
                                                                .orderBy(
                                                                    'campeonatoPosicao')
                                                                .orderBy(
                                                                    'totalPontos',
                                                                    descending:
                                                                        true),
                                                      );
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_firestore_query');
                                                      _model.queryParticipantes =
                                                          await queryUserRecordOnce(
                                                        queryBuilder: (userRecord) =>
                                                            userRecord.whereIn(
                                                                'uid',
                                                                listViewChampionRecord
                                                                    .participante
                                                                    .map((e) =>
                                                                        e.id)
                                                                    .toList()),
                                                      );
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_firestore_query');
                                                      _model.queryConfigPontos =
                                                          await queryConfiguraPontosRecordOnce(
                                                        parent: widget
                                                            .paramRanking
                                                            ?.reference,
                                                        queryBuilder: (configuraPontosRecord) =>
                                                            configuraPontosRecord
                                                                .orderBy(
                                                                    'Colocacao')
                                                                .orderBy(
                                                                    'Qtdade_Pontos',
                                                                    descending:
                                                                        true),
                                                      );
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .qtddChampionTotalGeral =
                                                            _model
                                                                .listachampiongeral!
                                                                .length;
                                                      });
                                                      while (FFAppState()
                                                              .qtddChampionTotalGeral >
                                                          0) {
                                                        logFirebaseEvent(
                                                            'CheckboxCalcRanking_backend_call');

                                                        await RankingPontosRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createRankingPontosRecordData(
                                                              pontosNoCampeonato: _model
                                                                  .listachampiongeral
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .listachampiongeral?[
                                                                              functions.encontrarIndexPelaQtd(FFAppState().qtddChampionTotalGeral)]
                                                                          .idParticipante ==
                                                                      e.idParticipante)
                                                                  .toList()
                                                                  .first
                                                                  .totalPontos,
                                                              nomeParticipante: _model
                                                                  .queryParticipantes
                                                                  ?.where((e) =>
                                                                      e.reference ==
                                                                      _model
                                                                          .listachampiongeral?[
                                                                              functions.encontrarIndexPelaQtd(FFAppState().qtddChampionTotalGeral)]
                                                                          .idParticipante)
                                                                  .toList()
                                                                  .first
                                                                  .displayName,
                                                              clubeParticipante: _model
                                                                  .queryParticipantes
                                                                  ?.where((e) =>
                                                                      e.reference ==
                                                                      _model
                                                                          .listachampiongeral?[
                                                                              functions.encontrarIndexPelaQtd(FFAppState().qtddChampionTotalGeral)]
                                                                          .idParticipante)
                                                                  .toList()
                                                                  .first
                                                                  .nomeClub,
                                                              nomeModalidade:
                                                                  listViewChampionRecord
                                                                      .modalidadeTorneio,
                                                              federacaoParticipante: _model
                                                                  .queryParticipantes
                                                                  ?.where((e) =>
                                                                      e.reference ==
                                                                      _model
                                                                          .listachampiongeral?[
                                                                              functions.encontrarIndexPelaQtd(FFAppState().qtddChampionTotalGeral)]
                                                                          .idParticipante)
                                                                  .toList()
                                                                  .first
                                                                  .nomeFederer,
                                                              pontos: _model
                                                                  .queryConfigPontos?[
                                                                      functions.encontrarIndexPelaQtd(
                                                                          FFAppState()
                                                                              .qtddChampionTotalGeral)]
                                                                  .qtdadePontos,
                                                              colocacao: _model
                                                                  .queryConfigPontos?[
                                                                      functions.encontrarIndexPelaQtd(
                                                                          FFAppState()
                                                                              .qtddChampionTotalGeral)]
                                                                  .colocacao,
                                                              idModalidade:
                                                                  listViewChampionRecord
                                                                      .idModalidade,
                                                              idClube:
                                                                  listViewChampionRecord
                                                                      .idClube,
                                                              idFederations:
                                                                  listViewChampionRecord
                                                                      .idFederation,
                                                              idRanking: widget
                                                                  .paramRanking
                                                                  ?.reference,
                                                              idChampion:
                                                                  listViewChampionRecord
                                                                      .reference,
                                                              idParticipante: _model
                                                                  .listachampiongeral
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .listachampiongeral?[
                                                                              functions.encontrarIndexPelaQtd(FFAppState().qtddChampionTotalGeral)]
                                                                          .idParticipante ==
                                                                      e.idParticipante)
                                                                  .toList()
                                                                  .first
                                                                  .idParticipante,
                                                              fotoParticipante: _model
                                                                  .listachampiongeral
                                                                  ?.where((e) =>
                                                                      _model
                                                                          .listachampiongeral?[
                                                                              functions.encontrarIndexPelaQtd(FFAppState().qtddChampionTotalGeral)]
                                                                          .idParticipante ==
                                                                      e.idParticipante)
                                                                  .toList()
                                                                  .first
                                                                  .participantePhoto,
                                                            ));
                                                        logFirebaseEvent(
                                                            'CheckboxCalcRanking_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .qtddChampionTotalGeral =
                                                              FFAppState()
                                                                      .qtddChampionTotalGeral +
                                                                  -1;
                                                        });
                                                      }
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                            .qtddChampionTotalGeral = 0;
                                                      });

                                                      setState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'SELECT_ETAPAS_CheckboxCalcRanking_ON_TOG');
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_backend_call');

                                                      await listViewChampionRecord
                                                          .reference
                                                          .update(
                                                              createChampionRecordData(
                                                        calcRanking: false,
                                                      ));
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_firestore_query');
                                                      _model.queryRankingPontos00 =
                                                          await queryRankingPontosRecordOnce(
                                                        queryBuilder:
                                                            (rankingPontosRecord) =>
                                                                rankingPontosRecord
                                                                    .where(
                                                                      'id_Ranking',
                                                                      isEqualTo: widget
                                                                          .paramRanking
                                                                          ?.reference,
                                                                    )
                                                                    .where(
                                                                      'id_Champion',
                                                                      isEqualTo:
                                                                          listViewChampionRecord
                                                                              .reference,
                                                                    ),
                                                      );
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                                .qtddChampionTotalGeral =
                                                            _model
                                                                .queryRankingPontos00!
                                                                .length;
                                                      });
                                                      while (FFAppState()
                                                              .qtddChampionTotalGeral >
                                                          0) {
                                                        logFirebaseEvent(
                                                            'CheckboxCalcRanking_backend_call');
                                                        await _model
                                                            .queryRankingPontos00![
                                                                functions.encontrarIndexPelaQtd(
                                                                    FFAppState()
                                                                        .qtddChampionTotalGeral)]
                                                            .reference
                                                            .delete();
                                                        logFirebaseEvent(
                                                            'CheckboxCalcRanking_update_app_state');
                                                        setState(() {
                                                          FFAppState()
                                                                  .qtddChampionTotalGeral =
                                                              FFAppState()
                                                                      .qtddChampionTotalGeral +
                                                                  -1;
                                                        });
                                                      }
                                                      logFirebaseEvent(
                                                          'CheckboxCalcRanking_update_app_state');
                                                      setState(() {
                                                        FFAppState()
                                                            .qtddChampionTotalGeral = 0;
                                                      });

                                                      setState(() {});
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  listViewChampionRecord
                                                      .nomecampeonato
                                                      .maybeHandleOverflow(
                                                    maxChars: 15,
                                                    replacement: '…',
                                                  ),
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (listViewChampionRecord
                                                      .calcRanking ==
                                                  true)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'SELECT_ETAPAS_COMP_Icon_0k9luowk_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Icon_update_component_state');
                                                      setState(() {
                                                        _model.docChampionSelected =
                                                            listViewChampionRecord;
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.image_search,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (_model.docChampionSelected != null)
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            offset: const Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: StreamBuilder<
                                          List<RankingPontosRecord>>(
                                        stream: queryRankingPontosRecord(
                                          queryBuilder: (rankingPontosRecord) =>
                                              rankingPontosRecord
                                                  .where(
                                                    'id_Ranking',
                                                    isEqualTo: widget
                                                        .paramRanking
                                                        ?.reference,
                                                  )
                                                  .where(
                                                    'id_Champion',
                                                    isEqualTo: _model
                                                        .docChampionSelected
                                                        ?.reference,
                                                  )
                                                  .orderBy('Colocacao'),
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
                                          List<RankingPontosRecord>
                                              columnRankingPontosRecordList =
                                              snapshot.data!;
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SELECT_ETAPAS_Column_vnqw3nov_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_firestore_query');
                                              await queryRankingPontosRecordOnce();
                                            },
                                            child: SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    columnRankingPontosRecordList
                                                        .length, (columnIndex) {
                                                  final columnRankingPontosRecord =
                                                      columnRankingPontosRecordList[
                                                          columnIndex];
                                                  return Row(
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
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              columnRankingPontosRecord
                                                                  .colocacao
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                  ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '3hmaja9i' /* º */,
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
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                columnRankingPontosRecord
                                                                    .nomeParticipante
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 19,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                columnRankingPontosRecord
                                                                    .pontos
                                                                    .toString(),
                                                                '0',
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
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 50.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: FFLocalizations.of(context).getText(
                            'rsckt6x4' /* Salvar */,
                          ),
                          icon: const Icon(
                            Icons.save_outlined,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).info,
                            textStyle: FlutterFlowTheme.of(context)
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
                            borderRadius: BorderRadius.circular(8.0),
                          ),
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
    );
  }
}
