import 'package:flutter/material.dart';
import 'package:plantis/models/user.dart';
import 'package:plantis/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';
import 'package:plantis/services/auth.dart';

//listen to authentication changes, then displays either authenticate or home

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }

  }
}
