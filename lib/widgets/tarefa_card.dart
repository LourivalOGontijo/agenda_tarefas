import 'package:flutter/material.dart';

import '../models/tarefa.dart';

class TarefaCard extends StatelessWidget {
  final Tarefa tarefa;
  final VoidCallback onConcluir;
  final VoidCallback onExcluir;

  const TarefaCard({
    super.key,
    required this.tarefa,
    required this.onConcluir,
    required this.onExcluir,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      color: tarefa.concluida
          ? const Color(0xFFE8F5E9)
          : const Color(0xFFF5F0FF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: GestureDetector(
          onTap: onConcluir,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: tarefa.concluida
                  ? const LinearGradient(
                      colors: [Color(0xFF00C853), Color(0xFF64DD17)],
                    )
                  : const LinearGradient(
                      colors: [Color(0xFF7C4DFF), Color(0xFFE040FB)],
                    ),
            ),
            child: Icon(
              tarefa.concluida ? Icons.check : Icons.circle_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        title: Text(
          tarefa.titulo,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: tarefa.concluida ? TextDecoration.lineThrough : null,
            color: tarefa.concluida
                ? Colors.green.shade700
                : const Color(0xFF29213D),
          ),
        ),
        subtitle: Text(
          tarefa.concluida ? 'Concluída' : 'Pendente',
          style: TextStyle(
            color: tarefa.concluida
                ? Colors.green.shade600
                : const Color(0xFF7C4DFF),
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: onExcluir,
          icon: const Icon(
            Icons.delete_outline_rounded,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
