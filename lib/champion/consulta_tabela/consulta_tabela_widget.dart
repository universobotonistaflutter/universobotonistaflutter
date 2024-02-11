import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'consulta_tabela_model.dart';
export 'consulta_tabela_model.dart';

class ConsultaTabelaWidget extends StatefulWidget {
  const ConsultaTabelaWidget({
    super.key,
    required this.docChampion,
  });

  final ChampionRecord? docChampion;

  @override
  State<ConsultaTabelaWidget> createState() => _ConsultaTabelaWidgetState();
}

class _ConsultaTabelaWidgetState extends State<ConsultaTabelaWidget> {
  late ConsultaTabelaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConsultaTabelaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConsultaTabela'});
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
            logFirebaseEvent('CONSULTA_TABELA_arrow_back_rounded_ICN_O');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'a1vicpc6' /* Consulta Tabelas */,
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
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
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
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
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
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
                            List<FaseRecord> pageViewFaseRecordList =
                                snapshot.data!;
                            return SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _model.pageViewController ??=
                                        PageController(
                                            initialPage: min(
                                                0,
                                                pageViewFaseRecordList.length -
                                                    1)),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pageViewFaseRecordList.length,
                                    itemBuilder: (context, pageViewIndex) {
                                      final pageViewFaseRecord =
                                          pageViewFaseRecordList[pageViewIndex];
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 8.0, 5.0, 5.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: const BoxConstraints(
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
                                                        color:
                                                            Color(0x371C4494),
                                                        offset:
                                                            Offset(0.0, 2.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 3.0,
                                                    ),
                                                  ),
                                                  child: SingleChildScrollView(
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
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 40.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
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
                                                                              'CONSULTA_TABELA_Icon_pr0g07t3_ON_TAP');
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        pageViewFaseRecord
                                                                            .tituloFase
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              20,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              fontSize: 16.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
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
                                                                              'CONSULTA_TABELA_Icon_gc22j9n8_ON_TAP');
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          size:
                                                                              24.0,
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
                                            StreamBuilder<List<GrupoRecord>>(
                                              stream: queryGrupoRecord(
                                                queryBuilder: (grupoRecord) =>
                                                    grupoRecord
                                                        .where(
                                                          'idFase',
                                                          isEqualTo:
                                                              pageViewFaseRecord
                                                                  .reference,
                                                        )
                                                        .orderBy('tituloGrupo'),
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
                                                  itemBuilder:
                                                      (context, listViewIndex) {
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
                                                                  5.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 3.0,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.asset(
                                                                'assets/images/fundo_transparente.png',
                                                              ).image,
                                                            ),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                                offset: const Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        primary:
                                                                            false,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Container(
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
                                                                                    Expanded(
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
                                                                                                                    'boyhpjhx' /* Classificação */,
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
                                                                                                          '01jil0ll' /* PTS */,
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
                                                                                                          '81tc1a8j' /* PJ */,
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
                                                                                                          '7mbkpref' /* VIT */,
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
                                                                                                          'k7h1tqr4' /* EMP */,
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
                                                                                                          '833ex4s2' /* DER */,
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
                                                                                                          'row1gjtz' /* GP */,
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
                                                                                                          'cmlwkzvj' /* GC */,
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
                                                                                                          'xiqb3pzx' /* SDG */,
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
                                                                                                          'nxvr5h3h' /* CG */,
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
                                                                                                          'nddn82kc' /* MCG */,
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
                                                                                                          'x1ruyld0' /* % */,
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
                                                                                                                      logFirebaseEvent('CONSULTA_TABELA_Icon_ez6tbfd6_ON_TAP');
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
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: smooth_page_indicator
                                        .SmoothPageIndicator(
                                      controller: _model.pageViewController ??=
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
                                          duration: const Duration(milliseconds: 500),
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
                                            FlutterFlowTheme.of(context).info,
                                        activeDotColor:
                                            FlutterFlowTheme.of(context).info,
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
