import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'modify_campeonato_widget.dart' show ModifyCampeonatoWidget;
import 'package:flutter/material.dart';

class ModifyCampeonatoModel extends FlutterFlowModel<ModifyCampeonatoWidget> {
  ///  Local state fields for this page.

  bool onTerminate = false;

  List<ModalidadesRecord> listaModalidadesLocal = [];
  void addToListaModalidadesLocal(ModalidadesRecord item) =>
      listaModalidadesLocal.add(item);
  void removeFromListaModalidadesLocal(ModalidadesRecord item) =>
      listaModalidadesLocal.remove(item);
  void removeAtIndexFromListaModalidadesLocal(int index) =>
      listaModalidadesLocal.removeAt(index);
  void insertAtIndexInListaModalidadesLocal(
          int index, ModalidadesRecord item) =>
      listaModalidadesLocal.insert(index, item);
  void updateListaModalidadesLocalAtIndex(
          int index, Function(ModalidadesRecord) updateFn) =>
      listaModalidadesLocal[index] = updateFn(listaModalidadesLocal[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getModalidades] action in ModifyCampeonato widget.
  List<ModalidadesRecord>? listaModalidadeUsuario;
  // State field(s) for TextFieldCamp widget.
  FocusNode? textFieldCampFocusNode;
  TextEditingController? textFieldCampController;
  String? Function(BuildContext, String?)? textFieldCampControllerValidator;
  DateTime? datePicked;
  // State field(s) for DropDownmodalidade widget.
  String? dropDownmodalidadeValue;
  FormFieldController<String>? dropDownmodalidadeValueController;
  // State field(s) for DropDowntorneio widget.
  String? dropDowntorneioValue;
  FormFieldController<String>? dropDowntorneioValueController;
  // State field(s) for DropDownparticipante widget.
  String? dropDownparticipanteValue;
  FormFieldController<String>? dropDownparticipanteValueController;
  // State field(s) for CountControllerqtdconv widget.
  int? countControllerqtdconvValue;
  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for TextFieldObs widget.
  FocusNode? textFieldObsFocusNode;
  TextEditingController? textFieldObsController;
  String? Function(BuildContext, String?)? textFieldObsControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ModalidadesRecord? docModalidade;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldCampFocusNode?.dispose();
    textFieldCampController?.dispose();

    textFieldObsFocusNode?.dispose();
    textFieldObsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
