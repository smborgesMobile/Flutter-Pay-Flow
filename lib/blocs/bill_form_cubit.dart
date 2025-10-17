import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class BillFormState extends Equatable {
  final String name;
  final String date;
  final String value;
  final String code;
  final String? nameError;
  final String? dateError;
  final String? valueError;
  final String? codeError;

  const BillFormState({
    this.name = '',
    this.date = '',
    this.value = '',
    this.code = '',
    this.nameError,
    this.dateError,
    this.valueError,
    this.codeError,
  });

  bool get isValid =>
      name.isNotEmpty && date.isNotEmpty && value.isNotEmpty && code.isNotEmpty &&
      nameError == null && dateError == null && valueError == null && codeError == null;

  BillFormState copyWith({
    String? name,
    String? date,
    String? value,
    String? code,
    String? nameError,
    String? dateError,
    String? valueError,
    String? codeError,
  }) {
    return BillFormState(
      name: name ?? this.name,
      date: date ?? this.date,
      value: value ?? this.value,
      code: code ?? this.code,
      nameError: nameError,
      dateError: dateError,
      valueError: valueError,
      codeError: codeError,
    );
  }

  @override
  List<Object?> get props => [name, date, value, code, nameError, dateError, valueError, codeError];
}

class BillFormCubit extends Cubit<BillFormState> {
  BillFormCubit() : super(const BillFormState());

  void nameChanged(String value) {
    emit(_validate(state.copyWith(name: value)));
  }

  void dateChanged(String value) {
    emit(_validate(state.copyWith(date: value)));
  }

  void valueChanged(String value) {
    emit(_validate(state.copyWith(value: value)));
  }

  void codeChanged(String value) {
    emit(_validate(state.copyWith(code: value)));
  }

  BillFormState _validate(BillFormState s) {
    String? nameError;
    String? dateError;
    String? valueError;
    String? codeError;

    if (s.name.isEmpty) {
      nameError = 'Nome obrigatório';
    }

    if (s.date.isEmpty) {
      dateError = 'Data obrigatória';
    } else {
      final parts = s.date.split('/');
      if (parts.length != 3 || parts[0].length != 2 || parts[1].length != 2 || parts[2].length != 4) {
        dateError = 'Formato inválido';
      }
    }

    if (s.value.isEmpty) {
      valueError = 'Valor obrigatório';
    }

    if (s.code.isEmpty) {
      codeError = 'Código obrigatório';
    } else if (s.code.length < 10) {
      codeError = 'Código muito curto';
    }

    return s.copyWith(
      nameError: nameError,
      dateError: dateError,
      valueError: valueError,
      codeError: codeError,
    );
  }
}
