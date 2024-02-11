import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cabecatabela_model.dart';
export 'cabecatabela_model.dart';

class CabecatabelaWidget extends StatefulWidget {
  const CabecatabelaWidget({
    super.key,
    String? parameter1,
    required this.parameter2,
    required this.parameter3,
  }) : parameter1 = parameter1 ??
            'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png';

  final String parameter1;
  final String? parameter2;
  final String? parameter3;

  @override
  State<CabecatabelaWidget> createState() => _CabecatabelaWidgetState();
}

class _CabecatabelaWidgetState extends State<CabecatabelaWidget> {
  late CabecatabelaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabecatabelaModel());

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 550.0,
          ),
          decoration: BoxDecoration(
            color: const Color(0x00D41818),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/fundodetela.png',
              ).image,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x001C4494),
                offset: Offset(0.0, 2.0),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 0.0, 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.parameter1,
                            'https://cdn.icon-icons.com/icons2/1141/PNG/512/1486395884-account_80606.png',
                          ),
                          width: 70.0,
                          height: 50.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 10.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.parameter2,
                              '0',
                            ).maybeHandleOverflow(maxChars: 25),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.parameter3,
                            'null',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).info,
                                  ),
                        ),
                      ],
                    ),
                  ].divide(const SizedBox(width: 15.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
