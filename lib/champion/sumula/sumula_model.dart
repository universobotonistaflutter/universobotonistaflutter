import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'sumula_widget.dart' show SumulaWidget;
import 'package:flutter/material.dart';

class SumulaModel extends FlutterFlowModel<SumulaWidget> {
  ///  Local state fields for this page.

  List<JogosRecord> meusJogos = [];
  void addToMeusJogos(JogosRecord item) => meusJogos.add(item);
  void removeFromMeusJogos(JogosRecord item) => meusJogos.remove(item);
  void removeAtIndexFromMeusJogos(int index) => meusJogos.removeAt(index);
  void insertAtIndexInMeusJogos(int index, JogosRecord item) =>
      meusJogos.insert(index, item);
  void updateMeusJogosAtIndex(int index, Function(JogosRecord) updateFn) =>
      meusJogos[index] = updateFn(meusJogos[index]);

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Sumula widget.
  List<JogosRecord>? listaJogosDoUsuarioN1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Custom Action - getJogosUser] action in Button widget.
  List<JogosRecord>? listaJogosDoUsuario2;

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
