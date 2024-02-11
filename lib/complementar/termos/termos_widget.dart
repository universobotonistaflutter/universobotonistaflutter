import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'termos_model.dart';
export 'termos_model.dart';

class TermosWidget extends StatefulWidget {
  const TermosWidget({super.key});

  @override
  State<TermosWidget> createState() => _TermosWidgetState();
}

class _TermosWidgetState extends State<TermosWidget>
    with TickerProviderStateMixin {
  late TermosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Termos'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
              logFirebaseEvent('TERMOS_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'nvadw14r' /* Termos de Uso e Privacidade */,
            ),
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
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 848.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/fundo_transparente.png',
                      ).image,
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    constraints: const BoxConstraints(
                      maxWidth: 550.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).info,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).info,
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            unselectedLabelStyle: const TextStyle(),
                            indicatorColor: FlutterFlowTheme.of(context).info,
                            padding: const EdgeInsets.all(4.0),
                            tabs: [
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'i5e6to6q' /* Termo de Uso */,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'asn9ys6h' /* Politica de Privacidade */,
                                ),
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'f6okcvfj' /* Termo de Uso */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 25.0,
                                        ),
                                  ),
                                  const FlutterFlowPdfViewer(
                                    assetPath:
                                        'assets/pdfs/Termos_de_Servico.pdf',
                                    width: double.infinity,
                                    height: 727.0,
                                    horizontalScroll: false,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'uz74vi7d' /* Politica de Privacidade */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 25.0,
                                        ),
                                  ),
                                  const Expanded(
                                    child: FlutterFlowPdfViewer(
                                      assetPath:
                                          'assets/pdfs/Politica_de_Privacidade.pdf',
                                      width: double.infinity,
                                      height: 779.0,
                                      horizontalScroll: false,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
