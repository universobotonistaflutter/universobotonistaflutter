import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'select_placar_model.dart';
export 'select_placar_model.dart';

class SelectPlacarWidget extends StatefulWidget {
  const SelectPlacarWidget({
    super.key,
    required this.docChampion,
    required this.docJogo,
  });

  final ChampionRecord? docChampion;
  final JogosRecord? docJogo;

  @override
  State<SelectPlacarWidget> createState() => _SelectPlacarWidgetState();
}

class _SelectPlacarWidgetState extends State<SelectPlacarWidget> {
  late SelectPlacarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectPlacarModel());

    _model.tfMandanteController ??= TextEditingController();
    _model.tfMandanteFocusNode ??= FocusNode();

    _model.tfVisitanteController ??= TextEditingController();
    _model.tfVisitanteFocusNode ??= FocusNode();

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 550.0,
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
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'lmblunvs' /* Participante */,
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'vxbxvr6g' /* Placar */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1.0,
              indent: 10.0,
              endIndent: 10.0,
              color: FlutterFlowTheme.of(context).info,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  widget.docJogo!.mandanteNome,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: 80.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent4,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.tfMandanteController,
                                  focusNode: _model.tfMandanteFocusNode,
                                  autofocus: true,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).info,
                                  validator: _model
                                      .tfMandanteControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.tfMandanteMask],
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
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  widget.docJogo!.visitanteNome,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: 80.0,
                              height: 42.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent4,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).info,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.tfVisitanteController,
                                  focusNode: _model.tfVisitanteFocusNode,
                                  autofocus: true,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  cursorColor:
                                      FlutterFlowTheme.of(context).info,
                                  validator: _model
                                      .tfVisitanteControllerValidator
                                      .asValidator(context),
                                  inputFormatters: [_model.tfVisitanteMask],
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
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 25.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.docChampion?.administrador == currentUserReference)
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'SELECT_PLACAR_LIMPAR_PLACAR_BTN_ON_TAP');
                        logFirebaseEvent('Button_backend_call');

                        await widget.docJogo!.reference.update({
                          ...mapToFirestore(
                            {
                              'data_jogo': FieldValue.delete(),
                              'visitanteGols': FieldValue.delete(),
                              'mandanteGols': FieldValue.delete(),
                            },
                          ),
                        });
                      },
                      text: FFLocalizations.of(context).getText(
                        'j1i9xd74' /* Limpar Placar */,
                      ),
                      icon: const Icon(
                        Icons.close_sharp,
                        color: Color(0xFFE21C3D),
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0x40558BF8),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFFE21C3D),
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).info,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('SELECT_PLACAR_COMP_GRAVAR_BTN_ON_TAP');
                      var shouldSetState = false;
                      if (!(_model.tfMandanteController.text != '')) {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Atenção!'),
                              content: const Text('Informe o resultado do MANDANTE!'),
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
                      if (!(_model.tfVisitanteController.text != '')) {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Atenção!'),
                              content:
                                  const Text('Informe o resultado do VISITANTE!'),
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

                      await widget.docJogo!.reference
                          .update(createJogosRecordData(
                        visitanteGols:
                            int.tryParse(_model.tfVisitanteController.text),
                        mandantePontos: () {
                          if (functions
                                  .strToInt(_model.tfMandanteController.text) ==
                              functions.strToInt(
                                  _model.tfVisitanteController.text)) {
                            return 1;
                          } else if (functions
                                  .strToInt(_model.tfMandanteController.text) >
                              functions.strToInt(
                                  _model.tfVisitanteController.text)) {
                            return 3;
                          } else {
                            return 0;
                          }
                        }(),
                        visitantePontos: () {
                          if (functions.strToInt(
                                  _model.tfVisitanteController.text) ==
                              functions
                                  .strToInt(_model.tfMandanteController.text)) {
                            return 1;
                          } else if (functions
                                  .strToInt(_model.tfVisitanteController.text) >
                              functions
                                  .strToInt(_model.tfMandanteController.text)) {
                            return 3;
                          } else {
                            return 0;
                          }
                        }(),
                        dataJogo: getCurrentTimestamp,
                        mandanteGols:
                            int.tryParse(_model.tfMandanteController.text),
                      ));
                      logFirebaseEvent('Button_firestore_query');
                      _model.docQtdJogosRealizados =
                          await queryJogosRecordCount(
                        queryBuilder: (jogosRecord) => jogosRecord
                            .where(
                              'idChampion',
                              isEqualTo: widget.docChampion?.reference,
                            )
                            .where(
                              'data_jogo',
                              isNotEqualTo: widget.docChampion?.dataTorneio,
                            ),
                      );
                      shouldSetState = true;
                      logFirebaseEvent('Button_backend_call');

                      await widget.docChampion!.reference
                          .update(createChampionRecordData(
                        qtdPartidaJogadas: _model.docQtdJogosRealizados,
                      ));
                      logFirebaseEvent('Button_custom_action');
                      await actions.calcularResultadoJogos(
                        widget.docChampion,
                        widget.docJogo,
                      );
                      logFirebaseEvent('Button_custom_action');
                      await actions.atualziarResultadoChampionGeral(
                        widget.docChampion,
                      );
                      logFirebaseEvent('Button_bottom_sheet');
                      Navigator.pop(context, _model.docQtdJogosRealizados);
                      if (shouldSetState) setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '5dssm56t' /* Gravar */,
                    ),
                    icon: const Icon(
                      Icons.scoreboard_outlined,
                      size: 15.0,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).info,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
