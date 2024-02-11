import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'filtro_next_fase_posicao_model.dart';
export 'filtro_next_fase_posicao_model.dart';

class FiltroNextFasePosicaoWidget extends StatefulWidget {
  const FiltroNextFasePosicaoWidget({
    super.key,
    required this.docChampion,
    required this.clicouAdicionar,
    required this.idGrupoBase,
    required this.idFaseBase,
    int? tipoFiltro,
  }) : tipoFiltro = tipoFiltro ?? 0;

  final ChampionRecord? docChampion;
  final Future Function()? clicouAdicionar;
  final DocumentReference? idGrupoBase;
  final DocumentReference? idFaseBase;
  final int tipoFiltro;

  @override
  State<FiltroNextFasePosicaoWidget> createState() =>
      _FiltroNextFasePosicaoWidgetState();
}

class _FiltroNextFasePosicaoWidgetState
    extends State<FiltroNextFasePosicaoWidget> {
  late FiltroNextFasePosicaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltroNextFasePosicaoModel());

    _model.tfPosicaoController ??= TextEditingController();
    _model.tfPosicaoFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
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
                              color: FlutterFlowTheme.of(context).info,
                              size: 10.0,
                            ),
                          ),
                        );
                      }
                      List<FaseRecord> ddFaseFaseRecordList = snapshot.data!;
                      return FlutterFlowDropDown<String>(
                        controller: _model.ddFaseValueController ??=
                            FormFieldController<String>(
                          _model.ddFaseValue ??= '',
                        ),
                        options: List<String>.from(ddFaseFaseRecordList
                            .map((e) => e.reference.id)
                            .toList()),
                        optionLabels: ddFaseFaseRecordList
                            .map((e) => e.tituloFase)
                            .toList(),
                        onChanged: (val) =>
                            setState(() => _model.ddFaseValue = val),
                        width: 300.0,
                        height: 50.0,
                        textStyle: FlutterFlowTheme.of(context).labelLarge,
                        hintText: FFLocalizations.of(context).getText(
                          'yb8ttwjq' /* Fase */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).info,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                ),
              ),
              if ((widget.tipoFiltro == 1) &&
                  (_model.ddFaseValue != null && _model.ddFaseValue != ''))
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: StreamBuilder<List<GrupoRecord>>(
                      stream: queryGrupoRecord(
                        queryBuilder: (grupoRecord) => grupoRecord.where(
                          'idFase',
                          isEqualTo:
                              functions.faseReference(_model.ddFaseValue!),
                          isNull:
                              (functions.faseReference(_model.ddFaseValue!)) ==
                                  null,
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
                                color: FlutterFlowTheme.of(context).info,
                                size: 10.0,
                              ),
                            ),
                          );
                        }
                        List<GrupoRecord> ddGrupoGrupoRecordList =
                            snapshot.data!;
                        return FlutterFlowDropDown<String>(
                          controller: _model.ddGrupoValueController ??=
                              FormFieldController<String>(
                            _model.ddGrupoValue ??= '',
                          ),
                          options: List<String>.from(ddGrupoGrupoRecordList
                              .map((e) => e.reference.id)
                              .toList()),
                          optionLabels: ddGrupoGrupoRecordList
                              .map((e) => e.tituloGrupo)
                              .toList(),
                          onChanged: (val) =>
                              setState(() => _model.ddGrupoValue = val),
                          width: 300.0,
                          height: 50.0,
                          textStyle: FlutterFlowTheme.of(context).labelLarge,
                          hintText: FFLocalizations.of(context).getText(
                            'd52thpo0' /* Grupo */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).info,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'yyawb06a' /* Posição a ser escolhida */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).info,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Container(
                width: 100.0,
                height: 45.0,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.tfPosicaoController,
                    focusNode: _model.tfPosicaoFocusNode,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '1bgondd6' /* Posição? */,
                      ),
                      labelStyle: FlutterFlowTheme.of(context).labelLarge,
                      hintStyle: FlutterFlowTheme.of(context).labelLarge,
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
                      filled: true,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).info,
                        ),
                    keyboardType: TextInputType.number,
                    validator: _model.tfPosicaoControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('FILTRO_NEXT_FASE_POSICAO_ADICIONE_BTN_ON');
                  var shouldSetState = false;
                  if (!(_model.ddFaseValue != null &&
                      _model.ddFaseValue != '')) {
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('ATENÇÃO!'),
                          content: const Text('Infome a fase!'),
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
                  if (widget.tipoFiltro == 1) {
                    if (!(_model.ddGrupoValue != null &&
                        _model.ddGrupoValue != '')) {
                      logFirebaseEvent('Button_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('ATENÇÃO!'),
                            content: const Text('Infome o grupo...'),
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
                  }
                  if (!(_model.tfPosicaoController.text != '')) {
                    logFirebaseEvent('Button_alert_dialog');
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('ATENÇÃO!'),
                          content: const Text('Infome a colocação...'),
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
                  _model.docFaseAdicionar = await FaseRecord.getDocumentOnce(
                      functions.faseReference(_model.ddFaseValue!)!);
                  shouldSetState = true;
                  if (widget.tipoFiltro != 1) {
                    logFirebaseEvent('Button_update_component_state');
                    setState(() {
                      _model.updateNextFaseStruct(
                        (e) => e
                          ..idFase =
                              functions.faseReference(_model.ddFaseValue!)
                          ..posicao =
                              int.tryParse(_model.tfPosicaoController.text)
                          ..tipoFiltro = widget.tipoFiltro
                          ..faseNome = _model.docFaseAdicionar?.tituloFase
                          ..idGrupoBase = widget.idGrupoBase
                          ..idFaseBase = widget.idFaseBase,
                      );
                    });
                  } else {
                    logFirebaseEvent('Button_backend_call');
                    _model.docGrupoAdicionar =
                        await GrupoRecord.getDocumentOnce(
                            functions.grupoReference(_model.ddGrupoValue!)!);
                    shouldSetState = true;
                    logFirebaseEvent('Button_update_component_state');
                    setState(() {
                      _model.updateNextFaseStruct(
                        (e) => e
                          ..idFase =
                              functions.faseReference(_model.ddFaseValue!)
                          ..idGrupo =
                              functions.grupoReference(_model.ddGrupoValue!)
                          ..posicao =
                              int.tryParse(_model.tfPosicaoController.text)
                          ..tipoFiltro = widget.tipoFiltro
                          ..faseNome = _model.docFaseAdicionar?.tituloFase
                          ..grupoNome = _model.docGrupoAdicionar?.tituloGrupo
                          ..idGrupoBase = widget.idGrupoBase
                          ..idFaseBase = widget.idFaseBase,
                      );
                    });
                  }

                  logFirebaseEvent('Button_execute_callback');
                  await widget.clicouAdicionar?.call();
                  if (shouldSetState) setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'khr2ayvd' /* Adicione */,
                ),
                icon: Icon(
                  Icons.medication,
                  color: FlutterFlowTheme.of(context).info,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0x40558BF8),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).info,
                      ),
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
      ],
    );
  }
}
