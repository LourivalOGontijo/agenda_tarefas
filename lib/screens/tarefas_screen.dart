import 'package:flutter/material.dart';

import '../models/tarefa.dart';
import '../services/storage_service.dart';
import '../widgets/tarefa_card.dart';
import '../widgets/tarefa_dialog.dart';

class TarefasScreen extends StatefulWidget {
  final DateTime dataSelecionada;

  const TarefasScreen({super.key, required this.dataSelecionada});

  @override
  State<TarefasScreen> createState() => _TarefasScreenState();
}

class _TarefasScreenState extends State<TarefasScreen> {
  final StorageService _storage = StorageService();

  List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  Future<void> _carregar() async {
    final todas = await _storage.carregarTarefas();

    final tarefasDoDia = todas.where((tarefa) {
      return tarefa.data.year == widget.dataSelecionada.year &&
          tarefa.data.month == widget.dataSelecionada.month &&
          tarefa.data.day == widget.dataSelecionada.day;
    }).toList();

    setState(() {
      _tarefas = tarefasDoDia;
    });
  }

  Future<void> _salvarAlteracoes() async {
    final todas = await _storage.carregarTarefas();

    final idsDoDia = _tarefas.map((tarefa) => tarefa.id).toSet();

    final outras = todas.where((tarefa) => !idsDoDia.contains(tarefa.id));

    await _storage.salvarTarefas([...outras, ..._tarefas]);
  }

  List<Tarefa> get _ordenadas {
    final copia = [..._tarefas];

    copia.sort((a, b) {
      if (a.concluida != b.concluida) {
        return a.concluida ? 1 : -1;
      }

      return a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase());
    });

    return copia;
  }

  Future<void> _adicionar() async {
    final data =
        '${widget.dataSelecionada.day.toString().padLeft(2, '0')}/'
        '${widget.dataSelecionada.month.toString().padLeft(2, '0')}/'
        '${widget.dataSelecionada.year}';

    final titulo = await showDialog<String>(
      context: context,
      builder: (_) => TarefaDialog(dataFormatada: data),
    );

    if (titulo == null) return;

    setState(() {
      _tarefas.add(
        Tarefa(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          titulo: titulo,
          data: widget.dataSelecionada,
        ),
      );
    });

    await _salvarAlteracoes();
  }

  Future<void> _alternarConclusao(Tarefa tarefa) async {
    setState(() {
      tarefa.concluida = !tarefa.concluida;
    });

    await _salvarAlteracoes();
  }

  Future<void> _excluir(Tarefa tarefa) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Excluir tarefa?'),
          content: Text('Deseja remover "${tarefa.titulo}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('CANCELAR'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
              child: const Text('EXCLUIR'),
            ),
          ],
        );
      },
    );

    if (confirmar != true) return;

    setState(() {
      _tarefas.removeWhere((item) => item.id == tarefa.id);
    });

    await _salvarAlteracoes();
  }

  @override
  Widget build(BuildContext context) {
    final tarefas = _ordenadas;

    final pendentes = tarefas.where((tarefa) => !tarefa.concluida).toList();

    final concluidas = tarefas.where((tarefa) => tarefa.concluida).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      appBar: AppBar(
        title: const Text(
          'Tarefas de hoje',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF32165C),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionar,
        backgroundColor: const Color(0xFFE040FB),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 100),
        children: [
          _Cabecalho(
            titulo: 'PENDENTES',
            quantidade: pendentes.length,
            cor: const Color(0xFF7C4DFF),
          ),
          const SizedBox(height: 12),
          if (pendentes.isEmpty)
            const _MensagemVazia(mensagem: 'Nenhuma tarefa pendente 🎉')
          else
            ...pendentes.map(
              (tarefa) => TarefaCard(
                tarefa: tarefa,
                onConcluir: () => _alternarConclusao(tarefa),
                onExcluir: () => _excluir(tarefa),
              ),
            ),
          const SizedBox(height: 25),
          _Cabecalho(
            titulo: 'CONCLUÍDAS',
            quantidade: concluidas.length,
            cor: const Color(0xFF00C853),
          ),
          const SizedBox(height: 12),
          if (concluidas.isEmpty)
            const _MensagemVazia(mensagem: 'Nenhuma tarefa concluída ainda.')
          else
            ...concluidas.map(
              (tarefa) => TarefaCard(
                tarefa: tarefa,
                onConcluir: () => _alternarConclusao(tarefa),
                onExcluir: () => _excluir(tarefa),
              ),
            ),
        ],
      ),
    );
  }
}

class _Cabecalho extends StatelessWidget {
  final String titulo;
  final int quantidade;
  final Color cor;

  const _Cabecalho({
    required this.titulo,
    required this.quantidade,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 28,
          decoration: BoxDecoration(
            color: cor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          titulo,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: cor,
            letterSpacing: 1,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: cor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$quantidade',
            style: TextStyle(color: cor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _MensagemVazia extends StatelessWidget {
  final String mensagem;

  const _MensagemVazia({required this.mensagem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        mensagem,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }
}
