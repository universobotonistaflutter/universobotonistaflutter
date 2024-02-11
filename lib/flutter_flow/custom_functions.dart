import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference? modalidadeReference(String id) {
  // Verifica se o ID está em branco
  if (id.trim().isEmpty) {
    // Se estiver em branco, retorne null ou lance um erro, dependendo de como você deseja lidar com essa situação
    return null;
  }

  // Obtém a referência ao documento com o ID fornecido
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('Modalidades').doc(id);

  return docRef;
}

int strToInt(String? numero) {
  // convert text to int parse
  if (numero == null) {
    return 0;
  } else {
    return int.parse(numero);
  }
}

String strToUpperCase(String texto) {
  // return text from argument in UPPERCASE
  return texto.toUpperCase();
}

DateTime calculoVenctoM(DateTime data) {
  // return the current date and add 30 more days in date format
  return data.add(Duration(days: 30));
}

DateTime calculoVectoA(DateTime data) {
  // return the current date and add 365 more days in date format
  return data.add(Duration(days: 365));
}

String? extractDateString(DateTime? datahora) {
  // return date in string
  if (datahora == null) {
    return null;
  } else {
    // Use the intl package to format the date as a string
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(datahora);
  }
}

DocumentReference? faseReference(String id) {
  // Verifica se o ID está em branco
  if (id.trim().isEmpty) {
    // Se estiver em branco, retorne null ou lance um erro, dependendo de como você deseja lidar com essa situação
    return null;
  }

  // Obtém a referência ao documento com o ID fornecido
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('Fase').doc(id);

  return docRef;
}

DocumentReference? grupoReference(String id) {
  // Verifica se o ID está em branco
  if (id.trim().isEmpty) {
    // Se estiver em branco, retorne null ou lance um erro, dependendo de como você deseja lidar com essa situação
    return null;
  }

  // Obtém a referência ao documento com o ID fornecido
  DocumentReference docRef =
      FirebaseFirestore.instance.collection('Grupo').doc(id);

  return docRef;
}

int? indexPlusOneToInteger(int? index) {
  // return index plus one
  if (index != null) {
    return index + 1;
  }
  return null;
}

DocumentReference? strFederer(String? iD) {
  if (iD == null) {
    return null;
  }
  // Obtém a referência ao documento com o ID fornecido
  return FirebaseFirestore.instance.collection('Federations').doc(iD);
}

bool strFiltraNome(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.contains(textSearchFor);
}

List<ChampionRecord>? campeonatosEmAberto(
  List<ChampionRecord>? listChampion,
  String? dropdownValue,
  DocumentReference? strFederer,
) {
  if (dropdownValue == "Consulte uma Federação?") {
    // If dropdownValue is "Consulte uma Federação?", return all Champion records
    return listChampion;
  } else if (strFederer != null) {
    // If strFederer is not null, filter Champion records by idFederation
    return listChampion
        ?.where((champion) => champion.idFederation?.id == strFederer.id)
        .toList();
  }

  return null; // Return null if no conditions are met
}

String? indexPlusOneToString(int? index) {
  // some 1 ao index e retorne ele como string
  if (index != null) {
    return (index + 1).toString();
  }
  return null;
}

int encontrarIndexPelaQtd(int qtdChampionTotalGeral) {
  // a função deve retornar a qtdChampionTotalGeral menos 1
  return qtdChampionTotalGeral - 1;
}
