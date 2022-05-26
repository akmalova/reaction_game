import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/finish_page.dart';
import 'screens/game_page.dart';
import 'screens/login_page.dart';
import 'screens/rating_page.dart';
import 'screens/start_page.dart';
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
      child: MaterialApp(
        title: 'Reaction Game',
        routes: {
          '/login': (context) => const LoginPage(),
          '/start': (context) => const StartPage(),
          '/game': (context) => const GamePage(),
          '/finish': (context) => const FinishPage(),
          '/rating': (context) => const RatingPage(),
        },
        initialRoute: '/login',
      ),
    );
  }
}
