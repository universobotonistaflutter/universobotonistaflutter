import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'manutencao_ranking_widget.dart' show ManutencaoRankingWidget;
import 'package:flutter/material.dart';

class ManutencaoRankingModel extends FlutterFlowModel<ManutencaoRankingWidget> {
  ///  Local state fields for this page.

  FederationsRecord? selectFederer;

  ClubeRecord? selectClube;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Button widget.
  bool? interstitialconssalatrofeus;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
