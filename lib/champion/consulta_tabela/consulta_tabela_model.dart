import '/flutter_flow/flutter_flow_util.dart';
import 'consulta_tabela_widget.dart' show ConsultaTabelaWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class ConsultaTabelaModel extends FlutterFlowModel<ConsultaTabelaWidget> {
  ///  Local state fields for this page.

  int index = 0;

  int indexSub = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
