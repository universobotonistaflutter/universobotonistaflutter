import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'gerar_jogos_widget.dart' show GerarJogosWidget;
import 'package:flutter/material.dart';

class GerarJogosModel extends FlutterFlowModel<GerarJogosWidget> {
  ///  Local state fields for this component.

  int indexA = 0;

  int indexB = 0;

  bool finalizado = false;

  String teste = '';

  ParticipanteRecord? participanteLocalizado;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ddOpcaoModo widget.
  int? ddOpcaoModoValue;
  FormFieldController<int>? ddOpcaoModoValueController;
  // State field(s) for tfQtdMesas widget.
  FocusNode? tfQtdMesasFocusNode;
  TextEditingController? tfQtdMesasController;
  String? Function(BuildContext, String?)? tfQtdMesasControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChampionRecord? totalDeJogos2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ParticipanteRecord? nomeParticip;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ChampionRecord? totalDeJogos4;
  // Stores action output result for [Custom Action - verificaJogosForamEncerrados] action in Button widget.
  int? totalSemConferir;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FaseRecord? proximaFase;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ParticipanteRecord>? participanteProximaFase;
  // Stores action output result for [Custom Action - buscaParticipantePosicao] action in Button widget.
  ParticipanteRecord? participanteScript;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GrupoRecord? grupoScript1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ParticipanteRecord? docNewParticipante;
  // Stores action output result for [Custom Action - buscaParticipantePosicaoGeral] action in Button widget.
  ParticipanteRecord? participanteScript2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GrupoRecord? grupoScript2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ParticipanteRecord? docNewParticipante2;
  // Stores action output result for [Custom Action - buscaParticipanteGrupoPosicaoAgrupado] action in Button widget.
  ParticipanteRecord? participanteScript3;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  GrupoRecord? grupoScript3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ParticipanteRecord? docNewParticipante3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tfQtdMesasFocusNode?.dispose();
    tfQtdMesasController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
