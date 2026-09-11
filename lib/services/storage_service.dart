import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/tarefa.dart';

class StorageService {
  static const String _chaveTarefas = 'tarefas';

  Future<List<Tarefa>> carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();

    final dados = prefs.getString(_chaveTarefas);

    if (dados == null || dados.isEmpty) {
      return [];
    }

    final List<dynamic> lista = jsonDecode(dados);

    return lista
        .map((item) => Tarefa.fromMap(Map<String, dynamic>.from(item)))
        .toList();
  }

  Future<void> salvarTarefas(List<Tarefa> tarefas) async {
    final prefs = await SharedPreferences.getInstance();

    final dados = jsonEncode(tarefas.map((tarefa) => tarefa.toMap()).toList());

    await prefs.setString(_chaveTarefas, dados);
  }
}
