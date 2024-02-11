import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tabela_widget.dart' show TabelaWidget;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TabelaModel extends FlutterFlowModel<TabelaWidget> {
  ///  Local state fields for this page.

  int index = 0;

  int indexSub = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Tabela widget.
  int? totalFases;
  // State field(s) for tfNomeFase widget.
  FocusNode? tfNomeFaseFocusNode;
  TextEditingController? tfNomeFaseController;
  String? Function(BuildContext, String?)? tfNomeFaseControllerValidator;
  // State field(s) for ccQtdGrupo widget.
  int? ccQtdGrupoValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? existTituloCriado;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalFaseCriar;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  FaseRecord? novaFaseCriada;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? totalFases2;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<GrupoRecord>? gruposDaFasePageView;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<ParticipanteRecord>? participantesDoGrupoPageView;
  // Stores action output result for [Bottom Sheet - inputBox] action in IconButton widget.
  String? novoNomeGrupo;
  // Stores action output result for [Bottom Sheet - selectParticipante] action in IconButton widget.
  List<DocumentReference>? listaUsuarioSelecionado;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ParticipanteRecord? existeUsuarioCadastrado;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  UserRecord? docConvidado;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ParticipanteRecord? docNewParticipante;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {
    tfNomeFaseFocusNode?.dispose();
    tfNomeFaseController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
