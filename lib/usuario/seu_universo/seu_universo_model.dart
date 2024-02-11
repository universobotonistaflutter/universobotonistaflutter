import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'seu_universo_widget.dart' show SeuUniversoWidget;
import 'package:flutter/material.dart';

class SeuUniversoModel extends FlutterFlowModel<SeuUniversoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField_nome widget.
  FocusNode? textFieldNomeFocusNode;
  TextEditingController? textFieldNomeController;
  String? Function(BuildContext, String?)? textFieldNomeControllerValidator;
  // State field(s) for TextFiel_apelido widget.
  FocusNode? textFielApelidoFocusNode;
  TextEditingController? textFielApelidoController;
  String? Function(BuildContext, String?)? textFielApelidoControllerValidator;
  DateTime? datePicked;
  // Stores action output result for [Bottom Sheet - selectFederation] action in FEDERATION widget.
  FederationsRecord? federationSelected;
  // Stores action output result for [Bottom Sheet - selectClub] action in CLUBE widget.
  ClubeRecord? clubeSelected;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNomeFocusNode?.dispose();
    textFieldNomeController?.dispose();

    textFielApelidoFocusNode?.dispose();
    textFielApelidoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
