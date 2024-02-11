import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'mensagem_champion_model.dart';
export 'mensagem_champion_model.dart';

class MensagemChampionWidget extends StatefulWidget {
  const MensagemChampionWidget({
    super.key,
    required this.parMsgChamp,
  });

  final ChampionRecord? parMsgChamp;

  @override
  State<MensagemChampionWidget> createState() => _MensagemChampionWidgetState();
}

class _MensagemChampionWidgetState extends State<MensagemChampionWidget> {
  late MensagemChampionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MensagemChampionModel());

    _model.tFMensgController ??= TextEditingController();
    _model.tFMensgFocusNode ??= FocusNode();

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
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'MENSAGEM_CHAMPION_Icon_urmmgthx_ON_TAP');
                            logFirebaseEvent('Icon_navigate_back');
                            context.safePop();
                          },
                          child: Icon(
                            Icons.keyboard_return_sharp,
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
                                '2smvp6bu' /* Avisos */,
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'cpp78lii' /* Escreva a sua Mensagem! */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 263.0,
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
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.tFMensgController,
                                  focusNode: _model.tFMensgFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        FFLocalizations.of(context).getText(
                                      'q87sccwn' /* Mensagem */,
                                    ),
                                    labelStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
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
                                      ),
                                  maxLines: null,
                                  validator: _model.tFMensgControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    StreamBuilder<List<ChampionRecord>>(
                      stream: queryChampionRecord(
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
                        List<ChampionRecord> rowChampionRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final rowChampionRecord =
                            rowChampionRecordList.isNotEmpty
                                ? rowChampionRecordList.first
                                : null;
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MENSAGEM_CHAMPION_COMP_ENVIAR_BTN_ON_TAP');
                                logFirebaseEvent('Button_backend_call');

                                await widget.parMsgChamp!.participante
                                    .where((e) => e != null)
                                    .toList()
                                    .last
                                    .update({
                                  ...mapToFirestore(
                                    {
                                      'participanteIDChampion':
                                          FieldValue.arrayUnion(
                                              [rowChampionRecord?.reference]),
                                    },
                                  ),
                                });
                                if (widget.parMsgChamp!.status < 6) {
                                  logFirebaseEvent('Button_firestore_query');
                                  _model.listaUsuariosParticipantes =
                                      await queryUserRecordOnce(
                                    queryBuilder: (userRecord) =>
                                        userRecord.where(
                                      'participanteIDChampion',
                                      arrayContains:
                                          rowChampionRecord?.reference,
                                    ),
                                  );
                                  if (_model
                                          .listaUsuariosParticipantes!.isNotEmpty) {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${_model.listaUsuariosParticipantes?.length.toString()} receberam sua mensagem',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                    );
                                    logFirebaseEvent(
                                        'Button_trigger_push_notification');
                                    triggerPushNotification(
                                      notificationTitle:
                                          '${widget.parMsgChamp?.nomecampeonato} informa!',
                                      notificationText:
                                          _model.tFMensgController.text,
                                      notificationImageUrl:
                                          widget.parMsgChamp?.fotoTorneio,
                                      notificationSound: 'default',
                                      userRefs: widget.parMsgChamp!.participante
                                          .toList(),
                                      initialPageName: 'ConsultaChampion',
                                      parameterData: {},
                                    );
                                  }
                                } else {
                                  logFirebaseEvent('Button_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Atenção!'),
                                        content: const Text(
                                            'Mensagem não Enviada, Torne-se um Usuário prata e tenha mais este Beneficio!'),
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
                                }

                                logFirebaseEvent('Button_backend_call');

                                await rowChampionRecord!.reference
                                    .update(createChampionRecordData(
                                  dataAtualizao: getCurrentTimestamp,
                                ));
                                logFirebaseEvent('Button_navigate_to');

                                context.pushNamed('ConsultaChampion');

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'qv1xyvxs' /* Enviar */,
                              ),
                              icon: const Icon(
                                Icons.wechat_sharp,
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
                          ],
                        );
                      },
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
