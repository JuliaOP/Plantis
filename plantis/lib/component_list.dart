import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantis/screens/home/home.dart';
import 'package:plantis/screens/userdata/pages/userdata.dart';
import 'package:plantis/testando.dart';

class ComponentListItem {
  Widget widget;
  IconData icon;
  String title;

  ComponentListItem({this.widget, this.icon, this.title});
}

List<ComponentListItem> componentList = [
  ComponentListItem(
      widget: Home(), icon: Icons.dashboard, title: 'Home - Lista de Cultivos'),
  ComponentListItem(
      widget: Container(height: 100, width: 100, color: Colors.red),
      icon: Icons.monetization_on,
      title: 'blabla'),
  ComponentListItem(
      widget: Container(height: 100, width: 100, color: Colors.yellow),
      icon: Icons.fingerprint,
      title: 'Test'),
  ComponentListItem(
      widget: UserData(),
      icon: Icons.account_circle,
      title: 'Dados Cadastrais'),
];
