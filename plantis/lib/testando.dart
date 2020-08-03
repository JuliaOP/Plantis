import 'package:flutter/material.dart';
import 'package:plantis/animations/fade_animation.dart';
import 'package:plantis/models/dialogs.dart';
import 'package:plantis/services/auth.dart';

class Testando extends StatelessWidget {
  final AuthService _auth = AuthService(); //access auth log out , sign out
  Dialogs dialogs = new Dialogs();

  final _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SingleChildScrollView(
        child: _home(context),
      ),
    );
  }

  _home(BuildContext context) {
    var _containerHeight = 0.0;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      _containerHeight = MediaQuery.of(context).size.height / 2.3;
    } else {
      _containerHeight = MediaQuery.of(context).size.height / 3.7;
    }

    final _containerWidth = MediaQuery.of(context).size.width;
    final _borderRadius = BorderRadius.only(
        bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15));

    final _linearGradient = LinearGradient(
      colors: <Color>[
        Color(0xff00c6b9),
        Color(0xff13da8c),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final _paddingAll = 15.0;

    return Container(
      width: _containerWidth,
      child: Stack(
        children: [
          Container(
            width: _containerWidth,
            height: _containerHeight,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              gradient: _linearGradient,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_paddingAll),
            child: _contentHome(context),
          ),
        ],
      ),
    );
  }

  _contentHome(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        _contentBanner(context),
        SizedBox(
          height: 15.0,
        ),
        _cardCultivo(context),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 35),
          child: _addButton(),
        ),
      ],
    );
  }

  _contentBanner(BuildContext context) {
    return Column(
      children: [
        _backArrow(),
        _tituloHome(),
      ],
    );
  }

  _backArrow() {
    final _icon = Icons.arrow_back_ios;
    final _iconSize = 20.0;
    final _iconColor = Colors.white;
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print("back");
          },
          child: FadeAnimation(
            1.0,
            Icon(
              _icon,
              color: _iconColor,
              size: _iconSize,
            ),
          ),
        ),
        Spacer(),
        FadeAnimation(
            1.0,
            FlatButton.icon(
              icon: Icon(Icons.person),
              color: Colors.white,
              label: Text("logout"),
              onPressed: () {
                print("logout");
              },
            )),
      ],
    );
  }

  _tituloHome() {
    final _alignment = Alignment.topLeft;
    return FadeAnimation(
        1.1,
        Align(
          alignment: _alignment,
          child: Text(
            "Lista de Cultivo",
            style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: "Metropolis semi bold",
                height: 1.2,
                wordSpacing: 1,
                letterSpacing: 0.8),
          ),
        ));
  }

//usar Future Builder class
  _cardCultivo(BuildContext context) {
    final _borderRadius = BorderRadius.circular(15.0);
    final _boxShadow = BoxShadow(
      blurRadius: 8,
      offset: Offset(0, 4),
      color: Colors.black.withOpacity(0.3),
      spreadRadius: 1,
    );
    final _containerColor = Colors.white;

    final _innerPaddingLeftRight = 10.0;
    final _innerPaddingTopBottom = 5.0;

    final _containerWidth = MediaQuery.of(context).size.width;
    final _containerHeight = 100.0;

    final _alignment = Alignment.topLeft;

    final _image = "images/Agrupar 775.png";
    return FadeAnimation(
        1.2,
        GestureDetector(
          onTap: () {
            print("ACIONADO: (seta) entrar na lista da planta");
          },
          child: Container(
            width: _containerWidth,
            height: _containerHeight,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _containerColor,
              boxShadow: [_boxShadow],
            ),
            child: Padding(
              padding: (EdgeInsets.only(
                  left: _innerPaddingLeftRight,
                  right: _innerPaddingLeftRight,
                  bottom: _innerPaddingTopBottom,
                  top: _innerPaddingTopBottom)),
              child: Row(children: [
                SizedBox(
                  width: 5,
                ),
                Image.asset(
                  _image,
                  height: 65,
                  width: 65,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(children: [
                  Spacer(),
                  Align(
                    alignment: _alignment,
                    child: Text(
                      "LISTA DE PLANTAS",
                      style: TextStyle(
                        fontFamily: "Metropolis semi bold",
                        fontWeight: FontWeight.normal,
                        fontSize: 9,
                        letterSpacing: 1.1,
                        height: 0.8,
                        color: Color(0xff919191),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Flexible(
                    child: Align(
                      alignment: _alignment,
                      child: Text(
                        "Descrição ...",
                        style: TextStyle(
                          fontFamily: "Metropolis semi bold",
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Color(0xff323643),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ]),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("ACIONADO: (caneta) editar lista de plantas");
                      },
                      child: Image.asset(
                        "images/Agrupar 686.png",
                        height: 30,
                        width: 30,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("ACIONADO: (seta) entrar na lista da planta");
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black.withOpacity(0.2),
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }

  _addButton() {
    final _iconHeight = 70.0;
    final _iconWidth = 70.0;
    final _icon = "images/Agrupar 214.png";
    return FadeAnimation(
      1.3,
      Row(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              print("ACIONADO: botao + , adicionar cultivo");
            },
            child: Image.asset(
              _icon,
              height: _iconHeight,
              width: _iconWidth,
            ),
          ),
        ],
      ),
    );
  }
}
