import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gerar_jogos_model.dart';
export 'gerar_jogos_model.dart';

class GerarJogosWidget extends StatefulWidget {
  const GerarJogosWidget({
    super.key,
    required this.docChampion,
    required this.docFase,
    this.actionFinalizar,
  });

  final ChampionRecord? docChampion;
  final FaseRecord? docFase;
  final Future Function()? actionFinalizar;

  @override
  State<GerarJogosWidget> createState() => _GerarJogosWidgetState();
}

class _GerarJogosWidgetState extends State<GerarJogosWidget> {
  late GerarJogosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GerarJogosModel());

    _model.tfQtdMesasController ??= TextEditingController(
        text: (widget.docChampion!.participante.length ~/ 2).toString());
    _model.tfQtdMesasFocusNode ??= FocusNode();

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

    return Visibility(
      visible: widget.docChampion?.administrador == currentUserReference,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 10.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.docChampion?.nomecampeonato,
                    '**',
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          if ((widget.docChampion?.administrador == currentUserReference) &&
              (widget.docFase!.status < 2))
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: FlutterFlowDropDown<int>(
                            controller: _model.ddOpcaoModoValueController ??=
                                FormFieldController<int>(
                              _model.ddOpcaoModoValue ??= 1,
                            ),
                            options: List<int>.from([1, 2, 3]),
                            optionLabels: [
                              FFLocalizations.of(context).getText(
                                'j2fvy58n' /* Jogos do mesmo grupo */,
                              ),
                              FFLocalizations.of(context).getText(
                                'pvjymzet' /* Jogos de grupos distintos */,
                              ),
                              FFLocalizations.of(context).getText(
                                'geymwydt' /* Todos contra todos */,
                              )
                            ],
                            onChanged: (val) =>
                                setState(() => _model.ddOpcaoModoValue = val),
                            width: 300.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '99wpcdbd' /* Selecione um modo... */,
                            ),
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).info,
                              size: 24.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context).accent4,
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).info,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ysjvd9yx' /* Qtd. de mesas */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: SizedBox(
                              width: 56.0,
                              child: TextFormField(
                                controller: _model.tfQtdMesasController,
                                focusNode: _model.tfQtdMesasFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                validator: _model.tfQtdMesasControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 5.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'GERAR_JOGOS_COMP_GERAR_JOGOS_BTN_ON_TAP');
                              var shouldSetState = false;
                              if (!(_model.ddOpcaoModoValue != null)) {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('ATENÇÃO!'),
                                      content: const Text(
                                          'Selecione o modo de criação de jogos!'),
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
                              }
                              if (!(_model.tfQtdMesasController.text != '')) {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('ATENÇÃO!'),
                                      content: const Text(
                                          'Informe a quantidade de mesas.'),
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
                              }
                              if (_model.ddOpcaoModoValue == 1) {
                                logFirebaseEvent('Button_custom_action');
                                await actions.criarJogosMesmoGrupoTipo1(
                                  widget.docChampion,
                                  widget.docFase,
                                  int.parse(_model.tfQtdMesasController.text),
                                );
                              } else if (_model.ddOpcaoModoValue == 2) {
                                logFirebaseEvent('Button_custom_action');
                                await actions.criarJogosGrupoDestintosTipo2(
                                  widget.docChampion,
                                  widget.docFase,
                                  int.parse(_model.tfQtdMesasController.text),
                                );
                              } else if (_model.ddOpcaoModoValue == 3) {
                                logFirebaseEvent('Button_custom_action');
                                await actions.criarJogosTodosContraTodosTipo3(
                                  widget.docChampion,
                                  widget.docFase,
                                  int.parse(_model.tfQtdMesasController.text),
                                );
                              } else {
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: const Text('ATENÇÃO:'),
                                      content: const Text('Selecione um das opções.'),
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
                              }

                              logFirebaseEvent('Button_backend_call');

                              await widget.docFase!.reference
                                  .update(createFaseRecordData(
                                status: 1,
                              ));
                              logFirebaseEvent('Button_backend_call');
                              _model.totalDeJogos2 =
                                  await ChampionRecord.getDocumentOnce(
                                      widget.docChampion!.reference);
                              shouldSetState = true;
                              logFirebaseEvent('Button_backend_call');

                              await widget.docChampion!.reference
                                  .update(createChampionRecordData(
                                status: 4,
                                dataAtualizao: getCurrentTimestamp,
                              ));
                              logFirebaseEvent('Button_firestore_query');
                              _model.nomeParticip =
                                  await queryParticipanteRecordOnce(
                                queryBuilder: (participanteRecord) =>
                                    participanteRecord
                                        .where(
                                          'idChampion',
                                          isEqualTo:
                                              widget.docChampion?.reference,
                                        )
                                        .where(
                                          'idFase',
                                          isEqualTo: widget.docFase?.reference,
                                        ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              shouldSetState = true;
                              logFirebaseEvent('Button_backend_call');

                              await _model.nomeParticip!.reference
                                  .update(createParticipanteRecordData(
                                tituloFase: widget.docFase?.tituloFase,
                              ));
                              logFirebaseEvent('Button_navigate_to');
                              if (Navigator.of(context).canPop()) {
                                context.pop();
                              }
                              context.pushNamed(
                                'Partidas',
                                queryParameters: {
                                  'docChampion': serializeParam(
                                    widget.docChampion,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'docChampion': widget.docChampion,
                                },
                              );

                              if (shouldSetState) setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'tzo31f3m' /* Gerar Jogos */,
                            ),
                            icon: const Icon(
                              Icons.replay_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).info,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              elevation: 2.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'GERAR_JOGOS_COMP_TESTE_BTN_ON_TAP');
                                var shouldSetState = false;
                                if (!(_model.ddOpcaoModoValue != null)) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('ATENÇÃO!'),
                                        content: const Text(
                                            'Selecione o modo de criação de jogos!'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                                if (!(_model.tfQtdMesasController.text != '')) {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('ATENÇÃO!'),
                                        content: const Text(
                                            'Informe a quantidade de mesas.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) setState(() {});
                                  return;
                                }
                                if (_model.ddOpcaoModoValue == 1) {
                                  logFirebaseEvent('Button_custom_action');
                                  await actions.criaJogosNaFase(
                                    widget.docChampion!,
                                    widget.docFase!,
                                    _model.ddOpcaoModoValue!,
                                    int.parse(_model.tfQtdMesasController.text),
                                  );
                                } else if (_model.ddOpcaoModoValue == 2) {
                                  logFirebaseEvent('Button_custom_action');
                                  await actions.criarJogosGrupoDestintosTipo2(
                                    widget.docChampion,
                                    widget.docFase,
                                    int.parse(_model.tfQtdMesasController.text),
                                  );
                                } else if (_model.ddOpcaoModoValue == 3) {
                                  logFirebaseEvent('Button_custom_action');
                                  await actions.criarJogosTodosContraTodosTipo3(
                                    widget.docChampion,
                                    widget.docFase,
                                    int.parse(_model.tfQtdMesasController.text),
                                  );
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('ATENÇÃO:'),
                                        content:
                                            const Text('Selecione um das opções.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  if (shouldSetState) setState(() {});
                                  return;
                                }

                                logFirebaseEvent('Button_backend_call');

                                await widget.docFase!.reference
                                    .update(createFaseRecordData(
                                  status: 1,
                                ));
                                logFirebaseEvent('Button_backend_call');
                                _model.totalDeJogos4 =
                                    await ChampionRecord.getDocumentOnce(
                                        widget.docChampion!.reference);
                                shouldSetState = true;
                                logFirebaseEvent('Button_backend_call');

                                await widget.docChampion!.reference
                                    .update(createChampionRecordData(
                                  status: 4,
                                  dataAtualizao: getCurrentTimestamp,
                                ));
                                logFirebaseEvent('Button_navigate_to');
                                if (Navigator.of(context).canPop()) {
                                  context.pop();
                                }
                                context.pushNamed(
                                  'Partidas',
                                  queryParameters: {
                                    'docChampion': serializeParam(
                                      widget.docChampion,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'docChampion': widget.docChampion,
                                  },
                                );

                                if (shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                '57rx12hg' /* teste */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFF94811C),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                elevation: 2.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          if (widget.docFase?.status == 1)
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('GERAR_JOGOS_FINALIZAR_FASE_BTN_ON_TAP');
                      var shouldSetState = false;
                      logFirebaseEvent('Button_custom_action');
                      _model.totalSemConferir =
                          await actions.verificaJogosForamEncerrados(
                        widget.docChampion?.reference,
                        widget.docFase?.reference,
                      );
                      shouldSetState = true;
                      if (_model.totalSemConferir! > 0) {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title:
                                  const Text('Termine de preencher os resultados!'),
                              content: Text(
                                  'ENCONTROU: ${_model.totalSemConferir?.toString()}'),
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
                      }
                      logFirebaseEvent('Button_update_component_state');
                      setState(() {
                        _model.indexA = 0;
                        _model.indexB = 0;
                      });
                      logFirebaseEvent('Button_firestore_query');
                      _model.proximaFase = await queryFaseRecordOnce(
                        queryBuilder: (faseRecord) => faseRecord
                            .where(
                              'idChampion',
                              isEqualTo: widget.docChampion?.reference,
                            )
                            .where(
                              'orderFase',
                              isEqualTo: widget.docFase!.orderFase + 1,
                            ),
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      shouldSetState = true;
                      if (_model.proximaFase != null) {
                        logFirebaseEvent('Button_firestore_query');
                        _model.participanteProximaFase =
                            await queryParticipanteRecordOnce(
                          queryBuilder: (participanteRecord) =>
                              participanteRecord
                                  .where(
                                    'idChampion',
                                    isEqualTo: widget.docChampion?.reference,
                                  )
                                  .where(
                                    'idFase',
                                    isEqualTo: _model.proximaFase?.reference,
                                  ),
                        );
                        shouldSetState = true;
                        while (_model.indexA <
                            _model.participanteProximaFase!.length) {
                          logFirebaseEvent('Button_backend_call');
                          await _model
                              .participanteProximaFase![_model.indexA].reference
                              .delete();
                          logFirebaseEvent('Button_update_component_state');
                          setState(() {
                            _model.indexA = _model.indexA + 1;
                          });
                        }
                        logFirebaseEvent('Button_update_component_state');
                        setState(() {
                          _model.indexA = 0;
                        });
                      } else {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('FIM DE CAMPEONATO?'),
                              content: const Text(
                                  'Não existe próxima fase configurada...'),
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
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'colocacao',
                          queryParameters: {
                            'championfinal': serializeParam(
                              widget.docChampion,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'championfinal': widget.docChampion,
                          },
                        );

                        if (shouldSetState) setState(() {});
                        return;
                      }

                      // LISTA DE SCRIPT
                      //
                      // PARA SEREM APLICADOS AOS PARTICIPANTES
                      while (_model.indexA <
                          _model.proximaFase!.configuracaoNextFase
                              .listaScriptNextFase.length) {
                        logFirebaseEvent('Button_update_component_state');
                        setState(() {});
                        if ((_model.proximaFase?.configuracaoNextFase
                                    .listaScriptNextFase[_model.indexA])
                                ?.tipoFiltro ==
                            1) {
                          logFirebaseEvent('Button_custom_action');
                          _model.participanteScript =
                              await actions.buscaParticipantePosicao(
                            _model.proximaFase?.configuracaoNextFase
                                .listaScriptNextFase[_model.indexA],
                          );
                          shouldSetState = true;
                          if (_model.participanteScript != null) {
                            logFirebaseEvent('Button_backend_call');
                            _model.grupoScript1 =
                                await GrupoRecord.getDocumentOnce(_model
                                    .proximaFase!
                                    .configuracaoNextFase
                                    .listaScriptNextFase[_model.indexA]
                                    .idGrupoBase!);
                            shouldSetState = true;
                            if (!_model.grupoScript1!.listaParticipante
                                .contains(_model
                                    .participanteScript?.idParticipante)) {
                              logFirebaseEvent('Button_backend_call');

                              var participanteRecordReference1 =
                                  ParticipanteRecord.collection.doc();
                              await participanteRecordReference1
                                  .set(createParticipanteRecordData(
                                dataIngresso: getCurrentTimestamp,
                                participanteNome:
                                    _model.participanteScript?.participanteNome,
                                participantePhoto: _model
                                    .participanteScript?.participantePhoto,
                                participanteApelido: _model
                                    .participanteScript?.participanteApelido,
                                idChampion:
                                    _model.participanteScript?.idChampion,
                                idFase: _model.proximaFase?.reference,
                                idGrupo: (_model
                                        .proximaFase
                                        ?.configuracaoNextFase
                                        .listaScriptNextFase[_model.indexA])
                                    ?.idGrupoBase,
                                idParticipante:
                                    _model.participanteScript?.idParticipante,
                                idClube: _model.participanteScript?.idClube,
                                idModalidade:
                                    _model.participanteScript?.idModalidade,
                                idFederation:
                                    _model.participanteScript?.idFederation,
                                totalPartidas: 0,
                                totalPontos: 0,
                                totalVitorias: 0,
                                totalEmpates: 0,
                                totalDerrotas: 0,
                                totalGolsPro: 0,
                                totalGolsContra: 0,
                                totalSaldoGols: 0,
                                grupoAproveitamento: 0.0,
                                grupoPosicao: 0,
                                fasePosicao: 0,
                                championPosicao: 0,
                                grupoPosicaoAgrupado: 0,
                                tituloFase:
                                    _model.participanteScript?.tituloFase,
                                tituloGrupo:
                                    _model.participanteScript?.tituloGrupo,
                              ));
                              _model.docNewParticipante =
                                  ParticipanteRecord.getDocumentFromData(
                                      createParticipanteRecordData(
                                        dataIngresso: getCurrentTimestamp,
                                        participanteNome: _model
                                            .participanteScript
                                            ?.participanteNome,
                                        participantePhoto: _model
                                            .participanteScript
                                            ?.participantePhoto,
                                        participanteApelido: _model
                                            .participanteScript
                                            ?.participanteApelido,
                                        idChampion: _model
                                            .participanteScript?.idChampion,
                                        idFase: _model.proximaFase?.reference,
                                        idGrupo: (_model
                                                    .proximaFase
                                                    ?.configuracaoNextFase
                                                    .listaScriptNextFase[
                                                _model.indexA])
                                            ?.idGrupoBase,
                                        idParticipante: _model
                                            .participanteScript?.idParticipante,
                                        idClube:
                                            _model.participanteScript?.idClube,
                                        idModalidade: _model
                                            .participanteScript?.idModalidade,
                                        idFederation: _model
                                            .participanteScript?.idFederation,
                                        totalPartidas: 0,
                                        totalPontos: 0,
                                        totalVitorias: 0,
                                        totalEmpates: 0,
                                        totalDerrotas: 0,
                                        totalGolsPro: 0,
                                        totalGolsContra: 0,
                                        totalSaldoGols: 0,
                                        grupoAproveitamento: 0.0,
                                        grupoPosicao: 0,
                                        fasePosicao: 0,
                                        championPosicao: 0,
                                        grupoPosicaoAgrupado: 0,
                                        tituloFase: _model
                                            .participanteScript?.tituloFase,
                                        tituloGrupo: _model
                                            .participanteScript?.tituloGrupo,
                                      ),
                                      participanteRecordReference1);
                              shouldSetState = true;
                              logFirebaseEvent('Button_backend_call');

                              await _model
                                  .proximaFase!
                                  .configuracaoNextFase
                                  .listaScriptNextFase[_model.indexA]
                                  .idGrupoBase!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'listaParticipante': FieldValue.arrayUnion([
                                      _model.participanteScript?.idParticipante
                                    ]),
                                    'listaParticipanteIds':
                                        FieldValue.arrayUnion([
                                      _model.docNewParticipante?.reference
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await _model
                                  .proximaFase!
                                  .configuracaoNextFase
                                  .listaScriptNextFase[_model.indexA]
                                  .idFaseBase!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'usuariosJaAgrupados':
                                        FieldValue.arrayUnion([
                                      _model.participanteScript?.idParticipante
                                    ]),
                                  },
                                ),
                              });
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('NÃO encontrou participante'),
                                  content: const Text('Colocação no seu grupo'),
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
                          }
                        } else if ((_model.proximaFase?.configuracaoNextFase
                                    .listaScriptNextFase[_model.indexA])
                                ?.tipoFiltro ==
                            2) {
                          logFirebaseEvent('Button_custom_action');
                          _model.participanteScript2 =
                              await actions.buscaParticipantePosicaoGeral(
                            _model.proximaFase?.configuracaoNextFase
                                .listaScriptNextFase[_model.indexA],
                          );
                          shouldSetState = true;
                          if (_model.participanteScript2 != null) {
                            logFirebaseEvent('Button_backend_call');
                            _model.grupoScript2 =
                                await GrupoRecord.getDocumentOnce(_model
                                    .proximaFase!
                                    .configuracaoNextFase
                                    .listaScriptNextFase[_model.indexA]
                                    .idGrupoBase!);
                            shouldSetState = true;
                            if (!_model.grupoScript2!.listaParticipante
                                .contains(_model
                                    .participanteScript?.idParticipante)) {
                              logFirebaseEvent('Button_backend_call');

                              var participanteRecordReference2 =
                                  ParticipanteRecord.collection.doc();
                              await participanteRecordReference2
                                  .set(createParticipanteRecordData(
                                dataIngresso: getCurrentTimestamp,
                                participanteNome: _model
                                    .participanteScript2?.participanteNome,
                                participantePhoto: _model
                                    .participanteScript2?.participantePhoto,
                                participanteApelido: _model
                                    .participanteScript2?.participanteApelido,
                                idChampion:
                                    _model.participanteScript2?.idChampion,
                                idFase: _model.proximaFase?.reference,
                                idGrupo: (_model
                                        .proximaFase
                                        ?.configuracaoNextFase
                                        .listaScriptNextFase[_model.indexA])
                                    ?.idGrupoBase,
                                idParticipante:
                                    _model.participanteScript2?.idParticipante,
                                idClube: _model.participanteScript2?.idClube,
                                idModalidade:
                                    _model.participanteScript2?.idModalidade,
                                idFederation:
                                    _model.participanteScript2?.idFederation,
                                totalPartidas: 0,
                                totalPontos: 0,
                                totalVitorias: 0,
                                totalEmpates: 0,
                                totalDerrotas: 0,
                                totalGolsPro: 0,
                                totalGolsContra: 0,
                                totalSaldoGols: 0,
                                grupoAproveitamento: 0.0,
                                grupoPosicao: 0,
                                fasePosicao: 0,
                                championPosicao: 0,
                                grupoPosicaoAgrupado: 0,
                                tituloFase:
                                    _model.participanteScript2?.tituloFase,
                                tituloGrupo:
                                    _model.participanteScript2?.tituloGrupo,
                              ));
                              _model.docNewParticipante2 =
                                  ParticipanteRecord.getDocumentFromData(
                                      createParticipanteRecordData(
                                        dataIngresso: getCurrentTimestamp,
                                        participanteNome: _model
                                            .participanteScript2
                                            ?.participanteNome,
                                        participantePhoto: _model
                                            .participanteScript2
                                            ?.participantePhoto,
                                        participanteApelido: _model
                                            .participanteScript2
                                            ?.participanteApelido,
                                        idChampion: _model
                                            .participanteScript2?.idChampion,
                                        idFase: _model.proximaFase?.reference,
                                        idGrupo: (_model
                                                    .proximaFase
                                                    ?.configuracaoNextFase
                                                    .listaScriptNextFase[
                                                _model.indexA])
                                            ?.idGrupoBase,
                                        idParticipante: _model
                                            .participanteScript2
                                            ?.idParticipante,
                                        idClube:
                                            _model.participanteScript2?.idClube,
                                        idModalidade: _model
                                            .participanteScript2?.idModalidade,
                                        idFederation: _model
                                            .participanteScript2?.idFederation,
                                        totalPartidas: 0,
                                        totalPontos: 0,
                                        totalVitorias: 0,
                                        totalEmpates: 0,
                                        totalDerrotas: 0,
                                        totalGolsPro: 0,
                                        totalGolsContra: 0,
                                        totalSaldoGols: 0,
                                        grupoAproveitamento: 0.0,
                                        grupoPosicao: 0,
                                        fasePosicao: 0,
                                        championPosicao: 0,
                                        grupoPosicaoAgrupado: 0,
                                        tituloFase: _model
                                            .participanteScript2?.tituloFase,
                                        tituloGrupo: _model
                                            .participanteScript2?.tituloGrupo,
                                      ),
                                      participanteRecordReference2);
                              shouldSetState = true;
                              logFirebaseEvent('Button_backend_call');

                              await _model
                                  .proximaFase!
                                  .configuracaoNextFase
                                  .listaScriptNextFase[_model.indexA]
                                  .idGrupoBase!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'listaParticipante': FieldValue.arrayUnion([
                                      _model.participanteScript2?.idParticipante
                                    ]),
                                    'listaParticipanteIds':
                                        FieldValue.arrayUnion([
                                      _model.docNewParticipante2?.reference
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await _model
                                  .proximaFase!
                                  .configuracaoNextFase
                                  .listaScriptNextFase[_model.indexA]
                                  .idFaseBase!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'usuariosJaAgrupados':
                                        FieldValue.arrayUnion([
                                      _model.participanteScript2?.idParticipante
                                    ]),
                                  },
                                ),
                              });
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('NÃO encontrou participante'),
                                  content:
                                      const Text('Colocação geral no campeonato'),
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
                          }
                        } else if ((_model.proximaFase?.configuracaoNextFase
                                    .listaScriptNextFase[_model.indexA])
                                ?.tipoFiltro ==
                            3) {
                          logFirebaseEvent('Button_custom_action');
                          _model.participanteScript3 = await actions
                              .buscaParticipanteGrupoPosicaoAgrupado(
                            _model.proximaFase?.configuracaoNextFase
                                .listaScriptNextFase[_model.indexA],
                          );
                          shouldSetState = true;
                          if (_model.participanteScript3 != null) {
                            logFirebaseEvent('Button_backend_call');
                            _model.grupoScript3 =
                                await GrupoRecord.getDocumentOnce(_model
                                    .proximaFase!
                                    .configuracaoNextFase
                                    .listaScriptNextFase[_model.indexA]
                                    .idGrupoBase!);
                            shouldSetState = true;
                            if (!_model.grupoScript3!.listaParticipante
                                .contains(_model
                                    .participanteScript?.idParticipante)) {
                              logFirebaseEvent('Button_backend_call');

                              var participanteRecordReference3 =
                                  ParticipanteRecord.collection.doc();
                              await participanteRecordReference3
                                  .set(createParticipanteRecordData(
                                dataIngresso: getCurrentTimestamp,
                                participanteNome: _model
                                    .participanteScript3?.participanteNome,
                                participantePhoto: _model
                                    .participanteScript3?.participantePhoto,
                                participanteApelido: _model
                                    .participanteScript3?.participanteApelido,
                                idChampion:
                                    _model.participanteScript3?.idChampion,
                                idFase: _model.proximaFase?.reference,
                                idGrupo: (_model
                                        .proximaFase
                                        ?.configuracaoNextFase
                                        .listaScriptNextFase[_model.indexA])
                                    ?.idGrupoBase,
                                idParticipante:
                                    _model.participanteScript3?.idParticipante,
                                idClube: _model.participanteScript3?.idClube,
                                idModalidade:
                                    _model.participanteScript3?.idModalidade,
                                idFederation:
                                    _model.participanteScript3?.idFederation,
                                totalPartidas: 0,
                                totalPontos: 0,
                                totalVitorias: 0,
                                totalEmpates: 0,
                                totalDerrotas: 0,
                                totalGolsPro: 0,
                                totalGolsContra: 0,
                                totalSaldoGols: 0,
                                grupoAproveitamento: 0.0,
                                grupoPosicao: 0,
                                fasePosicao: 0,
                                championPosicao: 0,
                                grupoPosicaoAgrupado: 0,
                                tituloFase:
                                    _model.participanteScript3?.tituloFase,
                                tituloGrupo:
                                    _model.participanteScript3?.tituloGrupo,
                              ));
                              _model.docNewParticipante3 =
                                  ParticipanteRecord.getDocumentFromData(
                                      createParticipanteRecordData(
                                        dataIngresso: getCurrentTimestamp,
                                        participanteNome: _model
                                            .participanteScript3
                                            ?.participanteNome,
                                        participantePhoto: _model
                                            .participanteScript3
                                            ?.participantePhoto,
                                        participanteApelido: _model
                                            .participanteScript3
                                            ?.participanteApelido,
                                        idChampion: _model
                                            .participanteScript3?.idChampion,
                                        idFase: _model.proximaFase?.reference,
                                        idGrupo: (_model
                                                    .proximaFase
                                                    ?.configuracaoNextFase
                                                    .listaScriptNextFase[
                                                _model.indexA])
                                            ?.idGrupoBase,
                                        idParticipante: _model
                                            .participanteScript3
                                            ?.idParticipante,
                                        idClube:
                                            _model.participanteScript3?.idClube,
                                        idModalidade: _model
                                            .participanteScript3?.idModalidade,
                                        idFederation: _model
                                            .participanteScript3?.idFederation,
                                        totalPartidas: 0,
                                        totalPontos: 0,
                                        totalVitorias: 0,
                                        totalEmpates: 0,
                                        totalDerrotas: 0,
                                        totalGolsPro: 0,
                                        totalGolsContra: 0,
                                        totalSaldoGols: 0,
                                        grupoAproveitamento: 0.0,
                                        grupoPosicao: 0,
                                        fasePosicao: 0,
                                        championPosicao: 0,
                                        grupoPosicaoAgrupado: 0,
                                        tituloFase: _model
                                            .participanteScript3?.tituloFase,
                                        tituloGrupo: _model
                                            .participanteScript3?.tituloGrupo,
                                      ),
                                      participanteRecordReference3);
                              shouldSetState = true;
                              logFirebaseEvent('Button_backend_call');

                              await _model
                                  .proximaFase!
                                  .configuracaoNextFase
                                  .listaScriptNextFase[_model.indexA]
                                  .idGrupoBase!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'listaParticipante': FieldValue.arrayUnion([
                                      _model.participanteScript3?.idParticipante
                                    ]),
                                    'listaParticipanteIds':
                                        FieldValue.arrayUnion([
                                      _model.docNewParticipante3?.reference
                                    ]),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await _model
                                  .proximaFase!
                                  .configuracaoNextFase
                                  .listaScriptNextFase[_model.indexA]
                                  .idFaseBase!
                                  .update({
                                ...mapToFirestore(
                                  {
                                    'usuariosJaAgrupados':
                                        FieldValue.arrayUnion([
                                      _model.participanteScript3?.idParticipante
                                    ]),
                                  },
                                ),
                              });
                            }
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('NÃO encontrou participante'),
                                  content:
                                      const Text('Colocação comparada aos grupos!'),
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
                          }
                        }

                        logFirebaseEvent('Button_update_component_state');
                        setState(() {
                          _model.indexA = _model.indexA + 1;
                        });
                      }
                      logFirebaseEvent('Button_backend_call');

                      await widget.docFase!.reference
                          .update(createFaseRecordData(
                        status: 2,
                        dataEncerramento: getCurrentTimestamp,
                      ));
                      logFirebaseEvent('Button_update_component_state');
                      setState(() {
                        _model.finalizado = true;
                      });
                      logFirebaseEvent('Button_execute_callback');
                      await widget.actionFinalizar?.call();
                      if (shouldSetState) setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'nt1b2ntq' /* Finalizar Fase */,
                    ),
                    icon: const Icon(
                      Icons.timer,
                      size: 18.0,
                    ),
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 14.0,
                          ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
