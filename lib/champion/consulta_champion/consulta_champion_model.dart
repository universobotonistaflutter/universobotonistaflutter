import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'consulta_champion_widget.dart' show ConsultaChampionWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ConsultaChampionModel extends FlutterFlowModel<ConsultaChampionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in AbrirInscr widget.
  List<UserRecord>? listaUsuariosDoMesmoEstado;
  // Stores action output result for [Custom Action - getDocChampion] action in Confirma widget.
  ChampionRecord? championAtual;
  // Stores action output result for [Custom Action - getDocChampion] action in Confirma widget.
  ChampionRecord? championAtualizado;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Estatistic widget.
  bool? interstitialconsChampion;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Posicionamento widget.
  bool? interstitialPosChampion;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Mensage widget.
  bool? interstitialmsgChampion;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Icon widget.
  bool? interstitialAdSuccessok;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Icon widget.
  bool? interstialNewChamp;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  ChampionRecord? championsAbertos;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Icon widget.
  bool? interstitialAdSuccessook;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
