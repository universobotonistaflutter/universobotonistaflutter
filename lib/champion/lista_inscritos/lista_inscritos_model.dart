import '/flutter_flow/flutter_flow_util.dart';
import 'lista_inscritos_widget.dart' show ListaInscritosWidget;
import 'package:flutter/material.dart';

class ListaInscritosModel extends FlutterFlowModel<ListaInscritosWidget> {
  ///  Local state fields for this page.

  List<String> nampartic = [];
  void addToNampartic(String item) => nampartic.add(item);
  void removeFromNampartic(String item) => nampartic.remove(item);
  void removeAtIndexFromNampartic(int index) => nampartic.removeAt(index);
  void insertAtIndexInNampartic(int index, String item) =>
      nampartic.insert(index, item);
  void updateNamparticAtIndex(int index, Function(String) updateFn) =>
      nampartic[index] = updateFn(nampartic[index]);

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
