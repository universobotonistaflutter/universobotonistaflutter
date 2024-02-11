import '/flutter_flow/flutter_flow_util.dart';
import 'modalidade_widget.dart' show ModalidadeWidget;
import 'package:flutter/material.dart';

class ModalidadeModel extends FlutterFlowModel<ModalidadeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextFieldcadmod widget.
  FocusNode? textFieldcadmodFocusNode;
  TextEditingController? textFieldcadmodController;
  String? Function(BuildContext, String?)? textFieldcadmodControllerValidator;
  // State field(s) for TextFieldseq widget.
  FocusNode? textFieldseqFocusNode;
  TextEditingController? textFieldseqController;
  String? Function(BuildContext, String?)? textFieldseqControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldcadmodFocusNode?.dispose();
    textFieldcadmodController?.dispose();

    textFieldseqFocusNode?.dispose();
    textFieldseqController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
