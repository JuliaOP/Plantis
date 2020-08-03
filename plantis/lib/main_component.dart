import 'package:flutter/material.dart';

import 'component_list.dart';

class MainComponent extends StatefulWidget {
  MainComponent({Key key}) : super(key: key);

  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  int _selectedIndex = 0;
  bool _visible = true;

  final _animationTime = 250;

  void _onItemTapped(int index) {
    setState(() {
      _visible = false;
    });

    Future.delayed(Duration(milliseconds: _animationTime), () {
      setState(() {
        _selectedIndex = index;
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(milliseconds: _animationTime),
        opacity: _visible ? 1.0 : 0.0,
        child: Center(
          child: componentList[_selectedIndex].widget,
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  _bottomNavigationBar() {
    final _selectedItemColor = Color(0xff1766B1);
    final _unselectedItemColor = Color(0xffCDD5EE);
    final _iconSize = 27.0;

    return BottomNavigationBar(
      items: componentList
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                title: Text(item.title),
              ))
          .toList(),
      currentIndex: _selectedIndex,
      selectedItemColor: _selectedItemColor,
      unselectedItemColor: _unselectedItemColor,
      iconSize: _iconSize,
      onTap: _onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
