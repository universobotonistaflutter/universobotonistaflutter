import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partidas_widget.dart' show PartidasWidget;
import 'package:flutter/material.dart';

class PartidasModel extends FlutterFlowModel<PartidasWidget> {
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
  // Stores action output result for [Backend Call - Read Document] action in Partidas widget.
  FaseRecord? checkFaseExists;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<JogosRecord>? listaJogosCampeonatoFase;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FaseRecord? docFaseAnterior;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalDeJogos;

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
