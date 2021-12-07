import 'package:flutter/material.dart';
import 'package:wild_sheep_chase/models/user.dart';
import 'package:wild_sheep_chase/screens/authenticate/authenticate.dart';
import 'home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {}
    return Home();
  }
}
