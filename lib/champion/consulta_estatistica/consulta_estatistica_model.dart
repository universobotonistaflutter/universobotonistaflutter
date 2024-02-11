import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'consulta_estatistica_widget.dart' show ConsultaEstatisticaWidget;
import 'package:flutter/material.dart';

class ConsultaEstatisticaModel
    extends FlutterFlowModel<ConsultaEstatisticaWidget> {
  ///  Local state fields for this page.

  List<JogosRecord> jogosMeus = [];
  void addToJogosMeus(JogosRecord item) => jogosMeus.add(item);
  void removeFromJogosMeus(JogosRecord item) => jogosMeus.remove(item);
  void removeAtIndexFromJogosMeus(int index) => jogosMeus.removeAt(index);
  void insertAtIndexInJogosMeus(int index, JogosRecord item) =>
      jogosMeus.insert(index, item);
  void updateJogosMeusAtIndex(int index, Function(JogosRecord) updateFn) =>
      jogosMeus[index] = updateFn(jogosMeus[index]);

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ConsultaEstatistica widget.
  List<JogosRecord>? listaJogosDoUsuario;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

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
