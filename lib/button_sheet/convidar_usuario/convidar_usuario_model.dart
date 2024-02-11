import '/flutter_flow/flutter_flow_util.dart';
import 'convidar_usuario_widget.dart' show ConvidarUsuarioWidget;
import 'package:flutter/material.dart';

class ConvidarUsuarioModel extends FlutterFlowModel<ConvidarUsuarioWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> listaUsuarioSelecionado = [];
  void addToListaUsuarioSelecionado(DocumentReference item) =>
      listaUsuarioSelecionado.add(item);
  void removeFromListaUsuarioSelecionado(DocumentReference item) =>
      listaUsuarioSelecionado.remove(item);
  void removeAtIndexFromListaUsuarioSelecionado(int index) =>
      listaUsuarioSelecionado.removeAt(index);
  void insertAtIndexInListaUsuarioSelecionado(
          int index, DocumentReference item) =>
      listaUsuarioSelecionado.insert(index, item);
  void updateListaUsuarioSelecionadoAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaUsuarioSelecionado[index] = updateFn(listaUsuarioSelecionado[index]);

  int index = 0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TFpesquisa widget.
  FocusNode? tFpesquisaFocusNode;
  TextEditingController? tFpesquisaController;
  String? Function(BuildContext, String?)? tFpesquisaControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tFpesquisaFocusNode?.dispose();
    tFpesquisaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
