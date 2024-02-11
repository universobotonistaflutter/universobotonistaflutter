import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manutencao_admin_widget.dart' show ManutencaoAdminWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ManutencaoAdminModel extends FlutterFlowModel<ManutencaoAdminWidget> {
  ///  Local state fields for this page.

  FederationsRecord? selectFederer;

  ClubeRecord? selectClube;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TFPres widget.
  FocusNode? tFPresFocusNode;
  TextEditingController? tFPresController;
  String? Function(BuildContext, String?)? tFPresControllerValidator;
  // State field(s) for TFeMAIL widget.
  FocusNode? tFeMAILFocusNode;
  TextEditingController? tFeMAILController;
  String? Function(BuildContext, String?)? tFeMAILControllerValidator;
  // State field(s) for TFWeb widget.
  FocusNode? tFWebFocusNode;
  TextEditingController? tFWebController;
  String? Function(BuildContext, String?)? tFWebControllerValidator;
  // State field(s) for Telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneController;
  final telefoneMask = MaskTextInputFormatter(mask: '+55 (##) # ####-####');
  String? Function(BuildContext, String?)? telefoneControllerValidator;
  // State field(s) for Checkbox widget.

  Map<DocumentReference, bool> checkboxValueMap1 = {};
  List<DocumentReference> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Bottom Sheet - CadNovoUser] action in Icon widget.
  UserRecord? refParticipanteNovoSelecionado;
  // State field(s) for Checkbox widget.

  Map<UserRecord, bool> checkboxValueMap2 = {};
  List<UserRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    tFPresFocusNode?.dispose();
    tFPresController?.dispose();

    tFeMAILFocusNode?.dispose();
    tFeMAILController?.dispose();

    tFWebFocusNode?.dispose();
    tFWebController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
