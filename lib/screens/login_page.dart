import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'start_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Whats your name?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onSubmitted: (String name) {
                  Provider.of<DatabaseService>(context, listen: false)
                      .addUser(name);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return const StartPage();
                    }),
                  );
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  labelText: 'Name',
                  filled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
