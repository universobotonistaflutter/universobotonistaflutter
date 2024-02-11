import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/button_sheet/help_tabela/help_tabela_widget.dart';
import '/button_sheet/input_box/input_box_widget.dart';
import '/button_sheet/select_participante/select_participante_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'tabela_model.dart';
export 'tabela_model.dart';

class TabelaWidget extends StatefulWidget {
  const TabelaWidget({
    super.key,
    required this.docChampion,
  });

  final ChampionRecord? docChampion;

  @override
  State<TabelaWidget> createState() => _TabelaWidgetState();
}

class _TabelaWidgetState extends State<TabelaWidget> {
  late TabelaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabelaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Tabela'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TABELA_PAGE_Tabela_ON_INIT_STATE');
      logFirebaseEvent('Tabela_firestore_query');
      _model.totalFases = await queryFaseRecordCount(
        queryBuilder: (faseRecord) => faseRecord.where(
          'idChampion',
          isEqualTo: widget.docChampion?.reference,
        ),
      );
      logFirebaseEvent('Tabela_set_form_field');
      setState(() {
        _model.tfNomeFaseController?.text =
            'Fase ${((_model.totalFases!) + 1).toString()}';
      });
    });

    _model.tfNomeFaseController ??= TextEditingController();
    _model.tfNomeFaseFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.tfNomeFaseController?.text =
              FFLocalizations.of(context).getText(
            '86x80b1n' /* Fase 1 */,
          );
        }));
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

    return Scaffold(
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
            logFirebaseEvent('TABELA_arrow_back_rounded_ICN_ON_TAP');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            '9yu2b88c' /* Geração Tabelas */,
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
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('TABELA_PAGE_Icon_zjwo0kld_ON_TAP');
                logFirebaseEvent('Icon_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: const Color(0x3F558BF8),
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.85,
                        child: const HelpTabelaWidget(),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Imagem_2.jpeg',
                  ).image,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      constraints: const BoxConstraints(
                        maxWidth: 550.0,
                      ),
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (widget.docChampion!.status < 6)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 0.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 1.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).info,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              widget.docChampion!.nomecampeonato
                                                  .maybeHandleOverflow(
                                                maxChars: 35,
                                                replacement: '…',
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Visibility(
                                                  visible:
                                                      currentUserReference ==
                                                          widget.docChampion
                                                              ?.administrador,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 15.0,
                                                                8.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .tfNomeFaseController,
                                                      focusNode: _model
                                                          .tfNomeFaseFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.tfNomeFaseController',
                                                        const Duration(
                                                            milliseconds: 2000),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'x64r1vyw' /* Nome da Fase */,
                                                        ),
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        prefixIcon: Icon(
                                                          Icons
                                                              .table_rows_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                        suffixIcon: _model
                                                                .tfNomeFaseController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .tfNomeFaseController
                                                                      ?.clear();
                                                                  setState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  size: 22.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge,
                                                      validator: _model
                                                          .tfNomeFaseControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (currentUserReference ==
                                                widget
                                                    .docChampion?.administrador)
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'lblmiffj' /* Qtd. grupos:  */,
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
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 160.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child:
                                                                  FlutterFlowCountController(
                                                                decrementIconBuilder:
                                                                    (enabled) =>
                                                                        FaIcon(
                                                                  FontAwesomeIcons
                                                                      .minus,
                                                                  color: enabled
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .info
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  size: 17.0,
                                                                ),
                                                                incrementIconBuilder:
                                                                    (enabled) =>
                                                                        FaIcon(
                                                                  FontAwesomeIcons
                                                                      .plus,
                                                                  color: enabled
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .info
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                  size: 17.0,
                                                                ),
                                                                countBuilder:
                                                                    (count) =>
                                                                        Text(
                                                                  count
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                                ),
                                                                count: _model
                                                                    .ccQtdGrupoValue ??= 1,
                                                                updateCount: (count) =>
                                                                    setState(() =>
                                                                        _model.ccQtdGrupoValue =
                                                                            count),
                                                                stepSize: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (currentUserReference ==
                                                widget
                                                    .docChampion?.administrador)
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 8.0, 10.0, 8.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'TABELA_PAGE_CRIAR_BTN_ON_TAP');
                                                      var shouldSetState =
                                                          false;
                                                      if (_model.tfNomeFaseController
                                                                  .text !=
                                                              '') {
                                                        if (_model
                                                                .ccQtdGrupoValue! <=
                                                            0) {
                                                          logFirebaseEvent(
                                                              'Button_alert_dialog');
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'ATENÇÃO!'),
                                                                content: const Text(
                                                                    'Informe a quantidade de grupos!'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: const Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          if (shouldSetState) {
                                                            setState(() {});
                                                          }
                                                          return;
                                                        }
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'ATENÇÃO!'),
                                                              content: const Text(
                                                                  'Informe a Fase'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      }

                                                      logFirebaseEvent(
                                                          'Button_firestore_query');
                                                      _model.existTituloCriado =
                                                          await queryFaseRecordCount(
                                                        queryBuilder:
                                                            (faseRecord) =>
                                                                faseRecord
                                                                    .where(
                                                                      'tituloFaseUPPERCASE',
                                                                      isEqualTo: functions.strToUpperCase(_model
                                                                          .tfNomeFaseController
                                                                          .text),
                                                                    )
                                                                    .where(
                                                                      'idChampion',
                                                                      isEqualTo: widget
                                                                          .docChampion
                                                                          ?.reference,
                                                                    ),
                                                      );
                                                      shouldSetState = true;
                                                      if (_model
                                                              .existTituloCriado! >
                                                          0) {
                                                        logFirebaseEvent(
                                                            'Button_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'ATENÇÃO:'),
                                                              content: const Text(
                                                                  'Este nome já existe cadastrado.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        if (shouldSetState) {
                                                          setState(() {});
                                                        }
                                                        return;
                                                      }
                                                      logFirebaseEvent(
                                                          'Button_firestore_query');
                                                      _model.totalFaseCriar =
                                                          await queryFaseRecordCount(
                                                        queryBuilder:
                                                            (faseRecord) =>
                                                                faseRecord
                                                                    .where(
                                                          'idChampion',
                                                          isEqualTo: widget
                                                              .docChampion
                                                              ?.reference,
                                                        ),
                                                      );
                                                      shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      var faseRecordReference =
                                                          FaseRecord.collection
                                                              .doc();
                                                      await faseRecordReference
                                                          .set(
                                                              createFaseRecordData(
                                                        tituloFase: _model
                                                            .tfNomeFaseController
                                                            .text,
                                                        idChampion: widget
                                                            .docChampion
                                                            ?.reference,
                                                        qtdGrupos: _model
                                                            .ccQtdGrupoValue,
                                                        status: 0,
                                                        tituloFaseUPPERCASE: functions
                                                            .strToUpperCase(_model
                                                                .tfNomeFaseController
                                                                .text),
                                                        orderFase: (_model
                                                                .totalFaseCriar!) +
                                                            1,
                                                      ));
                                                      _model.novaFaseCriada = FaseRecord
                                                          .getDocumentFromData(
                                                              createFaseRecordData(
                                                                tituloFase: _model
                                                                    .tfNomeFaseController
                                                                    .text,
                                                                idChampion: widget
                                                                    .docChampion
                                                                    ?.reference,
                                                                qtdGrupos: _model
                                                                    .ccQtdGrupoValue,
                                                                status: 0,
                                                                tituloFaseUPPERCASE:
                                                                    functions.strToUpperCase(_model
                                                                        .tfNomeFaseController
                                                                        .text),
                                                                orderFase: (_model
                                                                        .totalFaseCriar!) +
                                                                    1,
                                                              ),
                                                              faseRecordReference);
                                                      shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await widget.docChampion!
                                                          .reference
                                                          .update(
                                                              createChampionRecordData(
                                                        nomeFase: _model
                                                            .novaFaseCriada
                                                            ?.tituloFase,
                                                        idFase: _model
                                                            .novaFaseCriada
                                                            ?.reference,
                                                        status: 4,
                                                        dataAtualizao:
                                                            getCurrentTimestamp,
                                                      ));
                                                      logFirebaseEvent(
                                                          'Button_custom_action');
                                                      await actions
                                                          .adicionarGruposNaFase(
                                                        _model.ccQtdGrupoValue!,
                                                        _model.novaFaseCriada!
                                                            .reference,
                                                        widget.docChampion!
                                                            .reference,
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                '${_model.tfNomeFaseController.text} adicionada com sucesso!'),
                                                            content: const Text(
                                                                'Não Esquecer de adicionar os participantes no grupo!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_firestore_query');
                                                      _model.totalFases2 =
                                                          await queryFaseRecordCount(
                                                        queryBuilder:
                                                            (faseRecord) =>
                                                                faseRecord
                                                                    .where(
                                                          'idChampion',
                                                          isEqualTo: widget
                                                              .docChampion
                                                              ?.reference,
                                                        ),
                                                      );
                                                      shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Button_set_form_field');
                                                      setState(() {
                                                        _model.tfNomeFaseController
                                                                ?.text =
                                                            'Fase ${((_model.totalFases2!) + 1).toString()}';
                                                      });
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'rsu7mje5' /* Criar */,
                                                    ),
                                                    icon: const Icon(
                                                      Icons
                                                          .create_new_folder_outlined,
                                                      size: 24.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 336.0,
                                                      height: 50.0,
                                                      padding:
                                                          const EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    showLoadingIndicator: false,
                                                  ),
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
                          Expanded(
                            child: StreamBuilder<List<FaseRecord>>(
                              stream: queryFaseRecord(
                                queryBuilder: (faseRecord) => faseRecord
                                    .where(
                                      'idChampion',
                                      isEqualTo: widget.docChampion?.reference,
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
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 10.0,
                                      ),
                                    ),
                                  );
                                }
                                List<FaseRecord> pageViewFaseRecordList =
                                    snapshot.data!;
                                return SizedBox(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: Stack(
                                    children: [
                                      PageView.builder(
                                        controller:
                                            _model.pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        pageViewFaseRecordList
                                                                .length -
                                                            1)),
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            pageViewFaseRecordList.length,
                                        itemBuilder: (context, pageViewIndex) {
                                          final pageViewFaseRecord =
                                              pageViewFaseRecordList[
                                                  pageViewIndex];
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 8.0, 5.0, 0.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 1.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        maxWidth: 550.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.asset(
                                                            'assets/images/fundodetela.png',
                                                          ).image,
                                                        ),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x371C4494),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          width: 3.0,
                                                        ),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        primary: false,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
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
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'TABELA_PAGE_Icon_70ugtkl3_ON_TAP');
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            pageViewFaseRecord.tituloFase.maybeHandleOverflow(
                                                                              maxChars: 20,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  fontSize: 16.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          ),
                                                                          if ((currentUserReference == widget.docChampion?.administrador) ||
                                                                              (pageViewFaseRecord.status == 0))
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 20.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 40.0,
                                                                              icon: Icon(
                                                                                Icons.delete_sharp,
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('TABELA_PAGE_delete_sharp_ICN_ON_TAP');
                                                                                var shouldSetState = false;
                                                                                logFirebaseEvent('IconButton_alert_dialog');
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: const Text('ATENÇÃO!'),
                                                                                          content: Text('Deseja remover a ${pageViewFaseRecord.tituloFase}'),
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
                                                                                  if (pageViewFaseRecord.status == 1) {
                                                                                    logFirebaseEvent('IconButton_alert_dialog');
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: const Text('ATENÇÃO:'),
                                                                                          content: const Text('Já existe jogos criados para esta Fase, remova os jogos para editar os grupos.'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: const Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                    logFirebaseEvent('IconButton_backend_call');

                                                                                    await widget.docChampion!.reference.update(createChampionRecordData(
                                                                                      status: 5,
                                                                                    ));
                                                                                    if (shouldSetState) setState(() {});
                                                                                    return;
                                                                                  } else {
                                                                                    logFirebaseEvent('IconButton_update_page_state');
                                                                                    setState(() {
                                                                                      _model.index = 0;
                                                                                      _model.indexSub = 0;
                                                                                    });
                                                                                    logFirebaseEvent('IconButton_firestore_query');
                                                                                    _model.gruposDaFasePageView = await queryGrupoRecordOnce(
                                                                                      queryBuilder: (grupoRecord) => grupoRecord.where(
                                                                                        'idFase',
                                                                                        isEqualTo: pageViewFaseRecord.reference,
                                                                                      ),
                                                                                    );
                                                                                    shouldSetState = true;
                                                                                    while (_model.index < _model.gruposDaFasePageView!.length) {
                                                                                      logFirebaseEvent('IconButton_firestore_query');
                                                                                      _model.participantesDoGrupoPageView = await queryParticipanteRecordOnce(
                                                                                        queryBuilder: (participanteRecord) => participanteRecord.where(
                                                                                          'idGrupo',
                                                                                          isEqualTo: _model.gruposDaFasePageView?[_model.index].reference,
                                                                                        ),
                                                                                      );
                                                                                      shouldSetState = true;
                                                                                      while (_model.indexSub < _model.participantesDoGrupoPageView!.length) {
                                                                                        logFirebaseEvent('IconButton_backend_call');
                                                                                        await _model.participantesDoGrupoPageView![_model.indexSub].reference.delete();
                                                                                        logFirebaseEvent('IconButton_update_page_state');
                                                                                        setState(() {
                                                                                          _model.indexSub = _model.indexSub + 1;
                                                                                        });
                                                                                      }
                                                                                      logFirebaseEvent('IconButton_backend_call');
                                                                                      await _model.gruposDaFasePageView![_model.index].reference.delete();
                                                                                      logFirebaseEvent('IconButton_update_page_state');
                                                                                      setState(() {
                                                                                        _model.index = _model.index + 1;
                                                                                        _model.indexSub = 0;
                                                                                      });
                                                                                    }
                                                                                  }

                                                                                  logFirebaseEvent('IconButton_backend_call');
                                                                                  await pageViewFaseRecord.reference.delete();
                                                                                  logFirebaseEvent('IconButton_backend_call');

                                                                                  await widget.docChampion!.reference.update({
                                                                                    ...createChampionRecordData(
                                                                                      dataAtualizao: getCurrentTimestamp,
                                                                                      status: 2,
                                                                                    ),
                                                                                    ...mapToFirestore(
                                                                                      {
                                                                                        'idFase': FieldValue.delete(),
                                                                                      },
                                                                                    ),
                                                                                  });
                                                                                }
                                                                                if (shouldSetState) setState(() {});
                                                                              },
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 30.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'TABELA_PAGE_Icon_0bcragw7_ON_TAP');
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            24.0,
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
                                                StreamBuilder<
                                                    List<GrupoRecord>>(
                                                  stream: queryGrupoRecord(
                                                    queryBuilder: (grupoRecord) =>
                                                        grupoRecord
                                                            .where(
                                                              'idFase',
                                                              isEqualTo:
                                                                  pageViewFaseRecord
                                                                      .reference,
                                                            )
                                                            .orderBy(
                                                                'tituloGrupo'),
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
                                                    List<GrupoRecord>
                                                        listViewGrupoRecordList =
                                                        snapshot.data!;
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listViewGrupoRecordList
                                                              .length,
                                                      itemBuilder: (context,
                                                          listViewIndex) {
                                                        final listViewGrupoRecord =
                                                            listViewGrupoRecordList[
                                                                listViewIndex];
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      8.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 3.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/fundo_transparente.png',
                                                                  ).image,
                                                                ),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    offset:
                                                                        const Offset(
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
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    SingleChildScrollView(
                                                                      primary:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                if ((currentUserReference == widget.docChampion?.administrador) && (pageViewFaseRecord.status == 0))
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 20.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 40.0,
                                                                                    icon: Icon(
                                                                                      Icons.mode_edit_outlined,
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('TABELA_mode_edit_outlined_ICN_ON_TAP');
                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: InputBoxWidget(
                                                                                              nomeCampo: 'Nome do Grupo',
                                                                                              valorCampo: listViewGrupoRecord.tituloGrupo,
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.novoNomeGrupo = value));

                                                                                      if (_model.novoNomeGrupo != null && _model.novoNomeGrupo != '') {
                                                                                        logFirebaseEvent('IconButton_backend_call');

                                                                                        await listViewGrupoRecord.reference.update(createGrupoRecordData(
                                                                                          tituloGrupo: _model.novoNomeGrupo,
                                                                                        ));
                                                                                      }

                                                                                      setState(() {});
                                                                                    },
                                                                                  ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                  child: Text(
                                                                                    listViewGrupoRecord.tituloGrupo.maybeHandleOverflow(
                                                                                      maxChars: 25,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 16.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                if ((currentUserReference == widget.docChampion?.administrador) && (pageViewFaseRecord.status == 0))
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 20.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 40.0,
                                                                                    icon: Icon(
                                                                                      Icons.add,
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      logFirebaseEvent('TABELA_PAGE_add_ICN_ON_TAP');
                                                                                      logFirebaseEvent('IconButton_bottom_sheet');
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        barrierColor: const Color(0x3F558BF8),
                                                                                        enableDrag: false,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: SizedBox(
                                                                                              height: MediaQuery.sizeOf(context).height * 0.9,
                                                                                              child: SelectParticipanteWidget(
                                                                                                listaUserSelecionado: pageViewFaseRecord.usuariosJaAgrupados,
                                                                                                listaUser: widget.docChampion?.participante,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.listaUsuarioSelecionado = value));

                                                                                      if (_model.listaUsuarioSelecionado!.isNotEmpty) {
                                                                                        logFirebaseEvent('IconButton_backend_call');

                                                                                        await listViewGrupoRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'listaParticipante': _model.listaUsuarioSelecionado,
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        logFirebaseEvent('IconButton_update_page_state');
                                                                                        setState(() {
                                                                                          _model.index = 0;
                                                                                        });
                                                                                        while (_model.index < _model.listaUsuarioSelecionado!.length) {
                                                                                          logFirebaseEvent('IconButton_backend_call');

                                                                                          await pageViewFaseRecord.reference.update({
                                                                                            ...mapToFirestore(
                                                                                              {
                                                                                                'usuariosJaAgrupados': FieldValue.arrayUnion([
                                                                                                  _model.listaUsuarioSelecionado?[_model.index]
                                                                                                ]),
                                                                                              },
                                                                                            ),
                                                                                          });
                                                                                          logFirebaseEvent('IconButton_update_page_state');
                                                                                          setState(() {
                                                                                            _model.index = _model.index + 1;
                                                                                          });
                                                                                        }
                                                                                        logFirebaseEvent('IconButton_backend_call');

                                                                                        await pageViewFaseRecord.reference.update(createFaseRecordData(
                                                                                          status: 0,
                                                                                        ));
                                                                                        logFirebaseEvent('IconButton_update_page_state');
                                                                                        setState(() {
                                                                                          _model.index = 0;
                                                                                        });
                                                                                        while (_model.index < _model.listaUsuarioSelecionado!.length) {
                                                                                          logFirebaseEvent('IconButton_firestore_query');
                                                                                          _model.existeUsuarioCadastrado = await queryParticipanteRecordOnce(
                                                                                            queryBuilder: (participanteRecord) => participanteRecord
                                                                                                .where(
                                                                                                  'idChampion',
                                                                                                  isEqualTo: widget.docChampion?.reference,
                                                                                                )
                                                                                                .where(
                                                                                                  'idFase',
                                                                                                  isEqualTo: pageViewFaseRecord.reference,
                                                                                                )
                                                                                                .where(
                                                                                                  'idParticipante',
                                                                                                  isEqualTo: _model.listaUsuarioSelecionado?[_model.index],
                                                                                                ),
                                                                                            singleRecord: true,
                                                                                          ).then((s) => s.firstOrNull);
                                                                                          if (_model.existeUsuarioCadastrado == null) {
                                                                                            logFirebaseEvent('IconButton_backend_call');
                                                                                            _model.docConvidado = await UserRecord.getDocumentOnce(_model.listaUsuarioSelecionado![_model.index]);
                                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                                            var participanteRecordReference = ParticipanteRecord.collection.doc();
                                                                                            await participanteRecordReference.set(createParticipanteRecordData(
                                                                                              dataIngresso: getCurrentTimestamp,
                                                                                              participanteNome: _model.docConvidado?.displayName,
                                                                                              participantePhoto: _model.docConvidado?.photoUrl,
                                                                                              participanteApelido: _model.docConvidado?.displayApelido,
                                                                                              idChampion: widget.docChampion?.reference,
                                                                                              idFase: pageViewFaseRecord.reference,
                                                                                              idGrupo: listViewGrupoRecord.reference,
                                                                                              idParticipante: _model.docConvidado?.reference,
                                                                                              idClube: _model.docConvidado?.club,
                                                                                              idModalidade: widget.docChampion?.idModalidade,
                                                                                              idFederation: _model.docConvidado?.federation,
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
                                                                                              tituloFase: pageViewFaseRecord.tituloFase,
                                                                                              tituloGrupo: listViewGrupoRecord.tituloGrupo,
                                                                                            ));
                                                                                            _model.docNewParticipante = ParticipanteRecord.getDocumentFromData(
                                                                                                createParticipanteRecordData(
                                                                                                  dataIngresso: getCurrentTimestamp,
                                                                                                  participanteNome: _model.docConvidado?.displayName,
                                                                                                  participantePhoto: _model.docConvidado?.photoUrl,
                                                                                                  participanteApelido: _model.docConvidado?.displayApelido,
                                                                                                  idChampion: widget.docChampion?.reference,
                                                                                                  idFase: pageViewFaseRecord.reference,
                                                                                                  idGrupo: listViewGrupoRecord.reference,
                                                                                                  idParticipante: _model.docConvidado?.reference,
                                                                                                  idClube: _model.docConvidado?.club,
                                                                                                  idModalidade: widget.docChampion?.idModalidade,
                                                                                                  idFederation: _model.docConvidado?.federation,
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
                                                                                                  tituloFase: pageViewFaseRecord.tituloFase,
                                                                                                  tituloGrupo: listViewGrupoRecord.tituloGrupo,
                                                                                                ),
                                                                                                participanteRecordReference);
                                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                                            await listViewGrupoRecord.reference.update({
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'listaParticipanteIds': FieldValue.arrayUnion([
                                                                                                    _model.docNewParticipante?.reference
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          } else {
                                                                                            logFirebaseEvent('IconButton_backend_call');

                                                                                            await listViewGrupoRecord.reference.update({
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'listaParticipanteIds': FieldValue.arrayUnion([
                                                                                                    _model.existeUsuarioCadastrado?.reference
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          }

                                                                                          logFirebaseEvent('IconButton_update_page_state');
                                                                                          setState(() {
                                                                                            _model.index = _model.index + 1;
                                                                                          });
                                                                                        }
                                                                                      }
                                                                                      logFirebaseEvent('IconButton_show_snack_bar');
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Adicionados aos Grupos',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            ),
                                                                                          ),
                                                                                          duration: const Duration(milliseconds: 1650),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).info,
                                                                                        ),
                                                                                      );

                                                                                      setState(() {});
                                                                                    },
                                                                                  ),
                                                                                if ((pageViewFaseRecord.status == 0) && (pageViewFaseRecord.orderFase != 1))
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('TABELA_PAGE_Icon_4azlyq9a_ON_TAP');
                                                                                      logFirebaseEvent('Icon_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'NextGrupos',
                                                                                        queryParameters: {
                                                                                          'docChampion': serializeParam(
                                                                                            widget.docChampion,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'docFase': serializeParam(
                                                                                            pageViewFaseRecord,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                          'docGrupo': serializeParam(
                                                                                            listViewGrupoRecord,
                                                                                            ParamType.Document,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                        extra: <String, dynamic>{
                                                                                          'docChampion': widget.docChampion,
                                                                                          'docFase': pageViewFaseRecord,
                                                                                          'docGrupo': listViewGrupoRecord,
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.settings_outlined,
                                                                                      color: pageViewFaseRecord.hasConfiguracaoNextFase() ? const Color(0xFF1C9454) : FlutterFlowTheme.of(context).info,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                3.0,
                                                                            indent:
                                                                                8.0,
                                                                            endIndent:
                                                                                8.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                          ),
                                                                          SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  height: 250.0,
                                                                                  constraints: const BoxConstraints(
                                                                                    maxWidth: 700.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.asset(
                                                                                        'assets/images/fundo_transparente.png',
                                                                                      ).image,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: StreamBuilder<List<ParticipanteRecord>>(
                                                                                          stream: queryParticipanteRecord(
                                                                                            queryBuilder: (participanteRecord) => participanteRecord
                                                                                                .where(
                                                                                                  'idGrupo',
                                                                                                  isEqualTo: listViewGrupoRecord.reference,
                                                                                                )
                                                                                                .orderBy('grupoPosicao')
                                                                                                .orderBy('totalVitorias')
                                                                                                .orderBy('totalSaldoGols')
                                                                                                .orderBy('totalGolsPro'),
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
                                                                                            List<ParticipanteRecord> dataTableParticipanteRecordList = snapshot.data!;
                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: SizedBox(
                                                                                                width: 600.0,
                                                                                                child: DataTable2(
                                                                                                  columns: [
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            SingleChildScrollView(
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    FFLocalizations.of(context).getText(
                                                                                                                      'sfh9cz6p' /* Classificação */,
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                          fontFamily: 'Poppins',
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      fixedWidth: 160.0,
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'ynwu4gdd' /* PTS */,
                                                                                                          ),
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '17xafvdb' /* PJ */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'f6pu05r3' /* VIT */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'je34foz6' /* EMP */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'ovshd8az' /* DER */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'kaqlxin1' /* GP */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '6ayc7n4v' /* GC */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'ocfmd0xf' /* SDG */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            '3favohd0' /* CG */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'lecimz4w' /* MCG */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                fontSize: 12.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    DataColumn2(
                                                                                                      label: DefaultTextStyle.merge(
                                                                                                        softWrap: true,
                                                                                                        child: Text(
                                                                                                          FFLocalizations.of(context).getText(
                                                                                                            'e5po9p93' /* % */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                  rows: dataTableParticipanteRecordList
                                                                                                      .mapIndexed((dataTableIndex, dataTableParticipanteRecord) => [
                                                                                                            SingleChildScrollView(
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  if ((currentUserReference == widget.docChampion?.administrador) && (pageViewFaseRecord.status == 0))
                                                                                                                    InkWell(
                                                                                                                      splashColor: Colors.transparent,
                                                                                                                      focusColor: Colors.transparent,
                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                      onTap: () async {
                                                                                                                        logFirebaseEvent('TABELA_PAGE_Icon_8ysmpa7c_ON_TAP');
                                                                                                                        logFirebaseEvent('Icon_alert_dialog');
                                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                                              context: context,
                                                                                                                              builder: (alertDialogContext) {
                                                                                                                                return AlertDialog(
                                                                                                                                  title: const Text('Deseja remover o participante deste grupo:'),
                                                                                                                                  content: Text(dataTableParticipanteRecord.participanteNome),
                                                                                                                                  actions: [
                                                                                                                                    TextButton(
                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                      child: const Text('Não'),
                                                                                                                                    ),
                                                                                                                                    TextButton(
                                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                      child: const Text('Remover'),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                );
                                                                                                                              },
                                                                                                                            ) ??
                                                                                                                            false;
                                                                                                                        if (confirmDialogResponse) {
                                                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                                                          await dataTableParticipanteRecord.idGrupo!.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'listaParticipante': FieldValue.arrayRemove([dataTableParticipanteRecord.idParticipante]),
                                                                                                                                'listaParticipanteIds': FieldValue.arrayRemove([dataTableParticipanteRecord.reference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                                                          await dataTableParticipanteRecord.idFase!.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'usuariosJaAgrupados': FieldValue.arrayRemove([dataTableParticipanteRecord.idParticipante]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          logFirebaseEvent('Icon_backend_call');
                                                                                                                          await dataTableParticipanteRecord.reference.delete();
                                                                                                                        }
                                                                                                                      },
                                                                                                                      child: Icon(
                                                                                                                        Icons.close_sharp,
                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  if (dataTableParticipanteRecord.grupoPosicao != 0)
                                                                                                                    Padding(
                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        '${dataTableParticipanteRecord.grupoPosicao.toString()}º',
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  Text(
                                                                                                                    dataTableParticipanteRecord.participanteApelido.maybeHandleOverflow(
                                                                                                                      maxChars: 10,
                                                                                                                      replacement: '…',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalPontos.toString().maybeHandleOverflow(
                                                                                                                    maxChars: 3,
                                                                                                                    replacement: '…',
                                                                                                                  ),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalPartidas.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalVitorias.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalEmpates.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalDerrotas.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalGolsPro.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalGolsContra.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.totalSaldoGols.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              '${dataTableParticipanteRecord.fasePosicao.toString()}º'.maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              dataTableParticipanteRecord.grupoPosicaoAgrupado.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              '${formatNumber(
                                                                                                                dataTableParticipanteRecord.grupoAproveitamento,
                                                                                                                formatType: FormatType.decimal,
                                                                                                                decimalType: DecimalType.periodDecimal,
                                                                                                              )}%'
                                                                                                                  .maybeHandleOverflow(maxChars: 5),
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    fontSize: 12.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ].map((c) => DataCell(c)).toList())
                                                                                                      .map((e) => DataRow(cells: e))
                                                                                                      .toList(),
                                                                                                  headingRowColor: MaterialStateProperty.all(
                                                                                                    FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                  headingRowHeight: 45.0,
                                                                                                  dataRowColor: MaterialStateProperty.all(
                                                                                                    const Color(0x00000000),
                                                                                                  ),
                                                                                                  dataRowHeight: 40.0,
                                                                                                  border: TableBorder(
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  dividerThickness: 2.0,
                                                                                                  columnSpacing: 3.0,
                                                                                                  showBottomBorder: true,
                                                                                                  minWidth: 49.0,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller:
                                              _model.pageViewController ??=
                                                  PageController(
                                                      initialPage: min(
                                                          0,
                                                          pageViewFaseRecordList
                                                                  .length -
                                                              1)),
                                          count: pageViewFaseRecordList.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  const Duration(milliseconds: 500),
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
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            paintStyle: PaintingStyle.fill,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
