import '/backend/backend.dart';
import '/button_sheet/filtro_next_fase_posicao/filtro_next_fase_posicao_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'next_grupos_model.dart';
export 'next_grupos_model.dart';

class NextGruposWidget extends StatefulWidget {
  const NextGruposWidget({
    super.key,
    required this.docChampion,
    required this.docFase,
    required this.docGrupo,
  });

  final ChampionRecord? docChampion;
  final FaseRecord? docFase;
  final GrupoRecord? docGrupo;

  @override
  State<NextGruposWidget> createState() => _NextGruposWidgetState();
}

class _NextGruposWidgetState extends State<NextGruposWidget> {
  late NextGruposModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NextGruposModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NextGrupos'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEXT_GRUPOS_NextGrupos_ON_INIT_STATE');
      if (widget.docFase != null) {
        logFirebaseEvent('NextGrupos_update_page_state');
        setState(() {
          _model.listaScriptNextFase = widget
              .docFase!.configuracaoNextFase.listaScriptNextFase
              .toList()
              .cast<ConfigNextFaseStruct>();
        });
      }
      logFirebaseEvent('NextGrupos_update_page_state');
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              logFirebaseEvent('NEXT_GRUPOS_arrow_back_rounded_ICN_ON_TA');
              logFirebaseEvent('IconButton_alert_dialog');
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    title: const Text('Atenção!'),
                    content: const Text('Voce deve clicar em Salvar para sair...'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(alertDialogContext),
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7gbvrsz6' /* Fases do Campeonato */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Imagem_2.jpeg',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context).info,
                                  offset: const Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).info,
                                width: 3.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ae73pxsf' /* Configuração da: */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.docFase?.tituloFase,
                                            '*',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.docGrupo?.tituloGrupo,
                                            '*',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        8.0, 5.0, 8.0, 5.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.ddTipoFiltroValueController ??=
                                              FormFieldController<String>(
                                        _model.ddTipoFiltroValue ??= '',
                                      ),
                                      options:
                                          List<String>.from(['1', '2', '3']),
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          'cjtmtmfu' /* Colocação no seu Grupo (POS) */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'vhnsdeum' /* Colocação Geral no Campeonato ... */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'u7k5o2dc' /* Colocação comparado aos Grupos... */,
                                        )
                                      ],
                                      onChanged: (val) => setState(
                                          () => _model.ddTipoFiltroValue = val),
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'hywgeha8' /* Escolha uma das Opções! */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      elevation: 2.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).info,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  if (_model.ddTipoFiltroValue != null &&
                                      _model.ddTipoFiltroValue != '')
                                    wrapWithModel(
                                      model: _model.filtroNextFasePosicaoModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: FiltroNextFasePosicaoWidget(
                                        docChampion: widget.docChampion!,
                                        idGrupoBase: widget.docGrupo!.reference,
                                        idFaseBase: widget.docFase!.reference,
                                        tipoFiltro: valueOrDefault<int>(
                                          functions.strToInt(
                                              _model.ddTipoFiltroValue),
                                          0,
                                        ),
                                        clicouAdicionar: () async {
                                          logFirebaseEvent(
                                              'NEXT_GRUPOS_Container_835ufg71_CALLBACK');
                                          logFirebaseEvent(
                                              'filtroNextFasePosicao_update_page_state');
                                          setState(() {
                                            _model.updateParticipante = _model
                                                .filtroNextFasePosicaoModel
                                                .nextFase;
                                          });
                                          if (_model.filtroNextFasePosicaoModel
                                                  .nextFase?.tipoFiltro ==
                                              valueOrDefault<int>(
                                                1,
                                                1,
                                              )) {
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_custom_action');
                                            _model.docParticipante =
                                                await actions
                                                    .buscaParticipantePosicao(
                                              _model.filtroNextFasePosicaoModel
                                                  .nextFase,
                                            );
                                            if (_model.docParticipante !=
                                                null) {
                                              logFirebaseEvent(
                                                  'filtroNextFasePosicao_update_page_state');
                                              setState(() {
                                                _model
                                                    .updateUpdateParticipanteStruct(
                                                  (e) => e
                                                    ..participanteNome = _model
                                                        .docParticipante
                                                        ?.participanteNome,
                                                );
                                              });
                                            }
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_update_page_state');
                                            setState(() {
                                              _model.addToListaScriptNextFase(
                                                  ConfigNextFaseStruct
                                                      .maybeFromMap(_model
                                                          .updateParticipante!
                                                          .toMap())!);
                                            });
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: const Text(
                                                      'Adicionado com sucesso!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else if (_model
                                                  .filtroNextFasePosicaoModel
                                                  .nextFase
                                                  ?.tipoFiltro ==
                                              valueOrDefault<int>(
                                                2,
                                                2,
                                              )) {
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_custom_action');
                                            _model.docParticipante2 = await actions
                                                .buscaParticipantePosicaoGeral(
                                              _model.filtroNextFasePosicaoModel
                                                  .nextFase,
                                            );
                                            if (_model.docParticipante2 !=
                                                null) {
                                              logFirebaseEvent(
                                                  'filtroNextFasePosicao_update_page_state');
                                              setState(() {
                                                _model
                                                    .updateUpdateParticipanteStruct(
                                                  (e) => e
                                                    ..participanteNome = _model
                                                        .docParticipante2
                                                        ?.participanteNome,
                                                );
                                              });
                                            }
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_update_page_state');
                                            setState(() {
                                              _model.addToListaScriptNextFase(
                                                  ConfigNextFaseStruct
                                                      .maybeFromMap(_model
                                                          .updateParticipante!
                                                          .toMap())!);
                                            });
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: const Text(
                                                      'Adicionado com sucesso!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          } else if (_model
                                                  .filtroNextFasePosicaoModel
                                                  .nextFase
                                                  ?.tipoFiltro ==
                                              valueOrDefault<int>(
                                                3,
                                                3,
                                              )) {
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_custom_action');
                                            _model.docParticipante3 = await actions
                                                .buscaParticipanteGrupoPosicaoAgrupado(
                                              _model.filtroNextFasePosicaoModel
                                                  .nextFase,
                                            );
                                            if (_model.docParticipante3 !=
                                                null) {
                                              logFirebaseEvent(
                                                  'filtroNextFasePosicao_update_page_state');
                                              setState(() {
                                                _model
                                                    .updateUpdateParticipanteStruct(
                                                  (e) => e
                                                    ..participanteNome = _model
                                                        .docParticipante3
                                                        ?.participanteNome,
                                                );
                                              });
                                            }
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_update_page_state');
                                            setState(() {
                                              _model.addToListaScriptNextFase(
                                                  ConfigNextFaseStruct
                                                      .maybeFromMap(_model
                                                          .updateParticipante!
                                                          .toMap())!);
                                            });
                                            logFirebaseEvent(
                                                'filtroNextFasePosicao_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  content: const Text(
                                                      'Adicionado com sucesso!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: const Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }

                                          setState(() {});
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8.0, 10.0, 8.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
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
                                    color: FlutterFlowTheme.of(context).info,
                                    offset: const Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).info,
                                  width: 3.0,
                                ),
                              ),
                              child: Builder(
                                builder: (context) {
                                  final nextFaseItem =
                                      _model.listaScriptNextFase.toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: nextFaseItem.length,
                                    itemBuilder: (context, nextFaseItemIndex) {
                                      final nextFaseItemItem =
                                          nextFaseItem[nextFaseItemIndex];
                                      return Visibility(
                                        visible: nextFaseItemItem.idGrupoBase ==
                                            widget.docGrupo?.reference,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderRadius: 20.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 40.0,
                                                          icon: const Icon(
                                                            Icons.close_sharp,
                                                            color: Color(
                                                                0xFFE21C3D),
                                                            size: 24.0,
                                                          ),
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'NEXT_GRUPOS_PAGE_close_sharp_ICN_ON_TAP');
                                                            logFirebaseEvent(
                                                                'IconButton_alert_dialog');
                                                            var confirmDialogResponse =
                                                                await showDialog<
                                                                        bool>(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Deseja remover ?'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                              child: const Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                              child: const Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                            if (confirmDialogResponse) {
                                                              logFirebaseEvent(
                                                                  'IconButton_update_page_state');
                                                              setState(() {
                                                                _model.removeAtIndexFromListaScriptNextFase(
                                                                    nextFaseItemIndex);
                                                              });
                                                            }
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      4.0,
                                                                      0.0,
                                                                      4.0),
                                                          child: Text(
                                                            nextFaseItemItem
                                                                .posicao
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge,
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '4wn8hh4x' /* º colocado:   */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Text(
                                                            nextFaseItemItem
                                                                .faseNome,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge,
                                                          ),
                                                        ),
                                                        Text(
                                                          nextFaseItemItem
                                                              .grupoNome
                                                              .maybeHandleOverflow(
                                                            maxChars: 10,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              nextFaseItemItem
                                                                  .participanteNome,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      indent: 8.0,
                                                      endIndent: 8.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_model.listaScriptNextFase.isNotEmpty)
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'NEXT_GRUPOS_PAGE_SALVAR_BTN_ON_TAP');
                                      logFirebaseEvent('Button_backend_call');

                                      await widget.docFase!.reference
                                          .update(createFaseRecordData(
                                        configuracaoNextFase:
                                            createConfigNextStruct(
                                          fieldValues: {
                                            'listaScriptNextFase':
                                                getConfigNextFaseListFirestoreData(
                                              _model.listaScriptNextFase,
                                            ),
                                          },
                                          clearUnsetFields: false,
                                        ),
                                      ));
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Configuração desta fase salva!',
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      );
                                      logFirebaseEvent('Button_navigate_back');
                                      context.safePop();
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'd737sx6t' /* SALVAR */,
                                    ),
                                    icon: const Icon(
                                      Icons.save_outlined,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
