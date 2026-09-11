class Tarefa {
  String id;
  String titulo;
  DateTime data;
  bool concluida;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.data,
    this.concluida = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'data': data.toIso8601String(),
      'concluida': concluida,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map) {
    return Tarefa(
      id: map['id'],
      titulo: map['titulo'],
      data: DateTime.parse(map['data']),
      concluida: map['concluida'] ?? false,
    );
  }
}
