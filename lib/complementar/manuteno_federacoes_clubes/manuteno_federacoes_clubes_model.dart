import '/flutter_flow/flutter_flow_util.dart';
import 'manuteno_federacoes_clubes_widget.dart'
    show ManutenoFederacoesClubesWidget;
import 'package:flutter/material.dart';

class ManutenoFederacoesClubesModel
    extends FlutterFlowModel<ManutenoFederacoesClubesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Geral widget.
  TabController? geralController;
  int get geralCurrentIndex =>
      geralController != null ? geralController!.index : 0;

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for TextFiedFed widget.
  FocusNode? textFiedFedFocusNode1;
  TextEditingController? textFiedFedController1;
  String? Function(BuildContext, String?)? textFiedFedController1Validator;
  // State field(s) for TextFiedFed widget.
  FocusNode? textFiedFedFocusNode2;
  TextEditingController? textFiedFedController2;
  String? Function(BuildContext, String?)? textFiedFedController2Validator;
  // State field(s) for Switch widget.
  bool? switchValue;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // State field(s) for TextFiedClubes widget.
  FocusNode? textFiedClubesFocusNode1;
  TextEditingController? textFiedClubesController1;
  String? Function(BuildContext, String?)? textFiedClubesController1Validator;
  // State field(s) for TextFiedClubes widget.
  FocusNode? textFiedClubesFocusNode2;
  TextEditingController? textFiedClubesController2;
  String? Function(BuildContext, String?)? textFiedClubesController2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    geralController?.dispose();
    textFiedFedFocusNode1?.dispose();
    textFiedFedController1?.dispose();

    textFiedFedFocusNode2?.dispose();
    textFiedFedController2?.dispose();

    textFiedClubesFocusNode1?.dispose();
    textFiedClubesController1?.dispose();

    textFiedClubesFocusNode2?.dispose();
    textFiedClubesController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
