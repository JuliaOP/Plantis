import 'package:flutter/material.dart';
import 'package:plantis/main_component.dart';
import 'package:plantis/screens/wrapper.dart';
import 'package:plantis/services/auth.dart';
import 'package:plantis/testando.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainComponent(),
      ),
    );
  }
}
