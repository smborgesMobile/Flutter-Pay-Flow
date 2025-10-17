import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/presentation/blocs/bill_cubit.dart';
import 'package:learning_project/firebase_widget.dart';
import 'package:learning_project/di/injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    BlocProvider(
      create: (_) => di.sl<BillCubit>(),
      child: const MaterialApp(home: AppFirebase()),
    ),
  );
}
