import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consulta_federacoese_clubes_widget.dart'
    show ConsultaFederacoeseClubesWidget;
import 'package:flutter/material.dart';

class ConsultaFederacoeseClubesModel
    extends FlutterFlowModel<ConsultaFederacoeseClubesWidget> {
  ///  Local state fields for this page.

  FederationsRecord? selecFeder;

  ClubeRecord? selectClub;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
