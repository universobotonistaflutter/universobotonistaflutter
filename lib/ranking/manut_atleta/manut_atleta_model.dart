import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manut_atleta_widget.dart' show ManutAtletaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ManutAtletaModel extends FlutterFlowModel<ManutAtletaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TFNome widget.
  FocusNode? tFNomeFocusNode;
  TextEditingController? tFNomeController;
  String? Function(BuildContext, String?)? tFNomeControllerValidator;
  // State field(s) for TFApelido widget.
  FocusNode? tFApelidoFocusNode;
  TextEditingController? tFApelidoController;
  String? Function(BuildContext, String?)? tFApelidoControllerValidator;
  DateTime? datePicked;
  // State field(s) for TFone widget.
  FocusNode? tFoneFocusNode;
  TextEditingController? tFoneController;
  final tFoneMask = MaskTextInputFormatter(mask: '+55 (##) # ####-####');
  String? Function(BuildContext, String?)? tFoneControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in FEDERATION widget.
  FederationsRecord? selectfederer;
  // Stores action output result for [Bottom Sheet - selectClub] action in CLUBE widget.
  ClubeRecord? clubeSelected;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tFNomeFocusNode?.dispose();
    tFNomeController?.dispose();

    tFApelidoFocusNode?.dispose();
    tFApelidoController?.dispose();

    tFoneFocusNode?.dispose();
    tFoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
