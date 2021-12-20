import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:prueba_ingreso_ceiba/domain/entities/user.dart';
import 'package:prueba_ingreso_ceiba/injection_container.dart';
import 'package:prueba_ingreso_ceiba/presentation/cubit/users/user_cubit.dart';
import 'package:prueba_ingreso_ceiba/presentation/views/widgets/list_view_user.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserCubit>(),
      child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        if (state is UsersInitial) {
          _getUsers(context);
          return Center(
            child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: const [Colors.green],
                strokeWidth: 2.0,
              ),
            ),
          );
        } else if (state is UsersLoaded) {
          final users = state.users;
          return ListViewUser(users: users);
        } else if (state is UsersLoading) {
          return Center(
            child: SizedBox(
              height: 50.0,
              width: 50.0,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: const [Colors.green],
                strokeWidth: 2.0,
              ),
            ),
          );
        } else {
          return Container(
            child: Center(
              child: Column(
                children: [
                  Text('Error!'),
                  ElevatedButton(
                    onPressed: null,
                    child: Text('Reload'),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  void _getUsers(BuildContext context, {User user}) async {
    final userCubit = context.read<UserCubit>();
    userCubit.getNewUser();
  }
}
