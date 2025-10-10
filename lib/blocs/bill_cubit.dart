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
    print("SM.BORGES - BILLS ${billsString}");
    if (billsString != null && billsString.isNotEmpty) {
      print("SM.BORGES - IS NO NULL ${billsString}");

      List<Bill> loadedBills = billsString
          .map((billJson) => Bill.fromJson(jsonDecode(billJson)))
          .toList();

      print("SM.BORGES - LOADED BILLS ${loadedBills}");

      emit(loadedBills);
    }
  }
}
