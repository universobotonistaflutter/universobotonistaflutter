import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_participante_widget.dart' show SelectParticipanteWidget;
import 'package:flutter/material.dart';

class SelectParticipanteModel
    extends FlutterFlowModel<SelectParticipanteWidget> {
  ///  Local state fields for this component.

  UserRecord? participauset;

  List<DocumentReference> listaLocal = [];
  void addToListaLocal(DocumentReference item) => listaLocal.add(item);
  void removeFromListaLocal(DocumentReference item) => listaLocal.remove(item);
  void removeAtIndexFromListaLocal(int index) => listaLocal.removeAt(index);
  void insertAtIndexInListaLocal(int index, DocumentReference item) =>
      listaLocal.insert(index, item);
  void updateListaLocalAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listaLocal[index] = updateFn(listaLocal[index]);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
