import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/button_sheet/cad_novo_user/cad_novo_user_widget.dart';
import '/button_sheet/help_administre/help_administre_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'manutencao_admin_model.dart';
export 'manutencao_admin_model.dart';

class ManutencaoAdminWidget extends StatefulWidget {
  const ManutencaoAdminWidget({super.key});

  @override
  State<ManutencaoAdminWidget> createState() => _ManutencaoAdminWidgetState();
}

class _ManutencaoAdminWidgetState extends State<ManutencaoAdminWidget>
    with TickerProviderStateMixin {
  late ManutencaoAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManutencaoAdminModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ManutencaoAdmin'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => setState(() {}));

    _model.tFPresFocusNode ??= FocusNode();

    _model.tFeMAILFocusNode ??= FocusNode();

    _model.tFWebFocusNode ??= FocusNode();

    _model.telefoneFocusNode ??= FocusNode();

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

    return AuthUserStreamWidget(
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
            return Scaffold(
              body: Center(
                child: SizedBox(
                  width: 10.0,
                  height: 10.0,
                  child: SpinKitRipple(
                    color: FlutterFlowTheme.of(context).info,
                    size: 10.0,
                  ),
                ),
              ),
            );
          }
          List<FederationsRecord> manutencaoAdminFederationsRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final manutencaoAdminFederationsRecord =
              manutencaoAdminFederationsRecordList.isNotEmpty
                  ? manutencaoAdminFederationsRecordList.first
                  : null;
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
                  logFirebaseEvent('MANUTENCAO_ADMIN_arrow_back_rounded_ICN_');
                  logFirebaseEvent('IconButton_navigate_to');

                  context.pushNamed('DrawerMenu');
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'rhmn79k3' /* Manutenção Federações */,
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
                      logFirebaseEvent('MANUTENCAO_ADMIN_Icon_skwbcjbp_ON_TAP');
                      logFirebaseEvent('Icon_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: const Color(0x24558BF8),
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              child: const HelpAdministreWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.help_outline,
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
                            'assets/images/fundo.png',
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).info,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: false,
                                    labelStyle:
                                        FlutterFlowTheme.of(context).labelLarge,
                                    unselectedLabelStyle: const TextStyle(),
                                    labelColor:
                                        FlutterFlowTheme.of(context).info,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                    borderColor:
                                        FlutterFlowTheme.of(context).info,
                                    unselectedBorderColor:
                                        FlutterFlowTheme.of(context).primary,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    elevation: 1.0,
                                    buttonMargin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                    padding: const EdgeInsets.all(4.0),
                                    tabs: [
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '1pluvppg' /* Federação */,
                                        ),
                                        icon: const FaIcon(
                                          FontAwesomeIcons.tradeFederation,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '2ei669ux' /* Atletas */,
                                        ),
                                        icon: const Icon(
                                          Icons.font_download_outlined,
                                        ),
                                      ),
                                      Tab(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '6wp2au0j' /* Sem Clube */,
                                        ),
                                        icon: const FaIcon(
                                          FontAwesomeIcons.universalAccess,
                                        ),
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {},
                                        () async {},
                                        () async {}
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          constraints: const BoxConstraints(
                                            maxWidth: 550.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/fundo.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 85.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            2.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        manutencaoAdminFederationsRecord!
                                                                            .foto,
                                                                        width:
                                                                            45.0,
                                                                        height:
                                                                            45.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            AutoSizeText(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            manutencaoAdminFederationsRecord.nome,
                                                                            '0',
                                                                          ),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'ncrirpmj' /* Assinatura expira em: */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      dateTimeFormat(
                                                                        'd/M/y',
                                                                        manutencaoAdminFederationsRecord.assinaturaExpira!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                12.0,
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
                                                    SingleChildScrollView(
                                                      primary: false,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (getCurrentTimestamp <=
                                                              manutencaoAdminFederationsRecord.assinaturaExpira!)
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/fundo_transparente.png',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Visibility(
                                                                visible: manutencaoAdminFederationsRecord
                                                                        .adminFederer
                                                                        .contains(
                                                                            currentUserReference) ==
                                                                    true,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  primary:
                                                                      false,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            10.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                '43b2wu5j' /* Presidente: */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.tFPresController ??= TextEditingController(
                                                                                    text: manutencaoAdminFederationsRecord.nomePresidente,
                                                                                  ),
                                                                                  focusNode: _model.tFPresFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.tFPresController',
                                                                                    const Duration(milliseconds: 2000),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      'vode8ax4' /* Presidente */,
                                                                                    ),
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 15.0,
                                                                                        ),
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
                                                                                    suffixIcon: _model.tFPresController!.text.isNotEmpty
                                                                                        ? InkWell(
                                                                                            onTap: () async {
                                                                                              _model.tFPresController?.clear();
                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.clear,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          )
                                                                                        : null,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                  validator: _model.tFPresControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'izfsiih5' /* E-mail: */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.tFeMAILController ??= TextEditingController(
                                                                                    text: manutencaoAdminFederationsRecord.email,
                                                                                  ),
                                                                                  focusNode: _model.tFeMAILFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.tFeMAILController',
                                                                                    const Duration(milliseconds: 2000),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      'z9tqpjnh' /* E-Mail */,
                                                                                    ),
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 15.0,
                                                                                        ),
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
                                                                                    suffixIcon: _model.tFeMAILController!.text.isNotEmpty
                                                                                        ? InkWell(
                                                                                            onTap: () async {
                                                                                              _model.tFeMAILController?.clear();
                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.clear,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          )
                                                                                        : null,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                  validator: _model.tFeMAILControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'tehf80gl' /* Web: */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.tFWebController ??= TextEditingController(
                                                                                    text: manutencaoAdminFederationsRecord.site,
                                                                                  ),
                                                                                  focusNode: _model.tFWebFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.tFWebController',
                                                                                    const Duration(milliseconds: 2000),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      'edm8pgx9' /* Website */,
                                                                                    ),
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 15.0,
                                                                                        ),
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
                                                                                    suffixIcon: _model.tFWebController!.text.isNotEmpty
                                                                                        ? InkWell(
                                                                                            onTap: () async {
                                                                                              _model.tFWebController?.clear();
                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.clear,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          )
                                                                                        : null,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                  validator: _model.tFWebControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'pq5yj6cu' /* Confirme seu Fone: */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.telefoneController ??= TextEditingController(
                                                                                    text: manutencaoAdminFederationsRecord.phone,
                                                                                  ),
                                                                                  focusNode: _model.telefoneFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.telefoneController',
                                                                                    const Duration(milliseconds: 2000),
                                                                                    () => setState(() {}),
                                                                                  ),
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: FFLocalizations.of(context).getText(
                                                                                      'ujkxtjws' /* Telefone */,
                                                                                    ),
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          fontSize: 14.0,
                                                                                        ),
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
                                                                                    suffixIcon: _model.telefoneController!.text.isNotEmpty
                                                                                        ? InkWell(
                                                                                            onTap: () async {
                                                                                              _model.telefoneController?.clear();
                                                                                              setState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.clear,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          )
                                                                                        : null,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                  keyboardType: TextInputType.number,
                                                                                  validator: _model.telefoneControllerValidator.asValidator(context),
                                                                                  inputFormatters: [
                                                                                    _model.telefoneMask
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: StreamBuilder<List<ModalidadesRecord>>(
                                                                                stream: queryModalidadesRecord(
                                                                                  queryBuilder: (modalidadesRecord) => modalidadesRecord.orderBy('Seq'),
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
                                                                                  List<ModalidadesRecord> rowModalidadesRecordList = snapshot.data!;
                                                                                  return SingleChildScrollView(
                                                                                    scrollDirection: Axis.horizontal,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(rowModalidadesRecordList.length, (rowIndex) {
                                                                                        final rowModalidadesRecord = rowModalidadesRecordList[rowIndex];
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            height: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      logFirebaseEvent('MANUTENCAO_ADMIN_Image_znnen36i_ON_TAP');
                                                                                                      logFirebaseEvent('Image_backend_call');

                                                                                                      await manutencaoAdminFederationsRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'Id_Modalidade': FieldValue.arrayUnion([
                                                                                                              rowModalidadesRecord.reference
                                                                                                            ]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      if (!rowModalidadesRecord.federacoesModalidade.contains(rowModalidadesRecord.reference)) {
                                                                                                        logFirebaseEvent('Image_backend_call');

                                                                                                        await rowModalidadesRecord.reference.update({
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'federacoesModalidade': FieldValue.arrayUnion([
                                                                                                                manutencaoAdminFederationsRecord.reference
                                                                                                              ]),
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                      }
                                                                                                    },
                                                                                                    onDoubleTap: () async {
                                                                                                      logFirebaseEvent('MANUTENCAO_ADMIN_Image_znnen36i_ON_DOUBL');
                                                                                                      logFirebaseEvent('Image_backend_call');

                                                                                                      await manutencaoAdminFederationsRecord.reference.update({
                                                                                                        ...mapToFirestore(
                                                                                                          {
                                                                                                            'Id_Modalidade': FieldValue.arrayRemove([
                                                                                                              rowModalidadesRecord.reference
                                                                                                            ]),
                                                                                                          },
                                                                                                        ),
                                                                                                      });
                                                                                                      if (!rowModalidadesRecord.federacoesModalidade.contains(rowModalidadesRecord.reference)) {
                                                                                                        logFirebaseEvent('Image_backend_call');

                                                                                                        await rowModalidadesRecord.reference.update({
                                                                                                          ...mapToFirestore(
                                                                                                            {
                                                                                                              'federacoesModalidade': FieldValue.arrayRemove([
                                                                                                                manutencaoAdminFederationsRecord.reference
                                                                                                              ]),
                                                                                                            },
                                                                                                          ),
                                                                                                        });
                                                                                                      }
                                                                                                    },
                                                                                                    child: ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      child: CachedNetworkImage(
                                                                                                        fadeInDuration: const Duration(milliseconds: 500),
                                                                                                        fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                        imageUrl: manutencaoAdminFederationsRecord.idModalidade.contains(rowModalidadesRecord.reference) == true ? rowModalidadesRecord.fotos : rowModalidadesRecord.fotospb,
                                                                                                        width: 70.0,
                                                                                                        height: 70.0,
                                                                                                        fit: BoxFit.fitWidth,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    rowModalidadesRecord.modalidades,
                                                                                                    textAlign: TextAlign.center,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          fontSize: 10.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                logFirebaseEvent('MANUTENCAO_ADMIN_SALVAR_AS_ALTERAÇÕES_BT');
                                                                                logFirebaseEvent('Button_backend_call');

                                                                                await manutencaoAdminFederationsRecord.reference.update(createFederationsRecordData(
                                                                                  nomePresidente: _model.tFPresController.text,
                                                                                  site: _model.tFWebController.text,
                                                                                  email: _model.tFeMAILController.text,
                                                                                  phone: _model.telefoneController.text,
                                                                                ));
                                                                                logFirebaseEvent('Button_navigate_back');
                                                                                context.safePop();
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'vazh7dge' /* Salvar as Alterações */,
                                                                              ),
                                                                              icon: const Icon(
                                                                                Icons.save_outlined,
                                                                                size: 15.0,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            5.0)),
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
                                              if (valueOrDefault(
                                                      currentUserDocument
                                                          ?.assinatura,
                                                      0) <=
                                                  1)
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 1.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: Image.asset(
                                                              'assets/images/fundo_transparente.png',
                                                            ).image,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            width: 3.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2.0,
                                                                        shape:
                                                                            const RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(0.0),
                                                                            topLeft:
                                                                                Radius.circular(25.0),
                                                                            topRight:
                                                                                Radius.circular(25.0),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                offset: const Offset(0.0, 2.0),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ddq6iay5' /* Área exclusiva de Assinantes */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontWeight: FontWeight.w500,
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
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            5.0),
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
                                                                            'MANUTENCAO_ADMIN_Container_y6o0xe9x_ON_T');
                                                                        logFirebaseEvent(
                                                                            'Container_navigate_to');

                                                                        context.pushNamed(
                                                                            'PlanodeAssinatura');
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                RichText(
                                                                              textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'cl2x8vs6' /* Clique aqui e torne-se um Assi... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Poppins',
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '9ntgk4ak' /*  Torne-se um usuário Prata e t... */,
                                                                                    ),
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowAdBanner(
                                                                width: 320.0,
                                                                height: 100.0,
                                                                showsTestAd:
                                                                    false,
                                                                androidAdUnitID:
                                                                    'ca-app-pub-9245979386423612/1041138407',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: const BoxConstraints(
                                          maxWidth: 550.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/fundo.png',
                                            ).image,
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 5.0),
                                          child: StreamBuilder<
                                              List<FederationsRecord>>(
                                            stream: queryFederationsRecord(
                                              queryBuilder:
                                                  (federationsRecord) =>
                                                      federationsRecord.where(
                                                'usuariosFederation',
                                                arrayContains:
                                                    currentUserReference,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 10.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<FederationsRecord>
                                                  containerFederationsRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final containerFederationsRecord =
                                                  containerFederationsRecordList
                                                          .isNotEmpty
                                                      ? containerFederationsRecordList
                                                          .first
                                                      : null;
                                              return Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      width: 3.0,
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
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                                    containerFederationsRecord!
                                                                        .foto,
                                                                width: 40.0,
                                                                height: 40.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerFederationsRecord
                                                                        .nome,
                                                                    '0',
                                                                  ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            16.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Divider(
                                                        thickness: 3.0,
                                                        indent: 5.0,
                                                        endIndent: 5.0,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (valueOrDefault<
                                                                    bool>(
                                                                  (containerFederationsRecord.assinaturaExpira! >
                                                                          getCurrentTimestamp) &&
                                                                      (valueOrDefault(
                                                                              currentUserDocument?.assinatura,
                                                                              0) >=
                                                                          2),
                                                                  true,
                                                                ))
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                Image.asset(
                                                                              'assets/images/fundo_transparente.png',
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          primary:
                                                                              false,
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '3ftu2ho0' /* Lista de Atletas Federados */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Builder(
                                                                                builder: (context) {
                                                                                  final varfederer = containerFederationsRecord.usuariosFederation.toList() ?? [];
                                                                                  return ListView.builder(
                                                                                    padding: EdgeInsets.zero,
                                                                                    primary: false,
                                                                                    shrinkWrap: true,
                                                                                    scrollDirection: Axis.vertical,
                                                                                    itemCount: varfederer.length,
                                                                                    itemBuilder: (context, varfedererIndex) {
                                                                                      final varfedererItem = varfederer[varfedererIndex];
                                                                                      return Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                        child: StreamBuilder<UserRecord>(
                                                                                          stream: UserRecord.getDocument(varfedererItem),
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
                                                                                            final rowUserRecord = snapshot.data!;
                                                                                            return Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 45.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: const Color(0x15558BF8),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          width: 3.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: 25.0,
                                                                                                                    height: 25.0,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      borderRadius: BorderRadius.circular(4.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: ClipRRect(
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                      child: CachedNetworkImage(
                                                                                                                        fadeInDuration: const Duration(milliseconds: 500),
                                                                                                                        fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                                        imageUrl: rowUserRecord.photoClub,
                                                                                                                        width: 25.0,
                                                                                                                        height: 25.0,
                                                                                                                        fit: BoxFit.cover,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    rowUserRecord.displayName,
                                                                                                                    '0',
                                                                                                                  ),
                                                                                                                  maxLines: 2,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'Poppins',
                                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            StreamBuilder<List<ClubeRecord>>(
                                                                                                              stream: queryClubeRecord(
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
                                                                                                                List<ClubeRecord> rowClubeRecordList = snapshot.data!;
                                                                                                                // Return an empty Container when the item does not exist.
                                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                                  return Container();
                                                                                                                }
                                                                                                                final rowClubeRecord = rowClubeRecordList.isNotEmpty ? rowClubeRecordList.first : null;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    if (rowUserRecord.assinatura >= 2)
                                                                                                                      Theme(
                                                                                                                        data: ThemeData(
                                                                                                                          checkboxTheme: CheckboxThemeData(
                                                                                                                            visualDensity: VisualDensity.compact,
                                                                                                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                                            shape: RoundedRectangleBorder(
                                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          unselectedWidgetColor: FlutterFlowTheme.of(context).info,
                                                                                                                        ),
                                                                                                                        child: Checkbox(
                                                                                                                          value: _model.checkboxValueMap1[varfedererItem] ??= containerFederationsRecord.adminFederer.contains(rowUserRecord.reference),
                                                                                                                          onChanged: (newValue) async {
                                                                                                                            setState(() => _model.checkboxValueMap1[varfedererItem] = newValue!);
                                                                                                                            if (newValue!) {
                                                                                                                              logFirebaseEvent('MANUTENCAO_ADMIN_Checkbox_mbc71vzh_ON_TO');
                                                                                                                              logFirebaseEvent('Checkbox_backend_call');

                                                                                                                              await containerFederationsRecord.reference.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'adminFederer': FieldValue.arrayUnion([rowUserRecord.reference]),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });
                                                                                                                            } else {
                                                                                                                              logFirebaseEvent('MANUTENCAO_ADMIN_Checkbox_mbc71vzh_ON_TO');
                                                                                                                              logFirebaseEvent('Checkbox_backend_call');

                                                                                                                              await containerFederationsRecord.reference.update({
                                                                                                                                ...mapToFirestore(
                                                                                                                                  {
                                                                                                                                    'adminFederer': FieldValue.arrayRemove([rowUserRecord.reference]),
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              });
                                                                                                                            }
                                                                                                                          },
                                                                                                                          activeColor: FlutterFlowTheme.of(context).info,
                                                                                                                          checkColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (containerFederationsRecord.adminFederer.contains(currentUserReference) ?? true)
                                                                                                                      InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          logFirebaseEvent('MANUTENCAO_ADMIN_Icon_mw902b4h_ON_TAP');
                                                                                                                          logFirebaseEvent('Icon_navigate_to');

                                                                                                                          context.pushNamed(
                                                                                                                            'ManutAtleta',
                                                                                                                            queryParameters: {
                                                                                                                              'dadosatleta': serializeParam(
                                                                                                                                rowUserRecord,
                                                                                                                                ParamType.Document,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                            extra: <String, dynamic>{
                                                                                                                              'dadosatleta': rowUserRecord,
                                                                                                                            },
                                                                                                                          );
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.mode_edit_outlined,
                                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                                          size: 24.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (containerFederationsRecord.adminFederer.contains(currentUserReference) ?? true)
                                                                                                                      InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          logFirebaseEvent('MANUTENCAO_ADMIN_Icon_sm748s8n_ON_TAP');
                                                                                                                          logFirebaseEvent('Icon_alert_dialog');
                                                                                                                          var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                context: context,
                                                                                                                                builder: (alertDialogContext) {
                                                                                                                                  return AlertDialog(
                                                                                                                                    title: const Text('Atenção!'),
                                                                                                                                    content: Text('Deseja remover a federação do Atleta ${rowUserRecord.displayName}'),
                                                                                                                                    actions: [
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                        child: const Text('NÃO'),
                                                                                                                                      ),
                                                                                                                                      TextButton(
                                                                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                        child: const Text('SIM'),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ) ??
                                                                                                                              false;
                                                                                                                          if (confirmDialogResponse) {
                                                                                                                            logFirebaseEvent('Icon_backend_call');

                                                                                                                            await rowUserRecord.reference.update({
                                                                                                                              ...mapToFirestore(
                                                                                                                                {
                                                                                                                                  'photo_feder': FieldValue.delete(),
                                                                                                                                  'Federation': FieldValue.delete(),
                                                                                                                                  'nome_federer': FieldValue.delete(),
                                                                                                                                  'nome_club': FieldValue.delete(),
                                                                                                                                  'photo_club': FieldValue.delete(),
                                                                                                                                  'Club': FieldValue.delete(),
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            });
                                                                                                                          } else {
                                                                                                                            return;
                                                                                                                          }

                                                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                                                          await manutencaoAdminFederationsRecord.reference.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'usuariosFederation': FieldValue.arrayRemove([rowUserRecord.reference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                          logFirebaseEvent('Icon_backend_call');

                                                                                                                          await rowClubeRecord!.reference.update({
                                                                                                                            ...mapToFirestore(
                                                                                                                              {
                                                                                                                                'usuariosClube': FieldValue.arrayRemove([rowUserRecord.reference]),
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          });
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.person_remove_outlined,
                                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                                          size: 24.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (containerFederationsRecord.adminFederer.contains(currentUserReference) ?? true)
                                                                                                                      InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          logFirebaseEvent('MANUTENCAO_ADMIN_Icon_mcg6t92v_ON_TAP');
                                                                                                                          logFirebaseEvent('Icon_bottom_sheet');
                                                                                                                          await showModalBottomSheet(
                                                                                                                            isScrollControlled: true,
                                                                                                                            backgroundColor: Colors.transparent,
                                                                                                                            barrierColor: const Color(0x15558BF8),
                                                                                                                            useSafeArea: true,
                                                                                                                            context: context,
                                                                                                                            builder: (context) {
                                                                                                                              return Padding(
                                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                                child: SizedBox(
                                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.6,
                                                                                                                                  child: const CadNovoUserWidget(),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ).then((value) => safeSetState(() => _model.refParticipanteNovoSelecionado = value));

                                                                                                                          if (_model.refParticipanteNovoSelecionado?.email != null && _model.refParticipanteNovoSelecionado?.email != '') {
                                                                                                                            logFirebaseEvent('Icon_show_snack_bar');
                                                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                              SnackBar(
                                                                                                                                content: Text(
                                                                                                                                  'Passei por aqui!',
                                                                                                                                  style: TextStyle(
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                duration: const Duration(milliseconds: 4000),
                                                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          }

                                                                                                                          setState(() {});
                                                                                                                        },
                                                                                                                        child: Icon(
                                                                                                                          Icons.person_add_alt_1_outlined,
                                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                                          size: 24.0,
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
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                              ),
                                                                              SingleChildScrollView(
                                                                                scrollDirection: Axis.horizontal,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '496hlclo' /* Administradores */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontWeight: FontWeight.w600,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: double.infinity,
                                                                                height: 100.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final varadmin = containerFederationsRecord.adminFederer.map((e) => e).toList().toList() ?? [];
                                                                                    return SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(varadmin.length, (varadminIndex) {
                                                                                          final varadminItem = varadmin[varadminIndex];
                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            height: 45.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: const Color(0x15558BF8),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                width: 3.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                              child: StreamBuilder<UserRecord>(
                                                                                                stream: UserRecord.getDocument(varadminItem),
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
                                                                                                  final rowUserRecord = snapshot.data!;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 31.0,
                                                                                                        height: 31.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          shape: BoxShape.circle,
                                                                                                          border: Border.all(
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          decoration: const BoxDecoration(
                                                                                                            shape: BoxShape.circle,
                                                                                                          ),
                                                                                                          child: CachedNetworkImage(
                                                                                                            fadeInDuration: const Duration(milliseconds: 500),
                                                                                                            fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                            imageUrl: valueOrDefault<String>(
                                                                                                              rowUserRecord.photoUrl,
                                                                                                              'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                                                                                                            ),
                                                                                                            fit: BoxFit.cover,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            rowUserRecord.displayName,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          maxLines: 2,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: 'Poppins',
                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }).divide(const SizedBox(height: 3.0)),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.assinatura,
                                                                        0) <=
                                                                    1)
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            1.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            image:
                                                                                DecorationImage(
                                                                              fit: BoxFit.cover,
                                                                              image: Image.asset(
                                                                                'assets/images/fundo_transparente.png',
                                                                              ).image,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 3.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Flexible(
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                        child: Material(
                                                                                          color: Colors.transparent,
                                                                                          elevation: 2.0,
                                                                                          shape: const RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(25.0),
                                                                                              topRight: Radius.circular(25.0),
                                                                                            ),
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            height: 40.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 4.0,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  offset: const Offset(0.0, 2.0),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: const BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                topLeft: Radius.circular(25.0),
                                                                                                topRight: Radius.circular(25.0),
                                                                                              ),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'dyxy5r1r' /* Área exclusiva de Assinantes */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Poppins',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      fontWeight: FontWeight.w500,
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
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('MANUTENCAO_ADMIN_Container_pitvlugq_ON_T');
                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                          context.pushNamed('PlanodeAssinatura');
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          height: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                              child: RichText(
                                                                                                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                                text: TextSpan(
                                                                                                  children: [
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'u4o0dear' /* Clique aqui e torne-se um Assi... */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                          ),
                                                                                                    ),
                                                                                                    TextSpan(
                                                                                                      text: FFLocalizations.of(context).getText(
                                                                                                        'cp0hsopy' /*  Torne-se um usuário Prata e t... */,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                                              const Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                                                                                child: FlutterFlowAdBanner(
                                                                                  width: 320.0,
                                                                                  height: 100.0,
                                                                                  showsTestAd: false,
                                                                                  androidAdUnitID: 'ca-app-pub-9245979386423612/1041138407',
                                                                                ),
                                                                              ),
                                                                            ],
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
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                width: 3.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
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
                                                          imageUrl: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.photoFeder,
                                                              ''),
                                                          width: 40.0,
                                                          height: 40.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: AutoSizeText(
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.nomeFederer,
                                                                ''),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 3.0,
                                                  indent: 5.0,
                                                  endIndent: 5.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            List<UserRecord>>(
                                                          stream:
                                                              queryUserRecord(
                                                            queryBuilder:
                                                                (userRecord) =>
                                                                    userRecord
                                                                        .orderBy(
                                                                            'display_name'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 10.0,
                                                                  height: 10.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                    size: 10.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<UserRecord>
                                                                listViewUserRecordList =
                                                                snapshot.data!;
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  listViewUserRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  listViewIndex) {
                                                                final listViewUserRecord =
                                                                    listViewUserRecordList[
                                                                        listViewIndex];
                                                                return Visibility(
                                                                  visible:
                                                                      listViewUserRecord
                                                                              .federation ==
                                                                          null,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.asset(
                                                                            'assets/images/fundodetela.png',
                                                                          ).image,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                                                                                        child: Container(
                                                                                          width: 40.0,
                                                                                          height: 40.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: const BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(2.0),
                                                                                              topRight: Radius.circular(0.0),
                                                                                            ),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                            child: Image.network(
                                                                                              listViewUserRecord.photoUrl,
                                                                                              width: 40.0,
                                                                                              height: 40.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewUserRecord.displayName.maybeHandleOverflow(
                                                                                                      maxChars: 25,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    listViewUserRecord.email.maybeHandleOverflow(
                                                                                                      maxChars: 40,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Poppins',
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          fontSize: 12.0,
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
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (manutencaoAdminFederationsRecord.usuariosFederation.contains(currentUserReference) == true)
                                                                                Theme(
                                                                                  data: ThemeData(
                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                      visualDensity: VisualDensity.compact,
                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                      shape: RoundedRectangleBorder(
                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                      ),
                                                                                    ),
                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).info,
                                                                                  ),
                                                                                  child: Checkbox(
                                                                                    value: _model.checkboxValueMap2[listViewUserRecord] ??= false,
                                                                                    onChanged: (newValue) async {
                                                                                      setState(() => _model.checkboxValueMap2[listViewUserRecord] = newValue!);
                                                                                      if (newValue!) {
                                                                                        logFirebaseEvent('MANUTENCAO_ADMIN_Checkbox_cm0dxt5s_ON_TO');
                                                                                        logFirebaseEvent('Checkbox_backend_call');

                                                                                        await manutencaoAdminFederationsRecord.reference.update({
                                                                                          ...mapToFirestore(
                                                                                            {
                                                                                              'usuariosFederation': FieldValue.arrayUnion([
                                                                                                listViewUserRecord.reference
                                                                                              ]),
                                                                                            },
                                                                                          ),
                                                                                        });
                                                                                        logFirebaseEvent('Checkbox_backend_call');

                                                                                        await listViewUserRecord.reference.update(createUserRecordData(
                                                                                          federation: currentUserDocument?.federation,
                                                                                          photoFeder: valueOrDefault(currentUserDocument?.photoFeder, ''),
                                                                                          nomeFederer: valueOrDefault(currentUserDocument?.nomeFederer, ''),
                                                                                        ));
                                                                                      }
                                                                                    },
                                                                                    activeColor: FlutterFlowTheme.of(context).info,
                                                                                    checkColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
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
                                                  ),
                                                ),
                                                if (valueOrDefault(
                                                        currentUserDocument
                                                            ?.assinatura,
                                                        0) <=
                                                    1)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 1.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/fundo_transparente.png',
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Material(
                                                                          color:
                                                                              Colors.transparent,
                                                                          elevation:
                                                                              2.0,
                                                                          shape:
                                                                              const RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(25.0),
                                                                              topRight: Radius.circular(25.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 4.0,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  offset: const Offset(0.0, 2.0),
                                                                                )
                                                                              ],
                                                                              borderRadius: const BorderRadius.only(
                                                                                bottomLeft: Radius.circular(0.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(25.0),
                                                                                topRight: Radius.circular(25.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'lfsz2i7e' /* Área exclusiva de Assinantes */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontWeight: FontWeight.w500,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          logFirebaseEvent(
                                                                              'MANUTENCAO_ADMIN_Container_uqqz9elq_ON_T');
                                                                          logFirebaseEvent(
                                                                              'Container_navigate_to');

                                                                          context
                                                                              .pushNamed('PlanodeAssinatura');
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: RichText(
                                                                                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'm767c2g4' /* Clique aqui e torne-se um Assi... */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Poppins',
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'o1qwr9ln' /*  Torne-se um usuário Prata e t... */,
                                                                                      ),
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
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
                                                              const Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    FlutterFlowAdBanner(
                                                                  width: 320.0,
                                                                  height: 100.0,
                                                                  showsTestAd:
                                                                      false,
                                                                  androidAdUnitID:
                                                                      'ca-app-pub-9245979386423612/1041138407',
                                                                ),
                                                              ),
                                                            ],
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
          );
        },
      ),
    );
  }
}
