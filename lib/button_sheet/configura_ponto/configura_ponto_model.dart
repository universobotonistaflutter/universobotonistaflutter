import '/flutter_flow/flutter_flow_util.dart';
import 'configura_ponto_widget.dart' show ConfiguraPontoWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ConfiguraPontoModel extends FlutterFlowModel<ConfiguraPontoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TFPos widget.
  FocusNode? tFPosFocusNode;
  TextEditingController? tFPosController;
  final tFPosMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? tFPosControllerValidator;
  // State field(s) for TFPts widget.
  FocusNode? tFPtsFocusNode;
  TextEditingController? tFPtsController;
  final tFPtsMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? tFPtsControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tFPosFocusNode?.dispose();
    tFPosController?.dispose();

    tFPtsFocusNode?.dispose();
    tFPtsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
