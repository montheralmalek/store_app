import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/session_cubits/session_cubit.dart';
import 'package:store_app/cubits/session_cubits/session_states.dart';
import 'package:store_app/widgets/not_logedin_widget.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.chat,
          size: 32,
          //color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BlocBuilder<SessionCubit, SessionState>(
                  builder: (context, state) {
                    if (state is SessionCreated) {
                      return const AlertDialog(
                        content: SizedBox(
                          height: 200,
                          child: Center(
                            child: Text('You are loged in'),
                          ),
                        ),
                        //actions: <Widget>[],
                      );
                    } else {
                      return const AlertDialog(
                        content: NotLogedInWidget(),
                        //actions: <Widget>[],
                      );
                    }
                  },
                );
              });
        }, // Navigator.pushNamed(context, AddProductView.id),
      ),
    );
  }
}
