import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filtro_next_fase_posicao_widget.dart' show FiltroNextFasePosicaoWidget;
import 'package:flutter/material.dart';

class FiltroNextFasePosicaoModel
    extends FlutterFlowModel<FiltroNextFasePosicaoWidget> {
  ///  Local state fields for this component.

  ConfigNextFaseStruct? nextFase;
  void updateNextFaseStruct(Function(ConfigNextFaseStruct) updateFn) =>
      updateFn(nextFase ??= ConfigNextFaseStruct());

  ///  State fields for stateful widgets in this component.

  // State field(s) for ddFase widget.
  String? ddFaseValue;
  FormFieldController<String>? ddFaseValueController;
  // State field(s) for ddGrupo widget.
  String? ddGrupoValue;
  FormFieldController<String>? ddGrupoValueController;
  // State field(s) for tfPosicao widget.
  FocusNode? tfPosicaoFocusNode;
  TextEditingController? tfPosicaoController;
  String? Function(BuildContext, String?)? tfPosicaoControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  FaseRecord? docFaseAdicionar;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GrupoRecord? docGrupoAdicionar;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfPosicaoFocusNode?.dispose();
    tfPosicaoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
