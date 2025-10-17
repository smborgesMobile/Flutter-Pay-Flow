import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/blocs/user_event.dart';
import 'package:learning_project/blocs/user_state.dart';
import 'package:learning_project/data/repositories/user_respository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRespository;

  UserBloc(this.userRespository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final users = await userRespository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
