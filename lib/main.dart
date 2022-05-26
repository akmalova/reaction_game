import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/login_page.dart';
import 'services/database.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DatabaseService _database = DatabaseService();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DatabaseService>(
      create: (BuildContext context) => _database,
      child: const MaterialApp(
        title: 'Reaction Game',
        home: LoginPage(),
      ),
    );
  }
}
