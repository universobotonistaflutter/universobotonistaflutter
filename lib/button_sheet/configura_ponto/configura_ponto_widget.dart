import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'configura_ponto_model.dart';
export 'configura_ponto_model.dart';

class ConfiguraPontoWidget extends StatefulWidget {
  const ConfiguraPontoWidget({
    super.key,
    required this.ranking,
  });

  final RankingRecord? ranking;

  @override
  State<ConfiguraPontoWidget> createState() => _ConfiguraPontoWidgetState();
}

class _ConfiguraPontoWidgetState extends State<ConfiguraPontoWidget> {
  late ConfiguraPontoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfiguraPontoModel());

    _model.tFPosController ??= TextEditingController();
    _model.tFPosFocusNode ??= FocusNode();

    _model.tFPtsController ??= TextEditingController();
    _model.tFPtsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.tFPosController?.text = FFLocalizations.of(context).getText(
            '43am94dr' /* 1 */,
          );
          _model.tFPtsController?.text = FFLocalizations.of(context).getText(
            '3zoyjyou' /* 0 */,
          );
        }));
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
      alignment: const AlignmentDirectional(0.0, 0.0),
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
              color: const Color(0x3F558BF8),
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
                        FlutterFlowIconButton(
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.keyboard_return,
                            color: FlutterFlowTheme.of(context).info,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'CONFIGURA_PONTO_keyboard_return_ICN_ON_T');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'psn5e6wz' /* Pontuação */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).info,
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                        ),
                      ),
                      child: StreamBuilder<List<RankingRecord>>(
                        stream: queryRankingRecord(
                          singleRecord: true,
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
                          List<RankingRecord> columnRankingRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final columnRankingRecord =
                              columnRankingRecordList.isNotEmpty
                                  ? columnRankingRecordList.first
                                  : null;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.ranking?.nomeRanking,
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'rlbnox83' /* Configure  a Pontuação */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.tFPosController,
                                          focusNode: _model.tFPosFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'rz1vz56s' /* Posição */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'bb8izki7' /* Posição */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .tFPosControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [_model.tFPosMask],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.tFPtsController,
                                          focusNode: _model.tFPtsFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'i6uul4f8' /* Pontos */,
                                            ),
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '9fayblt0' /* Pontos */,
                                            ),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 16.0,
                                              ),
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .tFPtsControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [_model.tFPtsMask],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CONFIGURA_PONTO_Icon_p716fphs_ON_TAP');
                                        if (_model.tFPosController.text != '') {
                                          if (_model.tFPtsController.text !=
                                                  '') {
                                            logFirebaseEvent(
                                                'Icon_backend_call');

                                            await ConfiguraPontosRecord
                                                    .createDoc(
                                                        columnRankingRecord!
                                                            .reference)
                                                .set(
                                                    createConfiguraPontosRecordData(
                                              colocacao: int.tryParse(
                                                  _model.tFPosController.text),
                                              qtdadePontos: int.tryParse(
                                                  _model.tFPtsController.text),
                                            ));
                                            logFirebaseEvent(
                                                'Icon_backend_call');

                                            await widget.ranking!.reference
                                                .update(createRankingRecordData(
                                              stauts: 1,
                                            ));
                                          } else {
                                            logFirebaseEvent(
                                                'Icon_alert_dialog');
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: const Text('ATENÇÃO!'),
                                                  content: const Text(
                                                      'Favor Cadastrar os Pontos da Colocação!'),
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
                                            return;
                                          }

                                          return;
                                        } else {
                                          logFirebaseEvent('Icon_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('ATENÇÃO!'),
                                                content: const Text(
                                                    'Favor cadastrar  a posicao do campeonato!'),
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
                                          return;
                                        }
                                      },
                                      child: Icon(
                                        Icons.save_outlined,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 30.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 10.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'zlj5p0i1' /* Inclui Pontos Corridos */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                      child: Checkbox(
                                        value: _model.checkboxValue ??=
                                            columnRankingRecord!.pontosCorridos,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.checkboxValue = newValue!);

                                          if (!newValue!) {
                                            logFirebaseEvent(
                                                'CONFIGURA_PONTO_Checkbox_xp40vro0_ON_TOG');
                                            logFirebaseEvent(
                                                'Checkbox_backend_call');

                                            await columnRankingRecord!.reference
                                                .update(createRankingRecordData(
                                              pontosCorridos: false,
                                            ));
                                          }
                                        },
                                        activeColor: const Color(0x3F558BF8),
                                        checkColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 10.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: double.infinity,
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
                          child: StreamBuilder<List<ConfiguraPontosRecord>>(
                            stream: queryConfiguraPontosRecord(
                              parent: widget.ranking?.reference,
                              queryBuilder: (configuraPontosRecord) =>
                                  configuraPontosRecord.orderBy('Qtdade_Pontos',
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
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<ConfiguraPontosRecord>
                                  columnConfiguraPontosRecordList =
                                  snapshot.data!;
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnConfiguraPontosRecordList.length,
                                      (columnIndex) {
                                    final columnConfiguraPontosRecord =
                                        columnConfiguraPontosRecordList[
                                            columnIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${columnConfiguraPontosRecord.colocacao.toString()}º',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          columnConfiguraPontosRecord
                                              .qtdadePontos
                                              .toString(),
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
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'CONFIGURA_PONTO_Icon_n2tcih26_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_backend_call');
                                            await columnConfiguraPontosRecord
                                                .reference
                                                .delete();
                                          },
                                          child: const Icon(
                                            Icons.close_sharp,
                                            color: Color(0xFFE21C3D),
                                            size: 24.0,
                                          ),
                                        ),
                                      ],
                                    );
                                  }).divide(const SizedBox(height: 3.0)),
                                ),
                              );
                            },
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
