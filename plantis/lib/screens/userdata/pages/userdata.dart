import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:plantis/animations/fade_animation.dart';

class UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _backgroundColor = Colors.white;
    return Scaffold(
        backgroundColor: _backgroundColor,
        body: SingleChildScrollView(
          child: _home(context),
        ));
  }

  _home(BuildContext context) {
    var _containerHeight = 0.0;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      _containerHeight = MediaQuery.of(context).size.height / 1.3;
    } else {
      _containerHeight = MediaQuery.of(context).size.height / 2.3;
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
        _campoNome(context),
        SizedBox(
          height: 15,
        ),
        _campoEmail(context),
        SizedBox(
          height: 15,
        ),
        _campoTelefone(context),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 35),
          //   child: _addButton(),
        ),
      ],
    );
  }

  _contentBanner(BuildContext context) {
    final _innerPadding = 10.0;
    final _innerPaddingLeft = 10.0;
    final _innerPaddingRight = 5.0;
    final _innerPaddingTopBottom = 10.0;
    return Padding(
      padding: EdgeInsets.only(
          left: _innerPaddingLeft,
          right: _innerPaddingRight,
          bottom: _innerPaddingTopBottom,
          top: _innerPaddingTopBottom),
      child: Column(
        children: [
          SizedBox(height: 5.0),
          _backArrow(),
          SizedBox(height: 10.0),
          _tituloPerfil(),
          SizedBox(height: 5.0),
          _avatarPerfil(),
        ],
      ),
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
      ],
    );
  }

  _tituloPerfil() {
    final _alignment = Alignment.topLeft;
    return FadeAnimation(
        1.1,
        Align(
          alignment: _alignment,
          child: Text(
            "Perfil",
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

  _avatarPerfil() {
    final _image = "images/Group -2.png";
    final _alignment = Alignment.topLeft;
    final _alignment2 = Alignment.bottomRight;

    final _containerHeight = 40.0;
    final _containerWidth = 120.0;

    final _boxShadow = BoxShadow(
      blurRadius: 1,
      offset: Offset(0, 1),
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 1.0,
    );

    final _borderRadius = BorderRadius.circular(10.0);

    final _logout = "Logout";
    final _textColor = Color(0xffFFFFFF);
    final _fontSize = 15.0;
    final _fontFamily = "metropolis bold";
    final _alignmentText = Alignment.center;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: _alignment,
          child: FadeAnimation(
            1.2,
            GestureDetector(
              onTap: () {
                print("editar avatar");
              },
              child: Image.asset(
                _image,
                height: 130,
                width: 130,
              ),
            ),
          ),
        ),
        Spacer(),
        Column(
          children: [
            //Spacer(),
            SizedBox(
              height: 45,
            ),
            FadeAnimation(
                1.0,
                Align(
                  alignment: _alignment2,
                  child: GestureDetector(
                    onTap: () {
                      print("logout");
                    },
                    child: Container(
                      alignment: _alignmentText,
                      height: _containerHeight,
                      width: _containerWidth,
                      decoration: BoxDecoration(
                        color: Color(0xff00c6b9),
                        borderRadius: _borderRadius,
                        boxShadow: [_boxShadow],
                      ),
                      child: Text(
                        _logout,
                        style: TextStyle(
                            fontFamily: _fontFamily,
                            fontSize: _fontSize,
                            color: _textColor),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }

  _campoNome(BuildContext context) {
    final _containerHeight = 70.0;
    final _containerWidth = MediaQuery.of(context).size.width;
    final _borderRadius = BorderRadius.circular(12.0);
    final _boxShadow = BoxShadow(
      blurRadius: 3,
      offset: Offset(0, 3),
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 1.0,
    );
    final _containerColor = Color(0xffFFFFFF);
    return FadeAnimation(
      1.2,
      Container(
        height: _containerHeight,
        width: _containerWidth,
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: _borderRadius,
          boxShadow: [_boxShadow],
        ),
        child: _contentCampoNome(),
      ),
    );
  }

  _contentCampoNome() {
    final _alignment = Alignment.topLeft;

    final _innerPaddingLeft = 20.0;
    final _innerPaddingTop = 15.0;
    final _innerPaddingBottom = 10.0;
    final _innerPaddingRight = 20.0;

    final _tituloCampo = "NOME";
    final _tituloFontFamily = "metropolis semi bold";
    final _tituloFontSize = 13.0;
    final _tituloLetterspacing = 2.0;
    final _tituloColor = Color(0xff919191);

    final _entradaColor = Color(0xff323643);
    final _entradaFontSize = 12.0;

    return Padding(
      padding: EdgeInsets.only(
          left: _innerPaddingLeft,
          right: _innerPaddingRight,
          bottom: _innerPaddingBottom,
          top: _innerPaddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _tituloCampo,
            style: TextStyle(
                color: _tituloColor,
                fontSize: _tituloFontSize,
                fontFamily: _tituloFontFamily,
                letterSpacing: _tituloLetterspacing),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: _alignment,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: _entradaColor,
                    helperStyle: TextStyle(
                      color: _entradaColor,
                      fontFamily: _tituloFontFamily,
                      fontSize: _entradaFontSize,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _campoEmail(BuildContext context) {
    final _containerHeight = 70.0;
    final _containerWidth = MediaQuery.of(context).size.width;
    final _borderRadius = BorderRadius.circular(12.0);
    final _boxShadow = BoxShadow(
      blurRadius: 3,
      offset: Offset(0, 3),
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 1.0,
    );
    final _containerColor = Color(0xffFFFFFF);
    return FadeAnimation(
      1.3,
      Container(
        height: _containerHeight,
        width: _containerWidth,
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: _borderRadius,
          boxShadow: [_boxShadow],
        ),
        child: _contentCampoEmail(),
      ),
    );
  }

  _contentCampoEmail() {
    final _alignment = Alignment.topLeft;

    final _innerPaddingLeft = 20.0;
    final _innerPaddingTop = 15.0;
    final _innerPaddingBottom = 10.0;
    final _innerPaddingRight = 20.0;

    final _tituloCampo = "EMAIL";
    final _tituloFontFamily = "metropolis semi bold";
    final _tituloFontSize = 13.0;
    final _tituloLetterspacing = 2.0;
    final _tituloColor = Color(0xff919191);

    final _entradaColor = Color(0xff323643);
    final _entradaFontSize = 12.0;

    return Padding(
      padding: EdgeInsets.only(
          left: _innerPaddingLeft,
          right: _innerPaddingRight,
          bottom: _innerPaddingBottom,
          top: _innerPaddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _tituloCampo,
            style: TextStyle(
                color: _tituloColor,
                fontSize: _tituloFontSize,
                fontFamily: _tituloFontFamily,
                letterSpacing: _tituloLetterspacing),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: _alignment,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: _entradaColor,
                    helperStyle: TextStyle(
                      color: _entradaColor,
                      fontFamily: _tituloFontFamily,
                      fontSize: _entradaFontSize,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _campoTelefone(BuildContext context) {
    final _containerHeight = 70.0;
    final _containerWidth = MediaQuery.of(context).size.width;
    final _borderRadius = BorderRadius.circular(12.0);
    final _boxShadow = BoxShadow(
      blurRadius: 3,
      offset: Offset(0, 3),
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 1.0,
    );
    final _containerColor = Color(0xffFFFFFF);
    return FadeAnimation(
      1.4,
      Container(
        height: _containerHeight,
        width: _containerWidth,
        decoration: BoxDecoration(
          color: _containerColor,
          borderRadius: _borderRadius,
          boxShadow: [_boxShadow],
        ),
        child: _contentCampoTelefone(),
      ),
    );
  }

  _contentCampoTelefone() {
    final _alignment = Alignment.topLeft;

    final _innerPaddingLeft = 20.0;
    final _innerPaddingTop = 15.0;
    final _innerPaddingBottom = 10.0;
    final _innerPaddingRight = 20.0;

    final _tituloCampo = "TELEFONE";
    final _tituloFontFamily = "metropolis semi bold";
    final _tituloFontSize = 13.0;
    final _tituloLetterspacing = 2.0;
    final _tituloColor = Color(0xff919191);

    final _entradaColor = Color(0xff323643);
    final _entradaFontSize = 12.0;

    return Padding(
      padding: EdgeInsets.only(
          left: _innerPaddingLeft,
          right: _innerPaddingRight,
          bottom: _innerPaddingBottom,
          top: _innerPaddingTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _tituloCampo,
            style: TextStyle(
                color: _tituloColor,
                fontSize: _tituloFontSize,
                fontFamily: _tituloFontFamily,
                letterSpacing: _tituloLetterspacing),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Align(
              alignment: _alignment,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: _entradaColor,
                    helperStyle: TextStyle(
                      color: _entradaColor,
                      fontFamily: _tituloFontFamily,
                      fontSize: _entradaFontSize,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
