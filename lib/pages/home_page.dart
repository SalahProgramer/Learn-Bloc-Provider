import 'package:flutter/material.dart';
import 'package:learnblocprovider/extensions/context_extensioin.dart';
import 'package:learnblocprovider/pages/setting_page.dart';

import '../widgets/floating_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(

        actions: [

          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingPage(),));

          }, icon: Icon(Icons.settings))
        ],

        title: Text(context.language.home),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              context.language.hello_msg,
            )





//             BlocBuilder<CounterBloc,CounterState>(builder: (context, state) {
//               if(state is CounterInitial){
// return  Text(
//   '0',
//   style: Theme.of(context).textTheme.headlineMedium,
// );
//
//
//               }
//               else if(state is CounterValueChangedState){
//
//
//                 return  Text(
//                   state.counter.toString(),
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 );
//               }
//               return Container();
//
//
//
//             }
//             ,)
          ],
        ),
      ),
      floatingActionButton: FloatingButtons(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
