import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _PesquisaON = false;
  bool get PesquisaON => _PesquisaON;
  set PesquisaON(bool value) {
    _PesquisaON = value;
  }

  DtModalidadeStruct _APPModalidade =
      DtModalidadeStruct.fromSerializableMap(jsonDecode('{}'));
  DtModalidadeStruct get APPModalidade => _APPModalidade;
  set APPModalidade(DtModalidadeStruct value) {
    _APPModalidade = value;
  }

  void updateAPPModalidadeStruct(Function(DtModalidadeStruct) updateFn) {
    updateFn(_APPModalidade);
  }

  int _qtddChampionTotalGeral = 0;
  int get qtddChampionTotalGeral => _qtddChampionTotalGeral;
  set qtddChampionTotalGeral(int value) {
    _qtddChampionTotalGeral = value;
  }
}
