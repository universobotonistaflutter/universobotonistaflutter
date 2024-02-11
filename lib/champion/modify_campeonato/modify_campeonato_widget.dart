import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
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
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'modify_campeonato_model.dart';
export 'modify_campeonato_model.dart';

class ModifyCampeonatoWidget extends StatefulWidget {
  const ModifyCampeonatoWidget({
    super.key,
    required this.parcampeonato,
  });

  final ChampionRecord? parcampeonato;

  @override
  State<ModifyCampeonatoWidget> createState() => _ModifyCampeonatoWidgetState();
}

class _ModifyCampeonatoWidgetState extends State<ModifyCampeonatoWidget> {
  late ModifyCampeonatoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModifyCampeonatoModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ModifyCampeonato'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MODIFY_CAMPEONATO_ModifyCampeonato_ON_IN');
      logFirebaseEvent('ModifyCampeonato_custom_action');
      _model.listaModalidadeUsuario = await actions.getModalidades(
        (currentUserDocument?.minhasModalidades.toList() ?? []).toList(),
      );
      logFirebaseEvent('ModifyCampeonato_update_page_state');
      setState(() {
        _model.listaModalidadesLocal =
            _model.listaModalidadeUsuario!.toList().cast<ModalidadesRecord>();
      });
      logFirebaseEvent('ModifyCampeonato_update_page_state');
      setState(() {
        _model.onTerminate = true;
      });
    });

    _model.textFieldCampController ??=
        TextEditingController(text: widget.parcampeonato?.nomecampeonato);
    _model.textFieldCampFocusNode ??= FocusNode();

    _model.textFieldObsController ??=
        TextEditingController(text: widget.parcampeonato?.observaoes);
    _model.textFieldObsFocusNode ??= FocusNode();

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
              logFirebaseEvent('MODIFY_CAMPEONATO_arrow_back_rounded_ICN');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'juo9s01b' /* Manutenção Campeonato */,
            ),
            textAlign: TextAlign.start,
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
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
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
                        'assets/images/Imagem_2.jpeg',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(0.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
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
                            borderRadius: BorderRadius.circular(8.0),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).info,
                              width: 3.0,
                            ),
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 10.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.textFieldCampController,
                                        focusNode:
                                            _model.textFieldCampFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldCampController',
                                          const Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '1gugxuud' /* Nome do Campeonato */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.zoom_in_sharp,
                                            color: FlutterFlowTheme.of(context)
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 22.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                        validator: _model
                                            .textFieldCampControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 10.0),
                                    child: Container(
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x00FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      borderRadius: 15.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      icon: Icon(
                                                        Icons
                                                            .date_range_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        size: 20.0,
                                                      ),
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'MODIFY_CAMPEONATO_date_range_outlined_IC');
                                                        logFirebaseEvent(
                                                            'IconButton_date_time_picker');
                                                        final datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              getCurrentTimestamp,
                                                          lastDate:
                                                              DateTime(2050),
                                                        );

                                                        TimeOfDay?
                                                            datePickedTime;
                                                        if (datePickedDate !=
                                                            null) {
                                                          datePickedTime =
                                                              await showTimePicker(
                                                            context: context,
                                                            initialTime: TimeOfDay
                                                                .fromDateTime(
                                                                    getCurrentTimestamp),
                                                          );
                                                        }

                                                        if (datePickedDate !=
                                                                null &&
                                                            datePickedTime !=
                                                                null) {
                                                          safeSetState(() {
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
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            'd/M/y',
                                                            widget.parcampeonato
                                                                ?.dataTorneio,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '0',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      dateTimeFormat(
                                                        'jm',
                                                        widget.parcampeonato!
                                                            .dataTorneio!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 3.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      borderRadius: 50.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      icon: Icon(
                                                        Icons
                                                            .history_toggle_off_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 10.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownmodalidadeValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownmodalidadeValue ??=
                                            widget.parcampeonato
                                                ?.modalidadeTorneio,
                                      ),
                                      options: List<String>.from(_model
                                          .listaModalidadesLocal
                                          .map((e) => e.reference.id)
                                          .toList()),
                                      optionLabels: _model.listaModalidadesLocal
                                          .map((e) => e.modalidades)
                                          .toList(),
                                      onChanged: (val) => setState(() =>
                                          _model.dropDownmodalidadeValue = val),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'vmr506cn' /* Regra */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 30.0,
                                      ),
                                      elevation: 5.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).info,
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
                                        5.0, 0.0, 5.0, 10.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDowntorneioValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDowntorneioValue ??=
                                            widget.parcampeonato?.tipoTorneio,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'p65wu2x9' /* Treino */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '27jexoa3' /* Aberto */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          '0u41kv0w' /* Torneio Aberto */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'fenps578' /* Torneio Regional */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'eeo141os' /* Torneio Nacional */,
                                        )
                                      ],
                                      onChanged: (val) => setState(() =>
                                          _model.dropDowntorneioValue = val),
                                      height: 55.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '97qpau2j' /* Torneio tipo: */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 30.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      elevation: 5.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).info,
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
                                        5.0, 0.0, 5.0, 10.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller: _model
                                              .dropDownparticipanteValueController ??=
                                          FormFieldController<String>(
                                        _model.dropDownparticipanteValue ??=
                                            widget.parcampeonato?.tipoParticipa,
                                      ),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'n1ysryta' /* Individual */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'aq0zkg2k' /* Equipe */,
                                        )
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .dropDownparticipanteValue = val),
                                      height: 55.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'wyk8trdu' /* Participação */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 30.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(context).accent4,
                                      elevation: 5.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).info,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'up8ip3zh' /* Nº de  Convidados */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Container(
                                          width: 160.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0x00558BF8),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 16.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .info
                                                  : FlutterFlowTheme.of(context)
                                                      .info,
                                              size: 16.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                            count: _model
                                                    .countControllerqtdconvValue ??=
                                                widget.parcampeonato!
                                                    .numberParticipantes,
                                            updateCount: (count) => setState(() =>
                                                _model.countControllerqtdconvValue =
                                                    count),
                                            stepSize: 1,
                                            minimum: 0,
                                            maximum: 900,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0x00FFFFFF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            FlutterFlowPlacePicker(
                                              iOSGoogleMapsApiKey:
                                                  'AIzaSyCWooCT88TAM6FWuuk341zgySQNOGA6kIA',
                                              androidGoogleMapsApiKey:
                                                  'AIzaSyAtZw6v91al0eaaXJ29LmQx8XKaLz8Ohlg',
                                              webGoogleMapsApiKey:
                                                  'AIzaSyA-YH6y8b4KwK5w7dyyvKmnikRGyeTR1rA',
                                              onSelect: (place) async {
                                                setState(() => _model
                                                    .placePickerValue = place);
                                              },
                                              defaultText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'b3i2ntkc' /* Endereço */,
                                              ),
                                              icon: Icon(
                                                Icons.place,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 28.0,
                                              ),
                                              buttonOptions: FFButtonOptions(
                                                width: 200.0,
                                                height: 40.0,
                                                color: const Color(0xFFEEEEEE),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 10.0, 5.0, 10.0),
                                    child: TextFormField(
                                      controller: _model.textFieldObsController,
                                      focusNode: _model.textFieldObsFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textFieldObsController',
                                        const Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          'jqi9rsd1' /* Observação */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 12.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.chat_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                        suffixIcon: _model
                                                .textFieldObsController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model.textFieldObsController
                                                      ?.clear();
                                                  setState(() {});
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
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge,
                                      maxLines: null,
                                      validator: _model
                                          .textFieldObsControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    const Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    const Duration(milliseconds: 500),
                                                imageUrl:
                                                    valueOrDefault<String>(
                                                  widget.parcampeonato
                                                      ?.fotoTorneio,
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
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 15.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'MODIFY_CAMPEONATO_Buttonfotoperfil_ON_TA');
                                                if (!widget.parcampeonato!
                                                    .hasFotoTorneio()) {
                                                  logFirebaseEvent(
                                                      'Buttonfotoperfil_delete_data');
                                                  await FirebaseStorage.instance
                                                      .refFromURL(_model
                                                          .uploadedFileUrl)
                                                      .delete();
                                                }
                                                logFirebaseEvent(
                                                    'Buttonfotoperfil_upload_media_to_firebas');
                                                final selectedMedia =
                                                    await selectMediaWithSourceBottomSheet(
                                                  context: context,
                                                  maxWidth: 90.00,
                                                  maxHeight: 90.00,
                                                  imageQuality: 100,
                                                  allowPhoto: true,
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  textColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                );
                                                if (selectedMedia != null &&
                                                    selectedMedia.every((m) =>
                                                        validateFileFormat(
                                                            m.storagePath,
                                                            context))) {
                                                  setState(() => _model
                                                      .isDataUploading = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];

                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        selectedMedia
                                                            .map((m) =>
                                                                FFUploadedFile(
                                                                  name: m
                                                                      .storagePath
                                                                      .split(
                                                                          '/')
                                                                      .last,
                                                                  bytes:
                                                                      m.bytes,
                                                                  height: m
                                                                      .dimensions
                                                                      ?.height,
                                                                  width: m
                                                                      .dimensions
                                                                      ?.width,
                                                                  blurHash: m
                                                                      .blurHash,
                                                                ))
                                                            .toList();

                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                logFirebaseEvent(
                                                    'Buttonfotoperfil_backend_call');

                                                await widget
                                                    .parcampeonato!.reference
                                                    .update(
                                                        createChampionRecordData(
                                                  fotoTorneio:
                                                      _model.uploadedFileUrl,
                                                ));
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'musybp35' /* Atualizar Foto */,
                                              ),
                                              icon: Icon(
                                                Icons.picture_in_picture,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 26.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: const Color(0x0A4B39EF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 9.0,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 8.0, 5.0, 8.0),
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
                                                          'MODIFY_CAMPEONATO_SALVAR_ALTERAÇÕES_DO_C');
                                                      var shouldSetState =
                                                          false;
                                                      if (_model.textFieldCampController
                                                                  .text !=
                                                              '') {
                                                        if (!(widget.parcampeonato
                                                                    ?.modalidadeTorneio !=
                                                                null &&
                                                            widget.parcampeonato
                                                                    ?.modalidadeTorneio !=
                                                                '')) {
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
                                                                    'Escolha a Modalidade'),
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
                                                        if (!(_model.dropDowntorneioValue !=
                                                                null &&
                                                            _model.dropDowntorneioValue !=
                                                                '')) {
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
                                                                    'Tipo de Torneio em Branco!'),
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
                                                        if (!(_model.dropDownparticipanteValue !=
                                                                null &&
                                                            _model.dropDownparticipanteValue !=
                                                                '')) {
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
                                                                    'Tipo de Participação em Branco'),
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
                                                                  'Nome do Campeonato'),
                                                              content: const Text(
                                                                  'Favor informar o Nome do Campeonato!'),
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
                                                          'Button_backend_call');
                                                      _model.docModalidade =
                                                          await ModalidadesRecord
                                                              .getDocumentOnce(functions
                                                                  .modalidadeReference(
                                                                      _model
                                                                          .dropDownmodalidadeValue!)!);
                                                      shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await widget
                                                          .parcampeonato!
                                                          .reference
                                                          .update(
                                                              createChampionRecordData(
                                                        nomecampeonato: _model
                                                            .textFieldCampController
                                                            .text,
                                                        tipoTorneio: _model
                                                            .dropDowntorneioValue,
                                                        tipoParticipa: _model
                                                            .dropDownparticipanteValue,
                                                        dataTorneio:
                                                            _model.datePicked,
                                                        local: _model
                                                            .placePickerValue
                                                            .latLng,
                                                        observaoes: _model
                                                            .textFieldObsController
                                                            .text,
                                                        numberParticipantes: _model
                                                            .countControllerqtdconvValue,
                                                        dataAtualizao:
                                                            getCurrentTimestamp,
                                                        rua: _model
                                                            .placePickerValue
                                                            .address,
                                                        localTorneio: _model
                                                            .placePickerValue
                                                            .name,
                                                        uf: _model
                                                            .placePickerValue
                                                            .state,
                                                        cidade: _model
                                                            .placePickerValue
                                                            .city,
                                                        pais: _model
                                                            .placePickerValue
                                                            .country,
                                                        fotoTorneio: _model
                                                            .uploadedFileUrl,
                                                        idModalidade: widget
                                                            .parcampeonato
                                                            ?.idModalidade,
                                                        modalidadeTorneio:
                                                            _model.docModalidade
                                                                ?.modalidades,
                                                        fotoModalidade: _model
                                                            .docModalidade
                                                            ?.fotos,
                                                        nomeAdmin:
                                                            currentUserDisplayName,
                                                      ));
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                          'ConsultaChampion');

                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                    },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '2allksvy' /* Salvar Alterações do Campeonat... */,
                                              ),
                                              icon: const Icon(
                                                Icons.save_outlined,
                                                size: 15.0,
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
                                                disabledColor:
                                                    const Color(0x40558BF8),
                                              ),
                                              showLoadingIndicator: false,
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
    );
  }
}
