import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learning_project/data/models/user_model.dart' show UserModel;

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
