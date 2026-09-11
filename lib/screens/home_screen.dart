import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/tarefa.dart';
import '../services/storage_service.dart';
import '../widgets/tarefa_dialog.dart';
import 'tarefas_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService _storage = StorageService();

  DateTime _diaSelecionado = DateTime.now();
  DateTime _diaFocado = DateTime.now();

  List<Tarefa> _tarefas = [];

  @override
  void initState() {
    super.initState();
    _carregarTarefas();
  }

  Future<void> _carregarTarefas() async {
    final tarefas = await _storage.carregarTarefas();

    setState(() {
      _tarefas = tarefas;
    });
  }

  List<Tarefa> get _tarefasDoDia {
    return _tarefas.where((tarefa) {
      return isSameDay(tarefa.data, _diaSelecionado);
    }).toList();
  }

  Future<void> _adicionarTarefa() async {
    final dataFormatada =
        '${_diaSelecionado.day.toString().padLeft(2, '0')}/'
        '${_diaSelecionado.month.toString().padLeft(2, '0')}/'
        '${_diaSelecionado.year}';

    final titulo = await showDialog<String>(
      context: context,
      builder: (_) => TarefaDialog(dataFormatada: dataFormatada),
    );

    if (titulo == null) return;

    final novaTarefa = Tarefa(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      titulo: titulo,
      data: _diaSelecionado,
    );

    setState(() {
      _tarefas.add(novaTarefa);
    });

    await _storage.salvarTarefas(_tarefas);
  }

  Future<void> _abrirTarefas() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TarefasScreen(dataSelecionada: _diaSelecionado),
      ),
    );

    await _carregarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    final tarefasDoDia = _tarefasDoDia;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      appBar: AppBar(
        title: const Text(
          'Meu Calendário ✦',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF32165C),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _adicionarTarefa,
        backgroundColor: const Color(0xFF7C4DFF),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Nova tarefa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4527A0), Color(0xFF7C4DFF)],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              padding: const EdgeInsets.all(8),
              child: TableCalendar<Tarefa>(
                locale: 'pt_BR',
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2035, 12, 31),
                focusedDay: _diaFocado,
                selectedDayPredicate: (day) {
                  return isSameDay(_diaSelecionado, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _diaSelecionado = selectedDay;
                    _diaFocado = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  defaultTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  weekendTextStyle: TextStyle(
                    color: Color(0xFFFFD54F),
                    fontWeight: FontWeight.bold,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Color(0xFFE040FB),
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Color(0xFF00C853),
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Color(0xFFFFD740),
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: const HeaderStyle(
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Tarefas do dia',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF29213D),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              '${tarefasDoDia.length} tarefa(s) planejada(s)',
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            if (tarefasDoDia.isEmpty)
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.wb_sunny_outlined,
                      size: 55,
                      color: Color(0xFFFFB300),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Dia livre! ✨',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Adicione uma tarefa para começar.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              )
            else
              FilledButton.icon(
                onPressed: _abrirTarefas,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF6200EE),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                icon: const Icon(Icons.checklist_rounded),
                label: const Text('VER LISTA DE TAREFAS'),
              ),
          ],
        ),
      ),
    );
  }
}
