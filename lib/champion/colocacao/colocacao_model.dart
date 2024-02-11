import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'colocacao_widget.dart' show ColocacaoWidget;
import 'package:flutter/material.dart';

class ColocacaoModel extends FlutterFlowModel<ColocacaoWidget> {
  ///  Local state fields for this page.

  DocumentReference? pgParticipante;

  DocumentReference? pgRanking;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - gravarUserConfronto] action in Button widget.
  String? confrontoGravado;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChampionTotalGeralRecord>? queryChampionTotalGeral;

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
