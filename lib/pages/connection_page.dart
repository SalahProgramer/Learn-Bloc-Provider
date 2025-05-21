import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocprovider/cubit_connection/internet_cubit.dart';
import 'package:learnblocprovider/extensions/context_extensioin.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.language.connection),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is ConnectedState) {
                  return Text(
                    state.message,
                  );
                } else if (state is NotConnectedState) {
                  return Text(
                    state.message,
                  );
                }

                return SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}
