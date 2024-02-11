import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cadnewuser_widget.dart' show CadnewuserWidget;
import 'package:flutter/material.dart';

class CadnewuserModel extends FlutterFlowModel<CadnewuserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tfEmailConvidado widget.
  FocusNode? tfEmailConvidadoFocusNode;
  TextEditingController? tfEmailConvidadoController;
  String? Function(BuildContext, String?)? tfEmailConvidadoControllerValidator;
  // State field(s) for tfNome widget.
  FocusNode? tfNomeFocusNode;
  TextEditingController? tfNomeController;
  String? Function(BuildContext, String?)? tfNomeControllerValidator;
  // Stores action output result for [Custom Action - cadastrarUsuario] action in IconButton widget.
  UserRecord? refUsuarioCadastrado;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfEmailConvidadoFocusNode?.dispose();
    tfEmailConvidadoController?.dispose();

    tfNomeFocusNode?.dispose();
    tfNomeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
