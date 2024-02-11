import '/backend/backend.dart';
import '/button_sheet/filtro_next_fase_posicao/filtro_next_fase_posicao_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'next_grupos_widget.dart' show NextGruposWidget;
import 'package:flutter/material.dart';

class NextGruposModel extends FlutterFlowModel<NextGruposWidget> {
  ///  Local state fields for this page.

  List<ConfigNextFaseStruct> listaScriptNextFase = [];
  void addToListaScriptNextFase(ConfigNextFaseStruct item) =>
      listaScriptNextFase.add(item);
  void removeFromListaScriptNextFase(ConfigNextFaseStruct item) =>
      listaScriptNextFase.remove(item);
  void removeAtIndexFromListaScriptNextFase(int index) =>
      listaScriptNextFase.removeAt(index);
  void insertAtIndexInListaScriptNextFase(
          int index, ConfigNextFaseStruct item) =>
      listaScriptNextFase.insert(index, item);
  void updateListaScriptNextFaseAtIndex(
          int index, Function(ConfigNextFaseStruct) updateFn) =>
      listaScriptNextFase[index] = updateFn(listaScriptNextFase[index]);

  ConfigNextFaseStruct? updateParticipante;
  void updateUpdateParticipanteStruct(
          Function(ConfigNextFaseStruct) updateFn) =>
      updateFn(updateParticipante ??= ConfigNextFaseStruct());

  bool onTerminate = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ddTipoFiltro widget.
  String? ddTipoFiltroValue;
  FormFieldController<String>? ddTipoFiltroValueController;
  // Model for filtroNextFasePosicao component.
  late FiltroNextFasePosicaoModel filtroNextFasePosicaoModel;
  // Stores action output result for [Custom Action - buscaParticipantePosicao] action in filtroNextFasePosicao widget.
  ParticipanteRecord? docParticipante;
  // Stores action output result for [Custom Action - buscaParticipantePosicaoGeral] action in filtroNextFasePosicao widget.
  ParticipanteRecord? docParticipante2;
  // Stores action output result for [Custom Action - buscaParticipanteGrupoPosicaoAgrupado] action in filtroNextFasePosicao widget.
  ParticipanteRecord? docParticipante3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    filtroNextFasePosicaoModel =
        createModel(context, () => FiltroNextFasePosicaoModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    filtroNextFasePosicaoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
