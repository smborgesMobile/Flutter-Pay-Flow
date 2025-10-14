import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/models/bill_model.dart';

abstract class BillLocalDataSource {
  Future<List<Bill>> getBills();
  Future<void> cacheBills(List<Bill> bills);
}

class BillLocalDataSourceImpl implements BillLocalDataSource {
  static const _kBillsKey = 'bills';

  @override
  Future<List<Bill>> getBills() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? billsString = prefs.getStringList(_kBillsKey);
    if (billsString == null) return [];
    return billsString.map((s) => Bill.fromJson(jsonDecode(s))).toList();
  }

  @override
  Future<void> cacheBills(List<Bill> bills) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> list = bills.map((b) => jsonEncode(b.toJson())).toList();
    await prefs.setStringList(_kBillsKey, list);
  }
}
