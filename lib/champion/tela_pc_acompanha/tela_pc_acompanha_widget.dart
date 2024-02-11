import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'tela_pc_acompanha_model.dart';
export 'tela_pc_acompanha_model.dart';

class TelaPcAcompanhaWidget extends StatefulWidget {
  const TelaPcAcompanhaWidget({
    super.key,
    required this.parchampionTv,
  });

  final ChampionRecord? parchampionTv;

  @override
  State<TelaPcAcompanhaWidget> createState() => _TelaPcAcompanhaWidgetState();
}

class _TelaPcAcompanhaWidgetState extends State<TelaPcAcompanhaWidget> {
  late TelaPcAcompanhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaPcAcompanhaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TelaPcAcompanha'});
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                desktop: false,
              ))
                Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  child: Container(
                    width: double.infinity,
                    height: 832.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/UNIVERSO_BOTONISTA.png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: FlutterFlowTheme.of(context).alternate,
                          offset: const Offset(0.0, 2.0),
                        )
                      ],
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).info,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 50.0, 5.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TELA_PC_ACOMPANHA_Row_0vgso016_ON_TAP');
                              logFirebaseEvent('Row_navigate_back');
                              context.safePop();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'TELA_PC_ACOMPANHA_Icon_68187byc_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_back');
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.keyboard_return,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'nogr6zl4' /* Esta tela só poderá ser, */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '7q2q2rn5' /* visualizada em PC. */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 20.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Flexible(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Imagem_do_WhatsApp_de_2023-09-23_(s)_12.49.27.jpg',
                        ).image,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'TELA_PC_ACOMPANHA_Icon_qagnvcn5_ON_TAP');
                                    logFirebaseEvent('Icon_navigate_back');
                                    context.safePop();
                                  },
                                  child: Icon(
                                    Icons.keyboard_return,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 45.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'r90myegm' /* Acompanhe seu Campeonato */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Campeonato ${valueOrDefault<String>(
                                        widget.parchampionTv?.nomecampeonato,
                                        '0',
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 979.0,
                                    decoration: const BoxDecoration(),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 600.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  StreamBuilder<
                                                      List<FaseRecord>>(
                                                    stream: queryFaseRecord(
                                                      queryBuilder: (faseRecord) =>
                                                          faseRecord
                                                              .where(
                                                                'idChampion',
                                                                isEqualTo: widget
                                                                    .parchampionTv
                                                                    ?.reference,
                                                              )
                                                              .orderBy(
                                                                  'orderFase'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 10.0,
                                                            height: 10.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 10.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<FaseRecord>
                                                          pageViewFaseRecordList =
                                                          snapshot.data!;
                                                      return SizedBox(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        child: Stack(
                                                          children: [
                                                            PageView.builder(
                                                              controller: _model
                                                                      .pageViewController1 ??=
                                                                  PageController(
                                                                      initialPage: min(
                                                                          0,
                                                                          pageViewFaseRecordList.length -
                                                                              1)),
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              itemCount:
                                                                  pageViewFaseRecordList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  pageViewIndex) {
                                                                final pageViewFaseRecord =
                                                                    pageViewFaseRecordList[
                                                                        pageViewIndex];
                                                                return SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          List<
                                                                              GrupoRecord>>(
                                                                        stream:
                                                                            queryGrupoRecord(
                                                                          queryBuilder: (grupoRecord) => grupoRecord
                                                                              .where(
                                                                                'idFase',
                                                                                isEqualTo: pageViewFaseRecord.reference,
                                                                              )
                                                                              .orderBy('tituloGrupo'),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<GrupoRecord>
                                                                              listViewGrupoRecordList =
                                                                              snapshot.data!;
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                listViewGrupoRecordList.length,
                                                                            itemBuilder:
                                                                                (context, listViewIndex) {
                                                                              final listViewGrupoRecord = listViewGrupoRecordList[listViewIndex];
                                                                              return Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 8.0, 5.0, 8.0),
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
                                                                                      ),
                                                                                    ),
                                                                                    child: SingleChildScrollView(
                                                                                      primary: false,
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('TELA_PC_ACOMPANHA_Icon_123ztpa7_ON_TAP');
                                                                                                    logFirebaseEvent('Icon_page_view');
                                                                                                    await _model.pageViewController1?.previousPage(
                                                                                                      duration: const Duration(milliseconds: 300),
                                                                                                      curve: Curves.ease,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.chevron_left,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
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
                                                                                                Text(
                                                                                                  pageViewFaseRecord.tituloFase,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 16.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('TELA_PC_ACOMPANHA_Icon_wxsct9um_ON_TAP');
                                                                                                    logFirebaseEvent('Icon_page_view');
                                                                                                    await _model.pageViewController1?.nextPage(
                                                                                                      duration: const Duration(milliseconds: 300),
                                                                                                      curve: Curves.ease,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.chevron_right,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Divider(
                                                                                            thickness: 3.0,
                                                                                            indent: 8.0,
                                                                                            endIndent: 8.0,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                          ),
                                                                                          SingleChildScrollView(
                                                                                            primary: false,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                  child: Container(
                                                                                                    width: double.infinity,
                                                                                                    height: 255.0,
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
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      children: [
                                                                                                        StreamBuilder<List<ParticipanteRecord>>(
                                                                                                          stream: queryParticipanteRecord(
                                                                                                            queryBuilder: (participanteRecord) => participanteRecord
                                                                                                                .where(
                                                                                                                  'idGrupo',
                                                                                                                  isEqualTo: listViewGrupoRecord.reference,
                                                                                                                )
                                                                                                                .orderBy('grupoPosicao'),
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
                                                                                                                width: 950.0,
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
                                                                                                                                      'wsf7jryu' /* Classificação */,
                                                                                                                                    ),
                                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                          fontFamily: 'Poppins',
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          fontSize: 16.0,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      fixedWidth: 200.0,
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'ey8yqivb' /* PTS */,
                                                                                                                          ),
                                                                                                                          textAlign: TextAlign.center,
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '3r2byppk' /* PJ */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'cb3lzflw' /* VIT */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'm2g4hd3y' /* EMP */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'atem4wkh' /* DER */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'nvwjwegn' /* GP */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            '2kxh55a9' /* GC */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'dogzlgn1' /* SDG */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'eu01tqhb' /* CG */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'hbkikhlx' /* MCG */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    DataColumn2(
                                                                                                                      label: DefaultTextStyle.merge(
                                                                                                                        softWrap: true,
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'rhg6myew' /* % */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                fontFamily: 'Poppins',
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                fontSize: 16.0,
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
                                                                                                                                  if (dataTableParticipanteRecord.grupoPosicao != 0)
                                                                                                                                    Padding(
                                                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                                      child: Text(
                                                                                                                                        '${dataTableParticipanteRecord.grupoPosicao.toString()}º',
                                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                              fontFamily: 'Poppins',
                                                                                                                                              fontSize: 16.0,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  Padding(
                                                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                                                    child: Container(
                                                                                                                                      width: 35.0,
                                                                                                                                      height: 35.0,
                                                                                                                                      clipBehavior: Clip.antiAlias,
                                                                                                                                      decoration: const BoxDecoration(
                                                                                                                                        shape: BoxShape.circle,
                                                                                                                                      ),
                                                                                                                                      child: CachedNetworkImage(
                                                                                                                                        fadeInDuration: const Duration(milliseconds: 500),
                                                                                                                                        fadeOutDuration: const Duration(milliseconds: 500),
                                                                                                                                        imageUrl: valueOrDefault<String>(
                                                                                                                                          dataTableParticipanteRecord.participantePhoto,
                                                                                                                                          'https://firebasestorage.googleapis.com/v0/b/universo-botonista-flutterflow.appspot.com/o/users%2FzNApvxTWOxZxnlpnYJjrhB9o7bG3%2Fuploads%2F1692451243056000.jpg?alt=media&token=54bd7fc0-31e0-4304-9efe-67d66910d643',
                                                                                                                                        ),
                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  Text(
                                                                                                                                    dataTableParticipanteRecord.participanteApelido.maybeHandleOverflow(
                                                                                                                                      maxChars: 10,
                                                                                                                                      replacement: '…',
                                                                                                                                    ),
                                                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                          fontFamily: 'Poppins',
                                                                                                                                          fontSize: 16.0,
                                                                                                                                        ),
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
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalPartidas.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalVitorias.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalEmpates.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalDerrotas.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalGolsPro.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalGolsContra.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.totalSaldoGols.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              '${dataTableParticipanteRecord.fasePosicao.toString()}º'.maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                            Text(
                                                                                                                              dataTableParticipanteRecord.grupoPosicaoAgrupado.toString().maybeHandleOverflow(maxChars: 3),
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    fontFamily: 'Poppins',
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
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
                                                                                                                                    fontSize: 16.0,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ].map((c) => DataCell(c)).toList())
                                                                                                                      .map((e) => DataRow(cells: e))
                                                                                                                      .toList(),
                                                                                                                  headingRowColor: MaterialStateProperty.all(
                                                                                                                    FlutterFlowTheme.of(context).info,
                                                                                                                  ),
                                                                                                                  headingRowHeight: 50.0,
                                                                                                                  dataRowColor: MaterialStateProperty.all(
                                                                                                                    const Color(0x00000000),
                                                                                                                  ),
                                                                                                                  dataRowHeight: 45.0,
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
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: smooth_page_indicator
                                                                    .SmoothPageIndicator(
                                                                  controller: _model
                                                                          .pageViewController1 ??=
                                                                      PageController(
                                                                          initialPage: min(
                                                                              0,
                                                                              pageViewFaseRecordList.length - 1)),
                                                                  count:
                                                                      pageViewFaseRecordList
                                                                          .length,
                                                                  axisDirection:
                                                                      Axis.horizontal,
                                                                  onDotClicked:
                                                                      (i) async {
                                                                    await _model
                                                                        .pageViewController1!
                                                                        .animateToPage(
                                                                      i,
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              500),
                                                                      curve: Curves
                                                                          .ease,
                                                                    );
                                                                  },
                                                                  effect: smooth_page_indicator
                                                                      .ExpandingDotsEffect(
                                                                    expansionFactor:
                                                                        3.0,
                                                                    spacing:
                                                                        8.0,
                                                                    radius:
                                                                        16.0,
                                                                    dotWidth:
                                                                        8.0,
                                                                    dotHeight:
                                                                        8.0,
                                                                    dotColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    activeDotColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                    paintStyle:
                                                                        PaintingStyle
                                                                            .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
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
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 10.0, 0.0),
                                    child: Container(
                                      width: 400.0,
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
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            offset: const Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child:
                                                StreamBuilder<List<FaseRecord>>(
                                              stream: queryFaseRecord(
                                                queryBuilder: (faseRecord) =>
                                                    faseRecord
                                                        .where(
                                                          'idChampion',
                                                          isEqualTo: widget
                                                              .parchampionTv
                                                              ?.reference,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<FaseRecord>
                                                    pageViewFaseRecordList =
                                                    snapshot.data!;
                                                return SizedBox(
                                                  width: double.infinity,
                                                  height: 691.0,
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    40.0),
                                                        child: PageView.builder(
                                                          controller: _model
                                                                  .pageViewController2 ??=
                                                              PageController(
                                                                  initialPage: min(
                                                                      0,
                                                                      pageViewFaseRecordList
                                                                              .length -
                                                                          1)),
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              pageViewFaseRecordList
                                                                  .length,
                                                          itemBuilder: (context,
                                                              pageViewIndex) {
                                                            final pageViewFaseRecord =
                                                                pageViewFaseRecordList[
                                                                    pageViewIndex];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
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
                                                                              'TELA_PC_ACOMPANHA_Icon_vfe7zkfr_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_page_view');
                                                                          await _model
                                                                              .pageViewController2
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
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          pageViewFaseRecord
                                                                              .tituloFase
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                30,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
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
                                                                              'TELA_PC_ACOMPANHA_Icon_3igebawm_ON_TAP');
                                                                          logFirebaseEvent(
                                                                              'Icon_page_view');
                                                                          await _model
                                                                              .pageViewController2
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
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              5.0),
                                                                  child: StreamBuilder<
                                                                      ChampionRecord>(
                                                                    stream: ChampionRecord.getDocument(widget
                                                                        .parchampionTv!
                                                                        .reference),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 10.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final progressBarChampionRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return LinearPercentIndicator(
                                                                        percent:
                                                                            progressBarChampionRecord.qtdPartidaJogadas /
                                                                                progressBarChampionRecord.ultimaPartida,
                                                                        lineHeight:
                                                                            5.0,
                                                                        animation:
                                                                            true,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        backgroundColor:
                                                                            const Color(0x3F558BF8),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          JogosRecord>>(
                                                                    stream:
                                                                        queryJogosRecord(
                                                                      queryBuilder: (jogosRecord) => jogosRecord
                                                                          .where(
                                                                            'idChampion',
                                                                            isEqualTo:
                                                                                widget.parchampionTv?.reference,
                                                                          )
                                                                          .where(
                                                                            'idFase',
                                                                            isEqualTo:
                                                                                pageViewFaseRecord.reference,
                                                                          )
                                                                          .orderBy('rodadaNumero')
                                                                          .orderBy('grupoNome')
                                                                          .orderBy('mesaNumero'),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            child:
                                                                                SpinKitRipple(
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              size: 10.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<JogosRecord>
                                                                          listViewJogosRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewJogosRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewJogosRecord =
                                                                              listViewJogosRecordList[listViewIndex];
                                                                          return Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                10.0),
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 3.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                    width: 3.0,
                                                                                  ),
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'a59kbreq' /* Rodada Nº:  */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        fontSize: 13.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  listViewJogosRecord.rodadaNumero.toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'Poppins',
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              listViewJogosRecord.grupoNome.maybeHandleOverflow(maxChars: 10),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: 'Poppins',
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      FFLocalizations.of(context).getText(
                                                                                                        'kdgh4133' /* Mesa Nº: */,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontSize: 13.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      listViewJogosRecord.mesaNumero.toString(),
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                            fontFamily: 'Poppins',
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        listViewJogosRecord.partida.toString(),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: const Color(0xC2000000),
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                            child: SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: 100.0,
                                                                                                        height: 28.0,
                                                                                                        decoration: BoxDecoration(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            listViewJogosRecord.mandanteNome.maybeHandleOverflow(
                                                                                                              maxChars: 10,
                                                                                                              replacement: '…',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Material(
                                                                                                    color: Colors.transparent,
                                                                                                    elevation: 1.0,
                                                                                                    shape: RoundedRectangleBorder(
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      width: 94.0,
                                                                                                      height: 28.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: listViewJogosRecord.dataJogo != null ? FlutterFlowTheme.of(context).info : const Color(0x40558BF8),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          width: 2.0,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                        children: [
                                                                                                          if (listViewJogosRecord.dataJogo != null)
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                              child: Text(
                                                                                                                listViewJogosRecord.mandanteGols.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          Text(
                                                                                                            FFLocalizations.of(context).getText(
                                                                                                              'a5eykzqp' /* VS */,
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: 'Poppins',
                                                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                                                  fontWeight: FontWeight.w800,
                                                                                                                  fontStyle: FontStyle.italic,
                                                                                                                ),
                                                                                                          ),
                                                                                                          if (listViewJogosRecord.dataJogo != null)
                                                                                                            Padding(
                                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                listViewJogosRecord.visitanteGols.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: 'Poppins',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Container(
                                                                                                    width: 100.0,
                                                                                                    height: 28.0,
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Padding(
                                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                      child: Text(
                                                                                                        listViewJogosRecord.visitanteNome.maybeHandleOverflow(
                                                                                                          maxChars: 10,
                                                                                                          replacement: '…',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
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
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: smooth_page_indicator
                                                              .SmoothPageIndicator(
                                                            controller: _model
                                                                    .pageViewController2 ??=
                                                                PageController(
                                                                    initialPage: min(
                                                                        0,
                                                                        pageViewFaseRecordList.length -
                                                                            1)),
                                                            count:
                                                                pageViewFaseRecordList
                                                                    .length,
                                                            axisDirection:
                                                                Axis.horizontal,
                                                            onDotClicked:
                                                                (i) async {
                                                              await _model
                                                                  .pageViewController2!
                                                                  .animateToPage(
                                                                i,
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        500),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            effect: smooth_page_indicator
                                                                .ExpandingDotsEffect(
                                                              expansionFactor:
                                                                  3.0,
                                                              spacing: 8.0,
                                                              radius: 16.0,
                                                              dotWidth: 8.0,
                                                              dotHeight: 8.0,
                                                              dotColor: const Color(
                                                                  0x3F558BF8),
                                                              activeDotColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              paintStyle:
                                                                  PaintingStyle
                                                                      .fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
    );
  }
}
