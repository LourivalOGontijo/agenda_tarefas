import 'package:flutter/material.dart';

class TarefaDialog extends StatefulWidget {
  final String dataFormatada;

  const TarefaDialog({super.key, required this.dataFormatada});

  @override
  State<TarefaDialog> createState() => _TarefaDialogState();
}

class _TarefaDialogState extends State<TarefaDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _adicionar() {
    final titulo = _controller.text.trim();

    if (titulo.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Digite uma tarefa.')));
      return;
    }

    Navigator.pop(context, titulo);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      title: const Text(
        'Nova tarefa ✨',
        style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4527A0)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.dataFormatada,
            style: const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            autofocus: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _adicionar(),
            decoration: InputDecoration(
              hintText: 'Digite sua tarefa...',
              filled: true,
              fillColor: const Color(0xFFF5F0FF),
              prefixIcon: const Icon(
                Icons.edit_note_rounded,
                color: Color(0xFF7C4DFF),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCELAR'),
        ),
        FilledButton(
          onPressed: _adicionar,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF7C4DFF),
          ),
          child: const Text('ADICIONAR'),
        ),
      ],
    );
  }
}
