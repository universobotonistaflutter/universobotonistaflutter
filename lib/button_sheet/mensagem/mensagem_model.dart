import '/flutter_flow/flutter_flow_util.dart';
import 'mensagem_widget.dart' show MensagemWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MensagemModel extends FlutterFlowModel<MensagemWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneController;
  final telefoneMask = MaskTextInputFormatter(mask: '+55 (##) # ####-####');
  String? Function(BuildContext, String?)? telefoneControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    telefoneFocusNode?.dispose();
    telefoneController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
