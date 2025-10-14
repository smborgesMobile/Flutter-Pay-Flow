import '../../shared/models/bill_model.dart';
import '../repositories/bill_repository.dart';

class AddBill {
  final BillRepository repository;
  AddBill(this.repository);

  Future<void> call(Bill bill) async {
    return repository.addBill(bill);
  }
}
