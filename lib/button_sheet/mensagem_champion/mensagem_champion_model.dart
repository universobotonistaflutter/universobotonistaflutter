import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mensagem_champion_widget.dart' show MensagemChampionWidget;
import 'package:flutter/material.dart';

class MensagemChampionModel extends FlutterFlowModel<MensagemChampionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TFMensg widget.
  FocusNode? tFMensgFocusNode;
  TextEditingController? tFMensgController;
  String? Function(BuildContext, String?)? tFMensgControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? listaUsuariosParticipantes;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tFMensgFocusNode?.dispose();
    tFMensgController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
