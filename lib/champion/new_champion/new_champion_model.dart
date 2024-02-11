import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_champion_widget.dart' show NewChampionWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewChampionModel extends FlutterFlowModel<NewChampionWidget> {
  ///  Local state fields for this page.

  bool onTerminate = false;

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getModalidades] action in NewChampion widget.
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
  // State field(s) for TFConvidados widget.
  FocusNode? tFConvidadosFocusNode;
  TextEditingController? tFConvidadosController;
  final tFConvidadosMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? tFConvidadosControllerValidator;
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

    tFConvidadosFocusNode?.dispose();
    tFConvidadosController?.dispose();

    textFieldObsFocusNode?.dispose();
    textFieldObsController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
