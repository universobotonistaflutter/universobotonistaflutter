import '/flutter_flow/flutter_flow_util.dart';
import 'select_placar_widget.dart' show SelectPlacarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SelectPlacarModel extends FlutterFlowModel<SelectPlacarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for tfMandante widget.
  FocusNode? tfMandanteFocusNode;
  TextEditingController? tfMandanteController;
  final tfMandanteMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? tfMandanteControllerValidator;
  // State field(s) for tfVisitante widget.
  FocusNode? tfVisitanteFocusNode;
  TextEditingController? tfVisitanteController;
  final tfVisitanteMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? tfVisitanteControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? docQtdJogosRealizados;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfMandanteFocusNode?.dispose();
    tfMandanteController?.dispose();

    tfVisitanteFocusNode?.dispose();
    tfVisitanteController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
