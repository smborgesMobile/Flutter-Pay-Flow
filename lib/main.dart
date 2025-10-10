import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/blocs/bill_cubit.dart';
import 'package:learning_project/firebase_widget.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => BillCubit(),
      child: const MaterialApp(home: AppFirebase()),
    ),
  );
}
