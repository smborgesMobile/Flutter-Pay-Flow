import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_project/presentation/blocs/user_bloc.dart';
import 'package:learning_project/presentation/blocs/user_event.dart';
import 'package:learning_project/presentation/blocs/user_state.dart';
import 'package:learning_project/data/models/user_model.dart' show UserModel;
import 'package:learning_project/data/repositories/user_respository.dart';

class FetchApiPage extends StatelessWidget {
  const FetchApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return userBlocWidget();
  }

  Widget userBlocWidget() {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      title: Text(
                        '${userList[index].firstName}  ${userList[index].lastName}',
                        style: const TextStyle(color: Colors.white),
                      ),

                      subtitle: Text(
                        '${userList[index].email}',
                        style: const TextStyle(color: Colors.white),
                      ),

                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          userList[index].avatar.toString(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
