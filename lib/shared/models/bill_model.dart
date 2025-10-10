class Bill {
  final String nome;
  final String date;
  final String value;
  final String code;
  bool isPaid;

  Bill({
    required this.nome,
    required this.date,
    required this.value,
    required this.code,
    this.isPaid = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': nome,
      'date': date,
      'valor': value,
      'code': code,
      'isPaid': isPaid,
    };
  }

  static Bill fromJson(Map<String, dynamic> json) {
    return Bill(
      nome: json["name"],
      date: json["date"],
      value: json["valor"],
      code: json["code"],
      isPaid: json["isPaid"] ?? false,
    );
  }
}
