import '../../shared/models/bill_model.dart';

abstract class BillRepository {
  Future<List<Bill>> getBills();
  Future<void> addBill(Bill bill);
  Future<void> updateBill(Bill bill);
  Future<void> deleteBill(String code);
}
