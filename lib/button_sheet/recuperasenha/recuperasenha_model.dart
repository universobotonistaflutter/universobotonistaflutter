import '/flutter_flow/flutter_flow_util.dart';
import 'recuperasenha_widget.dart' show RecuperasenhaWidget;
import 'package:flutter/material.dart';

class RecuperasenhaModel extends FlutterFlowModel<RecuperasenhaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldrecsenha widget.
  FocusNode? textFieldrecsenhaFocusNode;
  TextEditingController? textFieldrecsenhaController;
  String? Function(BuildContext, String?)? textFieldrecsenhaControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldrecsenhaFocusNode?.dispose();
    textFieldrecsenhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
