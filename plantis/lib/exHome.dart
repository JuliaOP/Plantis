import 'package:flutter/material.dart';
import 'package:plantis/animations/fade_animation.dart';
import 'package:plantis/models/dialogs.dart';
import 'package:plantis/services/auth.dart';

class exHome extends StatefulWidget {
  @override
  _exHomeState createState() => _exHomeState();
}

class _exHomeState extends State<exHome> {
  final AuthService _auth = AuthService(); //access auth log out , sign out
  Dialogs dialogs = new Dialogs();

  viewForPhone(double altura, double largura) {
    return new Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              color: Colors.white70,
              constraints: BoxConstraints(
                maxWidth: largura,
                maxHeight: altura,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xff00c6b9),
                    Color(0xff13da8c),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              height: 170,
            ),

            Positioned(
              top: 45,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: FadeAnimation(
                    1.2,
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    )),
              ),
            ),
            Positioned(
              top: 45,
              right: 20,
              height: 25,
              child: FadeAnimation(
                  1.2,
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    color: Colors.white,
                    label: Text("logout"),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  )),
            ),
            Positioned(
              top: 85,
              left: 25,
              child: FadeAnimation(
                  1.3,
                  Text(
                    "Lista de Cultivo",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: "Metropolis semi bold",
                        height: 1.2,
                        wordSpacing: 1,
                        letterSpacing: 0.8),
                  )),
            ),

            Positioned(
              top: 135,
              left: 10,
              right: 10,
              child: FadeAnimation(
                  1.7,
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 17,
                          ),
                          Image.asset(
                            "images/Agrupar 775.png",
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
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
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
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
                                Spacer(),
                              ]),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "ACIONADO: (caneta) editar lista de plantas");
                                },
                                child: Image.asset(
                                  "images/Agrupar 686.png",
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "ACIONADO: (seta) entrar na lista da planta");
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black.withOpacity(0.2),
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ]),
                    alignment: Alignment.topLeft,
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  )),
            ),

            //bottom app bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                constraints:
                    BoxConstraints(maxHeight: altura, maxWidth: largura),
                color: Colors.white,
                height: 60,
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "images/Tab bar/Prancheta - 5.png",
                              height: 35,
                              width: 35,
                            ),
                            Text(
                              'Cultivo',
                              style: TextStyle(
                                fontFamily: 'Metropolis semi bold',
                                fontSize: 10,
                                color: Colors.cyanAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Image.asset("images/Tab bar/Prancheta - 2.png",
                            height: 35, width: 35),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Image.asset("images/Tab bar/Prancheta - 3.png",
                            height: 35, width: 35),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Image.asset("images/Tab bar/Prancheta - 4.png",
                            height: 35, width: 35),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //botao adicionar cultivo
            Positioned(
              right: 10,
              bottom: 70,
              child: GestureDetector(
                onTap: () {
                  print("ACIONADO: botao + , adicionar cultivo");
                },
                child: Image.asset(
                  "images/Agrupar 214.png",
                  height: 75,
                  width: 75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  viewForTablet(double altura, double largura) {
    return new Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              color: Colors.white70,
              constraints: BoxConstraints(
                maxWidth: largura,
                maxHeight: altura,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xff00c6b9),
                    Color(0xff13da8c),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              height: 140,
            ),
            Positioned(
              top: 40,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: FadeAnimation(
                    1.2,
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    )),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              height: 25,
              child: FadeAnimation(
                  1.2,
                  FlatButton.icon(
                    icon: Icon(Icons.person),
                    color: Colors.white,
                    label: Text("logout"),
                    onPressed: () async {
                      await _auth.signOut();
                    },
                  )),
            ),
            Positioned(
              top: 70,
              left: 25,
              child: FadeAnimation(
                  1.3,
                  Text(
                    "Lista de Cultivo",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: "Metropolis semi bold",
                        height: 1.2,
                        wordSpacing: 1,
                        letterSpacing: 0.8),
                  )),
            ),

            Positioned(
              top: 135,
              left: 10,
              right: 10,
              child: FadeAnimation(
                  1.7,
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 17,
                          ),
                          Image.asset(
                            "images/Agrupar 775.png",
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
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
                                  height: 5,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
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
                                Spacer(),
                              ]),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "ACIONADO: (caneta) editar lista de plantas");
                                },
                                child: Image.asset(
                                  "images/Agrupar 686.png",
                                  height: 30,
                                  width: 30,
                                  alignment: Alignment.centerRight,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print(
                                      "ACIONADO: (seta) entrar na lista da planta");
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black.withOpacity(0.2),
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ]),
                    alignment: Alignment.topLeft,
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 4),
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  )),
            ),

            //bottom app bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                constraints:
                    BoxConstraints(maxHeight: altura, maxWidth: largura),
                color: Colors.white60,
                height: 50,
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Image.asset(
                          "images/facebook.png",
                          height: 35,
                          width: 35,
                        ),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Image.asset("images/facebook.png",
                            height: 35, width: 35),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Image.asset("images/facebook.png",
                            height: 35, width: 35),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Image.asset("images/facebook.png",
                            height: 35, width: 35),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //botao adicionar cultivo
            Positioned(
              right: 10,
              bottom: 55,
              child: GestureDetector(
                onTap: () {
                  print("ACIONADO: (botao +) adicionar cultivo");
                },
                child: Image.asset(
                  "images/Agrupar 214.png",
                  height: 75,
                  width: 75,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600.0;
    final Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return viewForPhone(altura, largura);
    } else if (orientation == Orientation.landscape) {
      return viewForTablet(altura, largura);
    }
  }
}
