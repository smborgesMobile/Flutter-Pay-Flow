import '../../shared/models/bill_model.dart';
import '../repositories/bill_repository.dart';

class UpdateBill {
  final BillRepository repository;
  UpdateBill(this.repository);

  Future<void> call(Bill bill) async {
    return repository.updateBill(bill);
  }
}
