import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cria_ranking_widget.dart' show CriaRankingWidget;
import 'package:flutter/material.dart';

class CriaRankingModel extends FlutterFlowModel<CriaRankingWidget> {
  ///  Local state fields for this page.

  List<ModalidadesRecord> listaModalidaesLocal = [];
  void addToListaModalidaesLocal(ModalidadesRecord item) =>
      listaModalidaesLocal.add(item);
  void removeFromListaModalidaesLocal(ModalidadesRecord item) =>
      listaModalidaesLocal.remove(item);
  void removeAtIndexFromListaModalidaesLocal(int index) =>
      listaModalidaesLocal.removeAt(index);
  void insertAtIndexInListaModalidaesLocal(int index, ModalidadesRecord item) =>
      listaModalidaesLocal.insert(index, item);
  void updateListaModalidaesLocalAtIndex(
          int index, Function(ModalidadesRecord) updateFn) =>
      listaModalidaesLocal[index] = updateFn(listaModalidaesLocal[index]);

  bool onTerminate = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getModalidades] action in CriaRanking widget.
  List<ModalidadesRecord>? listaModalidadeUsuario;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DROPModaldade widget.
  String? dROPModaldadeValue;
  FormFieldController<String>? dROPModaldadeValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ModalidadesRecord? docModalidadeS;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
