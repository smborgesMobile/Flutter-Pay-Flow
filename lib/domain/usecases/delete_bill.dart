import '../repositories/bill_repository.dart';

class DeleteBill {
  final BillRepository repository;
  DeleteBill(this.repository);

  Future<void> call(String code) async {
    return repository.deleteBill(code);
  }
}
