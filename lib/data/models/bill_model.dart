import 'dart:convert';
import '../../domain/entities/bill.dart';

class BillModel extends Bill {
  const BillModel({
    required super.nome,
    required super.date,
    required super.value,
    required super.code,
    super.isPaid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': nome,
      'date': date,
      'valor': value,
      'code': code,
      'isPaid': isPaid,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory BillModel.fromMap(Map<String, dynamic> map) {
    return BillModel(
      nome: map['name'] ?? '',
      date: map['date'] ?? '',
      value: map['valor'] ?? '',
      code: map['code'] ?? '',
      isPaid: map['isPaid'] ?? false,
    );
  }

  factory BillModel.fromJson(String source) => BillModel.fromMap(jsonDecode(source));
}
