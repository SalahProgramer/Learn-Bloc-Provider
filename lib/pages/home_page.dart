part of '../core/imports/home_page_imports.dart';

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
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ));
              },
              icon: Icon(Icons.settings))
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
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ConnectionPage()));
              },
              child: Text(
                context.language.connection,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => TodoPage()));
              },
              child: Text(
                "To do",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PostsPage()));
              },
              child: Text(
                "Posts",
              ),
            )
          ],
        ),
      ),
      floatingActionButton:
          FloatingButtons(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
