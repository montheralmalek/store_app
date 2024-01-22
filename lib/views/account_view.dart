import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/session_cubits/session_cubit.dart';
import 'package:store_app/cubits/session_cubits/session_states.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/widgets/not_logedin_widget.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        if (state is SessionCreated) {
          return Center(
            child: Column(
              children: [
                const Text(
                  'Account page',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    BlocProvider.of<SessionCubit>(context).closeSession();
                    Navigator.pushNamed(context, LoginView.id);
                  },
                  label: const Text('logout'),
                  icon: const Icon(Icons.logout_outlined),
                )
              ],
            ),
          );
        } else {
          return const Center(
            child: NotLogedInWidget(),
          );
        }
      },
    );
  }
}
