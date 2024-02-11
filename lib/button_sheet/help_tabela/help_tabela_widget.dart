import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'help_tabela_model.dart';
export 'help_tabela_model.dart';

class HelpTabelaWidget extends StatefulWidget {
  const HelpTabelaWidget({super.key});

  @override
  State<HelpTabelaWidget> createState() => _HelpTabelaWidgetState();
}

class _HelpTabelaWidgetState extends State<HelpTabelaWidget> {
  late HelpTabelaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HelpTabelaModel());

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
                              'HELP_TABELA_COMP_Icon_eotdgv33_ON_TAP');
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
                              '7u5lfua1' /* Informativo */,
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
                  Text(
                    FFLocalizations.of(context).getText(
                      '7pn3twdh' /* Critérios para colocação
1º Nu... */
                      ,
                    ),
                    textAlign: TextAlign.justify,
                    style: FlutterFlowTheme.of(context).labelLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
