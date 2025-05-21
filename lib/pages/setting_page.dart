import 'package:flutter/material.dart';
import 'package:learnblocprovider/extensions/context_extensioin.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(context.language.setting),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: DropdownButton<String>(
            value: 'ar',
            icon: Icon(Icons.keyboard_arrow_down),
            items: ['ar', "en"].map(
              (String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              },
            ).toList(),
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
