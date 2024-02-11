import '/flutter_flow/flutter_flow_util.dart';
import 'consulta_jogos_estatisticos_widget.dart'
    show ConsultaJogosEstatisticosWidget;
import 'package:flutter/material.dart';

class ConsultaJogosEstatisticosModel
    extends FlutterFlowModel<ConsultaJogosEstatisticosWidget> {
  ///  Local state fields for this page.

  int index = 0;

  List<DocumentReference> listaVaiza = [];
  void addToListaVaiza(DocumentReference item) => listaVaiza.add(item);
  void removeFromListaVaiza(DocumentReference item) => listaVaiza.remove(item);
  void removeAtIndexFromListaVaiza(int index) => listaVaiza.removeAt(index);
  void insertAtIndexInListaVaiza(int index, DocumentReference item) =>
      listaVaiza.insert(index, item);
  void updateListaVaizaAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaVaiza[index] = updateFn(listaVaiza[index]);

  bool onTerminate = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
