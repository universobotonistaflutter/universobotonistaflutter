import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_etapas_widget.dart' show SelectEtapasWidget;
import 'package:flutter/material.dart';

class SelectEtapasModel extends FlutterFlowModel<SelectEtapasWidget> {
  ///  Local state fields for this component.

  ChampionRecord? docChampionSelected;

  List<DocumentReference> docPontos = [];
  void addToDocPontos(DocumentReference item) => docPontos.add(item);
  void removeFromDocPontos(DocumentReference item) => docPontos.remove(item);
  void removeAtIndexFromDocPontos(int index) => docPontos.removeAt(index);
  void insertAtIndexInDocPontos(int index, DocumentReference item) =>
      docPontos.insert(index, item);
  void updateDocPontosAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      docPontos[index] = updateFn(docPontos[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for CheckboxCalcRanking widget.

  Map<ChampionRecord, bool> checkboxCalcRankingValueMap = {};
  List<ChampionRecord> get checkboxCalcRankingCheckedItems =>
      checkboxCalcRankingValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  // Stores action output result for [Firestore Query - Query a collection] action in CheckboxCalcRanking widget.
  List<ChampionTotalGeralRecord>? listachampiongeral;
  // Stores action output result for [Firestore Query - Query a collection] action in CheckboxCalcRanking widget.
  List<UserRecord>? queryParticipantes;
  // Stores action output result for [Firestore Query - Query a collection] action in CheckboxCalcRanking widget.
  List<ConfiguraPontosRecord>? queryConfigPontos;
  // Stores action output result for [Firestore Query - Query a collection] action in CheckboxCalcRanking widget.
  List<RankingPontosRecord>? queryRankingPontos00;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
