import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/shared/models/bill_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BillCubit extends Cubit<List<Bill>> {
  BillCubit() : super([]) {
    loadBills();
  }

  Future<void> addBill(Bill bill) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> bills = prefs.getStringList("bills") ?? [];
    bills.add(jsonEncode(bill.toJson()));
    await prefs.setStringList("bills", bills);
    emit([...state, bill]);
  }

  Future<void> loadBills() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? billsString = prefs.getStringList('bills');
    if (billsString != null && billsString.isNotEmpty) {
      List<Bill> loadedBills = billsString
          .map((billJson) => Bill.fromJson(jsonDecode(billJson)))
          .toList();

      emit(loadedBills);
    }
  }

  List<Bill> getPaidBills() {
    return state.where((bill) => bill.isPaid).toList();
  }

  List<Bill> getUnpaidBills() {
    return state.where((bill) => !bill.isPaid).toList();
  }

  Future<void> markBillAsPaid(Bill bill) async {
    final index = state.indexOf(bill);
    if (index != -1) {
      final updatedBill = Bill(
        nome: bill.nome,
        date: bill.date,
        value: bill.value,
        code: bill.code,
        isPaid: true,
      );

      final prefs = await SharedPreferences.getInstance();
      List<String> bills = prefs.getStringList("bills") ?? [];
      bills[index] = jsonEncode(updatedBill.toJson());
      await prefs.setStringList("bills", bills);
      emit([...state]..[index] = updatedBill);
    }
  }
}
