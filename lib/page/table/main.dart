
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masante/page/table/page/editable_page.dart';
import 'package:masante/page/table/widget/tabbar_widget.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyTab());
}

class MyTab extends StatelessWidget {
  static final String title = 'Data Table';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Liste dossiers',
        tabs: const [
          Tab(icon: Icon(Icons.select_all_outlined), text: 'Tout'),
          Tab(icon: Icon(Icons.person), text: 'Utilisateur'),
          Tab(icon: Icon(Icons.calendar_month), text: "Date d'ajout"),
        ],
        children: [
          EditablePage(),
          Container(),
          Container(),
        ],
      );
}
