import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocprovider/extensions/context_extensioin.dart';

import '../cubits/cubit/local_cubit.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localCubit = context.read<LocalCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.language.setting),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: BlocConsumer<LocalCubit, ChangeLocalState>(
            // BlocListener + BlocBuilder
            listener: (context, state) {
              // if do change the language do action in listener
              // if (state is ChangeLocalState) {
              Navigator.of(context).pop();
              // }
            },
            builder: (context, state) {
              return DropdownButton<String>(
                value: state.locale.languageCode,
                icon: Icon(Icons.keyboard_arrow_down),
                items: ['ar', "en"].map(
                  (String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  },
                ).toList(),
                onChanged: (value) async {
                  if (value != null) {
                    await localCubit.changeLanguage(value);
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
