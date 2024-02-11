import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'plano_ouro_model.dart';
export 'plano_ouro_model.dart';

class PlanoOuroWidget extends StatefulWidget {
  const PlanoOuroWidget({super.key});

  @override
  State<PlanoOuroWidget> createState() => _PlanoOuroWidgetState();
}

class _PlanoOuroWidgetState extends State<PlanoOuroWidget> {
  late PlanoOuroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanoOuroModel());

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
        child: AuthUserStreamWidget(
          builder: (context) => StreamBuilder<List<FederationsRecord>>(
            stream: queryFederationsRecord(
              queryBuilder: (federationsRecord) => federationsRecord.where(
                'Nome',
                isEqualTo: valueOrDefault(currentUserDocument?.nomeFederer, ''),
              ),
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
              List<FederationsRecord> cardModalBasicFederationsRecordList =
                  snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final cardModalBasicFederationsRecord =
                  cardModalBasicFederationsRecordList.isNotEmpty
                      ? cardModalBasicFederationsRecordList.first
                      : null;
              return Material(
                color: Colors.transparent,
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 570.0,
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
                                    'PLANO_OURO_COMP_Icon_fng9x12w_ON_TAP');
                                logFirebaseEvent('Icon_navigate_back');
                                context.safePop();
                              },
                              child: Icon(
                                Icons.keyboard_return,
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
                                    '5qite1ai' /* Atenção Plano; */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'ioo3ut2x' /* Voce está contratando o plano ... */,
                                      ),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      valueOrDefault(
                                              currentUserDocument?.nomeFederer,
                                              '')
                                          .maybeHandleOverflow(
                                        maxChars: 30,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'os8t1ww9' /* Mensal */,
                                              ),
                                              FontAwesomeIcons.moneyCheckAlt),
                                          ChipData(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'a97lqkrs' /* Anual */,
                                              ),
                                              FontAwesomeIcons
                                                  .solidMoneyBillAlt)
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.choiceChipsValue =
                                                val?.first),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor: const Color(0x3F558BF8),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                          iconColor:
                                              FlutterFlowTheme.of(context).info,
                                          iconSize: 18.0,
                                          elevation: 4.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context).info,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context).info,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          iconSize: 16.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        chipSpacing: 45.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceChipsValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            FFLocalizations.of(context).getText(
                                              'n4orp8o9' /* Mensal */,
                                            )
                                          ],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 5.0, 10.0, 0.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 1.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: Image.asset(
                                            'assets/images/fundodetela.png',
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 5.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pozdaha2' /* Custo Mensal  de  R$ 24,99
Cus... */
                                                ,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          if (currentUserDocument?.federation !=
                                              null)
                                            FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'PLANO_OURO_ADERIR_AO_PLANO_OURO_BTN_ON_T');
                                                var shouldSetState = false;
                                                logFirebaseEvent(
                                                    'Button_stripe_payment');
                                                final paymentResponse =
                                                    await processStripePayment(
                                                  context,
                                                  amount:
                                                      _model.choiceChipsValue ==
                                                              'Mensal'
                                                          ? 2499
                                                          : 25000,
                                                  currency: 'BRL',
                                                  customerEmail:
                                                      currentUserEmail,
                                                  customerName:
                                                      currentUserDisplayName,
                                                  description: 'Plano Ouro',
                                                  allowGooglePay: false,
                                                  allowApplePay: false,
                                                  themeStyle: ThemeMode.system,
                                                  buttonColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  buttonTextColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                );
                                                if (paymentResponse.paymentId ==
                                                        null &&
                                                    paymentResponse
                                                            .errorMessage !=
                                                        null) {
                                                  showSnackbar(
                                                    context,
                                                    'Error: ${paymentResponse.errorMessage}',
                                                  );
                                                }
                                                _model.paymentOuro =
                                                    paymentResponse.paymentId ??
                                                        '';

                                                shouldSetState = true;
                                                if (_model.paymentOuro !=
                                                        null &&
                                                    _model.paymentOuro != '') {
                                                  if (_model.choiceChipsValue ==
                                                      'Mensal') {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await cardModalBasicFederationsRecord!
                                                        .reference
                                                        .update({
                                                      ...createFederationsRecordData(
                                                        assinaturaExpira: functions
                                                            .calculoVenctoM(
                                                                getCurrentTimestamp),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'adminFederer':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              const Text('Atenção!'),
                                                          content: Text(
                                                              'Assinatura da sua Federação é valida ate; ${dateTimeFormat(
                                                            'd/M/y',
                                                            cardModalBasicFederationsRecord
                                                                .assinaturaExpira,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}'),
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
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        'ManutencaoRanking');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'Button_backend_call');

                                                    await cardModalBasicFederationsRecord!
                                                        .reference
                                                        .update({
                                                      ...createFederationsRecordData(
                                                        assinaturaExpira: functions
                                                            .calculoVectoA(
                                                                getCurrentTimestamp),
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'adminFederer':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            currentUserReference
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    logFirebaseEvent(
                                                        'Button_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              const Text('Atenção!'),
                                                          content: Text(
                                                              'Assinatura da sua Federação é valida ate; ${dateTimeFormat(
                                                            'd/M/y',
                                                            cardModalBasicFederationsRecord
                                                                .assinaturaExpira,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )}'),
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
                                                    logFirebaseEvent(
                                                        'Button_navigate_to');

                                                    context.pushNamed(
                                                        'ManutencaoRanking');

                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                } else {
                                                  logFirebaseEvent(
                                                      'Button_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text('Atenção!'),
                                                        content: const Text(
                                                            'Pagamento NÃO realizado.'),
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
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }

                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'qinr39gl' /* Aderir ao Plano Ouro */,
                                              ),
                                              icon: const FaIcon(
                                                FontAwesomeIcons.medal,
                                                color: Color(0xFFE2AA44),
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 5.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
