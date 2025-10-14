import '../../shared/models/bill_model.dart';
import '../repositories/bill_repository.dart';

class GetBills {
  final BillRepository repository;
  GetBills(this.repository);

  Future<List<Bill>> call() async {
    return repository.getBills();
  }
}
