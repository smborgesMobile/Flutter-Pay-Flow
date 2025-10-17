import 'package:get_it/get_it.dart';
import 'package:learning_project/data/datasources/bill_local_datasource.dart';
import 'package:learning_project/data/repositories/bill_repository_impl.dart';
import 'package:learning_project/domain/repositories/bill_repository.dart';
import 'package:learning_project/domain/usecases/add_bill.dart';
import 'package:learning_project/domain/usecases/get_bills.dart';
import 'package:learning_project/domain/usecases/update_bill.dart';
import 'package:learning_project/domain/usecases/delete_bill.dart';
import 'package:learning_project/blocs/bill_cubit.dart';
import 'package:learning_project/data/repositories/user_respository.dart';
import 'package:learning_project/blocs/user_bloc.dart';

/// Very small factory-style DI helper. Keep it tiny so it's easy to migrate
/// to get_it or another DI container in the future. Use `Injection` for
/// quick local construction or call `init()` to register app-wide
/// singletons/factories via GetIt.
class Injection {
  static UserRepository provideUserRepository() => UserRepository();

  static UserBloc provideUserBloc() => UserBloc(provideUserRepository());
}

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  final billLocalDataSource = BillLocalDataSourceImpl();
  sl.registerLazySingleton<BillLocalDataSource>(() => billLocalDataSource);

  // Repositories (register under abstraction)
  sl.registerLazySingleton<BillRepository>(() => BillRepositoryImpl(local: billLocalDataSource));

  // Usecases
  sl.registerLazySingleton(() => GetBills(sl()));
  sl.registerLazySingleton(() => AddBill(sl()));
  sl.registerLazySingleton(() => UpdateBill(sl()));
  sl.registerLazySingleton(() => DeleteBill(sl()));

  // Cubit - factory so widgets can receive new instances if needed
  sl.registerFactory(() => BillCubit(
        getBillsUsecase: sl(),
        addBillUsecase: sl(),
        updateBillUsecase: sl(),
        deleteBillUsecase: sl(),
      ));
}

