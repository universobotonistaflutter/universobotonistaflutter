import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'package:provider/provider.dart';
import 'cria_ranking_model.dart';
export 'cria_ranking_model.dart';

class CriaRankingWidget extends StatefulWidget {
  const CriaRankingWidget({
    super.key,
    this.parModalidade,
  });

  final DocumentReference? parModalidade;

  @override
  State<CriaRankingWidget> createState() => _CriaRankingWidgetState();
}

class _CriaRankingWidgetState extends State<CriaRankingWidget> {
  late CriaRankingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriaRankingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'CriaRanking'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CRIA_RANKING_CriaRanking_ON_INIT_STATE');
      logFirebaseEvent('CriaRanking_custom_action');
      _model.listaModalidadeUsuario = await actions.getModalidades(
        (currentUserDocument?.minhasModalidades.toList() ?? []).toList(),
      );
      logFirebaseEvent('CriaRanking_update_app_state');
      setState(() {
        FFAppState().PesquisaON = true;
      });
      logFirebaseEvent('CriaRanking_update_page_state');
      setState(() {
        _model.listaModalidaesLocal =
            _model.listaModalidadeUsuario!.toList().cast<ModalidadesRecord>();
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            logFirebaseEvent('CRIA_RANKING_arrow_back_rounded_ICN_ON_T');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'o5hfsilr' /* Criação de  Ranking */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20.0,
              ),
        ),
        actions: const [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/12toques.jpg',
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 550.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'eqcp4gdo' /* Nome */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    '56jiw9m5' /* Nome da Liga */,
                                  ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelLarge,
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
                                style: FlutterFlowTheme.of(context).labelLarge,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 10.0),
                              child: FlutterFlowDropDown<String>(
                                controller:
                                    _model.dROPModaldadeValueController ??=
                                        FormFieldController<String>(
                                  _model.dROPModaldadeValue ??= '',
                                ),
                                options: List<String>.from(
                                    _model.listaModalidaesLocal
                                        .map((e) => valueOrDefault<String>(
                                              e.reference.id,
                                              '0',
                                            ))
                                        .toList()),
                                optionLabels: _model.listaModalidaesLocal
                                    .map((e) => e.modalidades)
                                    .toList(),
                                onChanged: (val) => setState(
                                    () => _model.dROPModaldadeValue = val),
                                textStyle:
                                    FlutterFlowTheme.of(context).labelLarge,
                                hintText: FFLocalizations.of(context).getText(
                                  'e5dyqirx' /* Modalidade */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 30.0,
                                ),
                                elevation: 5.0,
                                borderColor: FlutterFlowTheme.of(context).info,
                                borderWidth: 2.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 4.0),
                                hidesUnderline: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 10.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController ??=
                                    FormFieldController<String>(null),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'wo8c1lmy' /* Torneio Aberto */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'b0ubdre8' /* Torneio Regional */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'aaio60xy' /* Torneio Nacional */,
                                  )
                                ],
                                onChanged: (val) =>
                                    setState(() => _model.dropDownValue = val),
                                textStyle:
                                    FlutterFlowTheme.of(context).labelLarge,
                                hintText: FFLocalizations.of(context).getText(
                                  'cqio3xts' /* Torneio Tipo */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CRIA_RANKING_PAGE_CRIAR_BTN_ON_TAP');
                                      var shouldSetState = false;
                                      if (_model.textController.text != '') {
                                        if (!(_model.dROPModaldadeValue !=
                                                null &&
                                            _model.dROPModaldadeValue != '')) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('ATENÇÃO!'),
                                                content: const Text(
                                                    'Favor escolher a Modalidade...'),
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
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                        if (!(_model.dropDownValue != null &&
                                            _model.dropDownValue != '')) {
                                          logFirebaseEvent(
                                              'Button_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('ATENÇÃO!'),
                                                content: const Text(
                                                    'Favor escolher tipo  torneio...'),
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
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: const Text('ATENÇÃO'),
                                              content: const Text(
                                                  'Favor informar um Nome para a  Liga...'),
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
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }

                                      logFirebaseEvent('Button_backend_call');
                                      _model.docModalidadeS =
                                          await ModalidadesRecord
                                              .getDocumentOnce(functions
                                                  .modalidadeReference(_model
                                                      .dROPModaldadeValue!)!);
                                      shouldSetState = true;
                                      logFirebaseEvent('Button_backend_call');

                                      await RankingRecord.collection
                                          .doc()
                                          .set(createRankingRecordData(
                                            nomeRanking:
                                                _model.textController.text,
                                            tipoTorneio: _model.dropDownValue,
                                            data: getCurrentTimestamp,
                                            idUser: currentUserReference,
                                            idFederation:
                                                currentUserDocument?.federation,
                                            idClube: currentUserDocument?.club,
                                            nomeClube: valueOrDefault(
                                                currentUserDocument?.nomeClub,
                                                ''),
                                            nomeFederacao: valueOrDefault(
                                                currentUserDocument
                                                    ?.nomeFederer,
                                                ''),
                                            fotoFederacao: valueOrDefault(
                                                currentUserDocument?.photoFeder,
                                                ''),
                                            fotoClube: valueOrDefault(
                                                currentUserDocument?.photoClub,
                                                ''),
                                            idModalidade: _model
                                                .docModalidadeS?.reference,
                                            fotoModalidade:
                                                _model.docModalidadeS?.fotos,
                                            stauts: 0,
                                            nomeModalidade: _model
                                                .docModalidadeS?.modalidades,
                                            pontosCorridos: false,
                                          ));
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('ManutencaoRanking');

                                      if (shouldSetState) setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '8323n3bf' /* Criar  */,
                                    ),
                                    icon: const Icon(
                                      Icons.create_new_folder_outlined,
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
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
