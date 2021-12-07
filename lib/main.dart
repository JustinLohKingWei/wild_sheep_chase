import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wild_sheep_chase/models/user.dart';
import 'package:wild_sheep_chase/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wild_sheep_chase/services/auth.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // EDITED MAIN METHOD TO AVOID RED SCREEN TUT 5
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<LocalUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
