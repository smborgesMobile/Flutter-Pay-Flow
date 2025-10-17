import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/shared/models/bill_model.dart';
import 'package:learning_project/domain/usecases/add_bill.dart';
import 'package:learning_project/domain/usecases/get_bills.dart';
import 'package:learning_project/domain/usecases/update_bill.dart';
import 'package:learning_project/domain/usecases/delete_bill.dart';

class BillCubit extends Cubit<List<Bill>> {
  final GetBills getBillsUsecase;
  final AddBill addBillUsecase;
  final UpdateBill updateBillUsecase;
  final DeleteBill deleteBillUsecase;

  BillCubit({
    required this.getBillsUsecase,
    required this.addBillUsecase,
    required this.updateBillUsecase,
    required this.deleteBillUsecase,
  }) : super([]) {
    loadBills();
  }

  Future<void> addBill(Bill bill) async {
    await addBillUsecase.call(bill);
    emit([...state, bill]);
  }

  Future<void> loadBills() async {
    final bills = await getBillsUsecase.call();
    emit(bills);
  }

  List<Bill> getPaidBills() {
    return state.where((bill) => bill.isPaid).toList();
  }

  List<Bill> getUnpaidBills() {
    return state.where((bill) => !bill.isPaid).toList();
  }

  Future<void> markBillAsPaid(Bill bill) async {
    final updated = Bill(
      nome: bill.nome,
      date: bill.date,
      value: bill.value,
      code: bill.code,
      isPaid: true,
    );
    await updateBillUsecase.call(updated);

    final newState = state.map((b) => b.code == bill.code ? updated : b).toList();
    emit(newState);
  }

  Future<void> deleteBill(Bill bill) async {
    await deleteBillUsecase.call(bill.code);
    final newState = state.where((b) => b.code != bill.code).toList();
    emit(newState);
  }
}
