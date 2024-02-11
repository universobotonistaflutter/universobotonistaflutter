import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/button_sheet/help_new_champion/help_new_champion_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'new_champion_model.dart';
export 'new_champion_model.dart';

class NewChampionWidget extends StatefulWidget {
  const NewChampionWidget({super.key});

  @override
  State<NewChampionWidget> createState() => _NewChampionWidgetState();
}

class _NewChampionWidgetState extends State<NewChampionWidget> {
  late NewChampionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewChampionModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'NewChampion'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEW_CHAMPION_NewChampion_ON_INIT_STATE');
      logFirebaseEvent('NewChampion_custom_action');
      _model.listaModalidadeUsuario = await actions.getModalidades(
        (currentUserDocument?.minhasModalidades.toList() ?? []).toList(),
      );
      logFirebaseEvent('NewChampion_update_page_state');
      setState(() {
        _model.listaModalidaesLocal =
            _model.listaModalidadeUsuario!.toList().cast<ModalidadesRecord>();
      });
      logFirebaseEvent('NewChampion_update_page_state');
      setState(() {
        _model.onTerminate = true;
      });
    });

    _model.textFieldCampController ??= TextEditingController();
    _model.textFieldCampFocusNode ??= FocusNode();

    _model.tFConvidadosController ??= TextEditingController();
    _model.tFConvidadosFocusNode ??= FocusNode();

    _model.textFieldObsController ??= TextEditingController();
    _model.textFieldObsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.tFConvidadosController?.text =
              FFLocalizations.of(context).getText(
            's9oye5ib' /* 2 */,
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              logFirebaseEvent('NEW_CHAMPION_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'jn5dvvo1' /* Novo Campeonato */,
            ),
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 20.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NEW_CHAMPION_PAGE_Icon_66z5eeib_ON_TAP');
                  logFirebaseEvent('Icon_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: const Color(0x3F558BF8),
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.9,
                            child: const HelpNewChampionWidget(),
                          ),
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
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
                    borderRadius: BorderRadius.circular(0.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 550.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0x371C4494),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
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
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).info,
                                    width: 3.0,
                                  ),
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 5.0, 5.0, 10.0),
                                              child: SizedBox(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .textFieldCampController,
                                                  focusNode: _model
                                                      .textFieldCampFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.textFieldCampController',
                                                    const Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '8p1zoh8m' /* Nome do Campeonato */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    prefixIcon: Icon(
                                                      Icons.zoom_in_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                    suffixIcon: _model
                                                            .textFieldCampController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .textFieldCampController
                                                                  ?.clear();
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 22.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge,
                                                  validator: _model
                                                      .textFieldCampControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 5.0, 10.0),
                                              child: Container(
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                borderRadius:
                                                                    15.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                icon: Icon(
                                                                  Icons
                                                                      .date_range_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'NEW_CHAMPION_date_range_outlined_ICN_ON_');
                                                                  logFirebaseEvent(
                                                                      'IconButton_date_time_picker');
                                                                  final datePickedDate =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        getCurrentTimestamp,
                                                                    firstDate:
                                                                        getCurrentTimestamp,
                                                                    lastDate:
                                                                        DateTime(
                                                                            2050),
                                                                    builder:
                                                                        (context,
                                                                            child) {
                                                                      return wrapInMaterialDatePickerTheme(
                                                                        context,
                                                                        child!,
                                                                        headerBackgroundColor:
                                                                            const Color(0x40558BF8),
                                                                        headerForegroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        headerTextStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 32.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                        pickerBackgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        pickerForegroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        selectedDateTimeBackgroundColor:
                                                                            const Color(0x40558BF8),
                                                                        selectedDateTimeForegroundColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        actionButtonForegroundColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        iconSize:
                                                                            24.0,
                                                                      );
                                                                    },
                                                                  );

                                                                  TimeOfDay?
                                                                      datePickedTime;
                                                                  if (datePickedDate !=
                                                                      null) {
                                                                    datePickedTime =
                                                                        await showTimePicker(
                                                                      context:
                                                                          context,
                                                                      initialTime:
                                                                          TimeOfDay.fromDateTime(
                                                                              getCurrentTimestamp),
                                                                      builder:
                                                                          (context,
                                                                              child) {
                                                                        return wrapInMaterialTimePickerTheme(
                                                                          context,
                                                                          child!,
                                                                          headerBackgroundColor:
                                                                              const Color(0x40558BF8),
                                                                          headerForegroundColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          headerTextStyle: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 32.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                          pickerBackgroundColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          pickerForegroundColor:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          selectedDateTimeBackgroundColor:
                                                                              const Color(0x40558BF8),
                                                                          selectedDateTimeForegroundColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          actionButtonForegroundColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          iconSize:
                                                                              24.0,
                                                                        );
                                                                      },
                                                                    );
                                                                  }

                                                                  if (datePickedDate !=
                                                                          null &&
                                                                      datePickedTime !=
                                                                          null) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.datePicked =
                                                                          DateTime(
                                                                        datePickedDate
                                                                            .year,
                                                                        datePickedDate
                                                                            .month,
                                                                        datePickedDate
                                                                            .day,
                                                                        datePickedTime!
                                                                            .hour,
                                                                        datePickedTime
                                                                            .minute,
                                                                      );
                                                                    });
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    'd/M/y',
                                                                    _model
                                                                        .datePicked,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .datePicked ==
                                                                null)
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '9x0ij5m3' /* Qual Data e Hora para inicio? */,
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
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  'Hm',
                                                                  _model
                                                                      .datePicked,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                borderRadius:
                                                                    50.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                icon: Icon(
                                                                  Icons
                                                                      .history_toggle_off_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
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
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 5.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownmodalidadeValueController ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownmodalidadeValue ??=
                                                      '',
                                                ),
                                                options: List<String>.from(
                                                    _model.listaModalidaesLocal
                                                        .map((e) =>
                                                            e.reference.id)
                                                        .toList()),
                                                optionLabels: _model
                                                    .listaModalidaesLocal
                                                    .map((e) => e.modalidades)
                                                    .toList(),
                                                onChanged: (val) => setState(() =>
                                                    _model.dropDownmodalidadeValue =
                                                        val),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'w4b9d7wy' /* Regra */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 30.0,
                                                ),
                                                elevation: 5.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 5.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDowntorneioValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1vd542jm' /* Treino */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '5jn7uloj' /* Aberto */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pzgnqvkh' /* Torneio Aberto */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vxagv1sb' /* Torneio Regional */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'p1nq914b' /* Torneio Nacional */,
                                                  )
                                                ],
                                                onChanged: (val) => setState(() =>
                                                    _model.dropDowntorneioValue =
                                                        val),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'e6lmteiv' /* Torneio tipo */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 30.0,
                                                ),
                                                elevation: 5.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 5.0, 10.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownparticipanteValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dtcruegg' /* Individual */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rrye1ot7' /* Equipe */,
                                                  )
                                                ],
                                                onChanged: (val) => setState(() =>
                                                    _model.dropDownparticipanteValue =
                                                        val),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'cix0sm9c' /* Participação */,
                                                ),
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  size: 30.0,
                                                ),
                                                elevation: 5.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                borderWidth: 2.0,
                                                borderRadius: 8.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Icon(
                                                    Icons.emoji_people,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vhrkng38' /* Número de  Convidados */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: SizedBox(
                                                        width: 100.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .tFConvidadosController,
                                                          focusNode: _model
                                                              .tFConvidadosFocusNode,
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'pz3k08fi' /* Convidados */,
                                                            ),
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                width: 2.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                width: 2.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
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
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          validator: _model
                                                              .tFConvidadosControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            _model
                                                                .tFConvidadosMask
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Container(
                                                height: 55.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x00FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      FlutterFlowPlacePicker(
                                                        iOSGoogleMapsApiKey:
                                                            'AIzaSyCWooCT88TAM6FWuuk341zgySQNOGA6kIA',
                                                        androidGoogleMapsApiKey:
                                                            'AIzaSyAtZw6v91al0eaaXJ29LmQx8XKaLz8Ohlg',
                                                        webGoogleMapsApiKey:
                                                            'AIzaSyA-YH6y8b4KwK5w7dyyvKmnikRGyeTR1rA',
                                                        onSelect:
                                                            (place) async {
                                                          setState(() => _model
                                                                  .placePickerValue =
                                                              place);
                                                        },
                                                        defaultText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '8gjb3v65' /* Endereço */,
                                                        ),
                                                        icon: Icon(
                                                          Icons.place,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 28.0,
                                                        ),
                                                        buttonOptions:
                                                            FFButtonOptions(
                                                          width: 200.0,
                                                          height: 40.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 5.0, 10.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .textFieldObsController,
                                                focusNode: _model
                                                    .textFieldObsFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldObsController',
                                                  const Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'y53410o8' /* Observação */,
                                                  ),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12.0,
                                                      ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  prefixIcon: Icon(
                                                    Icons.chat_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                  ),
                                                  suffixIcon: _model
                                                          .textFieldObsController!
                                                          .text
                                                          .isNotEmpty
                                                      ? InkWell(
                                                          onTap: () async {
                                                            _model
                                                                .textFieldObsController
                                                                ?.clear();
                                                            setState(() {});
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 22.0,
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                maxLines: null,
                                                validator: _model
                                                    .textFieldObsControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: SingleChildScrollView(
                                                primary: false,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 80.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          fadeInDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          fadeOutDuration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            _model
                                                                .uploadedFileUrl,
                                                            'https://firebasestorage.googleapis.com/v0/b/universo-botonista-flutterflow.appspot.com/o/users%2FzNApvxTWOxZxnlpnYJjrhB9o7bG3%2Fuploads%2F1692451243056000.jpg?alt=media&token=54bd7fc0-31e0-4304-9efe-67d66910d643',
                                                          ),
                                                          width: 80.0,
                                                          height: 80.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  15.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'NEW_CHAMPION_Buttonfotoperfil_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Buttonfotoperfil_upload_media_to_firebas');
                                                          final selectedMedia =
                                                              await selectMediaWithSourceBottomSheet(
                                                            context: context,
                                                            allowPhoto: true,
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            textColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              _model.isDataUploading =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                            } else {
                                                              setState(() {});
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'mcmnj2sd' /* Atualizar Foto */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .picture_in_picture,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 130.0,
                                                          height: 26.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              const Color(0x0A4B39EF),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    fontSize:
                                                                        9.0,
                                                                  ),
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
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(8.0),
                                                      child: FFButtonWidget(
                                                        onPressed: ((_model.textFieldCampController
                                                                            .text ==
                                                                        '') &&
                                                                (/* NOT RECOMMENDED */ _model
                                                                        .textFieldObsController
                                                                        .text ==
                                                                    'true'))
                                                            ? null
                                                            : () async {
                                                                logFirebaseEvent(
                                                                    'NEW_CHAMPION_GRAVAR_CAMPEONATO_BTN_ON_TA');
                                                                var shouldSetState =
                                                                    false;
                                                                if (_model.textFieldCampController
                                                                            .text !=
                                                                        '') {
                                                                  if (!(_model
                                                                          .datePicked !=
                                                                      null)) {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('ATENÇÃO!'),
                                                                          content:
                                                                              const Text('Informe uma data para o Campeonato!'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownmodalidadeValue !=
                                                                          null &&
                                                                      _model.dropDownmodalidadeValue !=
                                                                          '')) {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('ATENÇÃO!'),
                                                                          content:
                                                                              const Text('Escolha a Modalidade'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                  if (!(_model.dropDownmodalidadeValue !=
                                                                          null &&
                                                                      _model.dropDownmodalidadeValue !=
                                                                          '')) {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('ATENÇÃO!'),
                                                                          content:
                                                                              const Text('Tipo de Torneio em Branco!'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                  if (_model.dropDownparticipanteValue !=
                                                                          null &&
                                                                      _model.dropDownparticipanteValue !=
                                                                          '') {
                                                                    if (!(_model.tFConvidadosController.text !=
                                                                            '')) {
                                                                      logFirebaseEvent(
                                                                          'Button_alert_dialog');
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                const Text('ATENÇÃO!'),
                                                                            content:
                                                                                const Text('Favor Adicionar o Número de Convidados!'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: const Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      if (shouldSetState) {
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                      return;
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'Button_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('ATENÇÃO!'),
                                                                          content:
                                                                              const Text('Tipo de Participação em Branco'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      setState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'Button_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'ATENÇÃO!'),
                                                                        content:
                                                                            const Text('Favor informar um Nome para o Campeonato!'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                const Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (shouldSetState) {
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                }

                                                                logFirebaseEvent(
                                                                    'Button_backend_call');
                                                                _model.docModalidade =
                                                                    await ModalidadesRecord.getDocumentOnce(
                                                                        functions
                                                                            .modalidadeReference(_model.dropDownmodalidadeValue!)!);
                                                                shouldSetState =
                                                                    true;
                                                                logFirebaseEvent(
                                                                    'Button_backend_call');

                                                                await ChampionRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        createChampionRecordData(
                                                                      nomecampeonato: _model
                                                                          .textFieldCampController
                                                                          .text,
                                                                      tipoParticipa:
                                                                          _model
                                                                              .dropDownparticipanteValue,
                                                                      observaoes: _model
                                                                          .textFieldObsController
                                                                          .text,
                                                                      administrador:
                                                                          currentUserReference,
                                                                      fotoAdmin:
                                                                          currentUserPhoto,
                                                                      dataAtualizao:
                                                                          getCurrentTimestamp,
                                                                      status: 1,
                                                                      fotoTorneio:
                                                                          _model
                                                                              .uploadedFileUrl,
                                                                      local: _model
                                                                          .placePickerValue
                                                                          .latLng,
                                                                      rua: valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .placePickerValue
                                                                            .address,
                                                                        '0',
                                                                      ),
                                                                      uf: valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .placePickerValue
                                                                            .state,
                                                                        '0',
                                                                      ),
                                                                      cidade: valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .placePickerValue
                                                                            .city,
                                                                        '0',
                                                                      ),
                                                                      pais: valueOrDefault<
                                                                          String>(
                                                                        _model
                                                                            .placePickerValue
                                                                            .country,
                                                                        '0',
                                                                      ),
                                                                      localTorneio:
                                                                          valueOrDefault<
                                                                              String>(
                                                                        _model
                                                                            .placePickerValue
                                                                            .name,
                                                                        '0',
                                                                      ),
                                                                      idModalidade:
                                                                          functions
                                                                              .modalidadeReference(_model.dropDownmodalidadeValue!),
                                                                      idFederation:
                                                                          currentUserDocument
                                                                              ?.federation,
                                                                      idClube:
                                                                          currentUserDocument
                                                                              ?.club,
                                                                      ultimaPartida:
                                                                          0,
                                                                      qtdPartidaJogadas:
                                                                          0,
                                                                      modalidadeTorneio: _model
                                                                          .docModalidade
                                                                          ?.modalidades,
                                                                      tipoTorneio:
                                                                          _model
                                                                              .dropDowntorneioValue,
                                                                      dataTorneio:
                                                                          _model
                                                                              .datePicked,
                                                                      dataCampeonatoCalender:
                                                                          functions
                                                                              .extractDateString(_model.datePicked),
                                                                      fotoModalidade: _model
                                                                          .docModalidade
                                                                          ?.fotos,
                                                                      numberParticipantes:
                                                                          valueOrDefault<
                                                                              int>(
                                                                        int.tryParse(_model
                                                                            .tFConvidadosController
                                                                            .text),
                                                                        0,
                                                                      ),
                                                                      nomeAdmin:
                                                                          currentUserDisplayName,
                                                                      nomeFederation: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.nomeFederer,
                                                                          ''),
                                                                    ));
                                                                logFirebaseEvent(
                                                                    'Button_navigate_to');

                                                                context.pushNamed(
                                                                    'ConsultaChampion');

                                                                if (shouldSetState) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'sbjya4l2' /* Gravar Campeonato */,
                                                        ),
                                                        icon: const Icon(
                                                          Icons.save_outlined,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          disabledColor:
                                                              const Color(0x40558BF8),
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
