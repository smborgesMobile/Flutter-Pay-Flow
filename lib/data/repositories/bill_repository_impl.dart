import '../../shared/models/bill_model.dart';
import '../../domain/repositories/bill_repository.dart';
import '../datasources/bill_local_datasource.dart';

class BillRepositoryImpl implements BillRepository {
  final BillLocalDataSource local;
  BillRepositoryImpl({required this.local});

  @override
  Future<void> addBill(Bill bill) async {
    final bills = await local.getBills();
    final updated = [...bills, bill];
    await local.cacheBills(updated);
  }

  @override
  Future<void> deleteBill(String code) async {
    final bills = await local.getBills();
    final filtered = bills.where((b) => b.code != code).toList();
    await local.cacheBills(filtered);
  }

  @override
  Future<List<Bill>> getBills() async {
    final bills = await local.getBills();
    return bills;
  }

  @override
  Future<void> updateBill(Bill bill) async {
    final bills = await local.getBills();
    final idx = bills.indexWhere((b) => b.code == bill.code);
    if (idx != -1) {
      bills[idx] = bill;
    } else {
      bills.add(bill);
    }

    await local.cacheBills(bills);
  }
}
