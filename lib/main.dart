import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/firebase_options.dart';
import 'package:firebase_authentication/repository/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final AuthRepository authInstance = AuthRepository();

  String status = "";

  String email = "dirk.kraft.akademie@gmail.com";

  String password = "12345678";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(status),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    authInstance.loginUser(email, password);
                  },
                  child: const Text("einloggen")),
              ElevatedButton(
                  onPressed: () {
                    authInstance.logoutUser();
                  },
                  child: const Text("ausloggen")),
              ElevatedButton(
                  onPressed: () {
                    User? user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      setState(() {
                        status = ("Der Benutzer ist eingeloggt: ${user.email}");
                      });
                    } else {
                      setState(() {
                        status = ("Kein Benutzer eingeloggt.");
                      });
                    }
                  },
                  child: Text(status))
            ],
          ),
        ),
      ),
    );
  }
}
