class Bill {
  final String nome;
  final String date;
  final String value;
  final String code;
  final bool isPaid;

  const Bill({
    required this.nome,
    required this.date,
    required this.value,
    required this.code,
    this.isPaid = false,
  });

  Bill copyWith({
    String? nome,
    String? date,
    String? value,
    String? code,
    bool? isPaid,
  }) {
    return Bill(
      nome: nome ?? this.nome,
      date: date ?? this.date,
      value: value ?? this.value,
      code: code ?? this.code,
      isPaid: isPaid ?? this.isPaid,
    );
  }
}
