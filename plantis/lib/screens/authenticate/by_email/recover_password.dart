import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plantis/animations//fade_animation.dart';
import 'package:plantis/models/dialogs.dart';
import 'package:string_validator/string_validator.dart';

class TelaEsqueciSenha extends StatefulWidget {
  @override
  _TelaEsqueciSenhaState createState() => _TelaEsqueciSenhaState();
}

class _TelaEsqueciSenhaState extends State<TelaEsqueciSenha> {

  String email = '';
  Dialogs dialogs = new Dialogs();

  viewForPhone(altura, largura){
    return new
    Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
              maxWidth: largura, maxHeight: altura,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xff00c6b9),
                  Color(0xff13da8c),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            height: 190 ,
          ),
          Positioned(
            top: 45,
            left: 20,
            child:  GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:  FadeAnimation(1.2,Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 18,
              )),
            ),
          ),
          Positioned(
            top: 80,
            left: 25,
            child: FadeAnimation(1.3,Text(
              "Esqueceu sua senha?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontFamily: "Metropolis semi bold",
                  height: 1.2,
                  wordSpacing: 1,
                  letterSpacing: 0.8
              ),
            )),
          ),
          Positioned(
            top: 110,
            left: 25,
            right: 25,
            child: FadeAnimation(1.5, Text(
              "Insira o endereço de e-mail usado ao se registrar",
              style: TextStyle(
                fontFamily: "Metropolis semi bold",
                color: Colors.white.withOpacity(0.6),
                fontSize: 12.5,
              ),
            )),
          ),
          Positioned(
            top: 160,
            left: 10,
            right: 10,
            child: FadeAnimation(1.7 , Container(
              child: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Text(
                      "Endereço de e-mail",
                      style: TextStyle(
                        fontFamily: "Metropolis medium",
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: Color(0xff9e9e9e),
                      ),
                    ),
                  ),

                ],
              ),
              alignment: Alignment.topLeft,
              width: 400,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0 , 4),
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                  ),
                ],
              ),
            ) ),
          ),
          Positioned(
            top: 160,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.only(top: 15, left: 14),
              child: FadeAnimation(1.7 ,TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value){
                  print("valor digitado: $value");
                  email = value;
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Inserir",
                  hintStyle: TextStyle(
                    color: Color(0xff323643),
                    fontFamily: "Metropolis medium",
                  ),
                ),
              )),
            ),
          ),
          Positioned(
            top: 240,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: (){
                if( isEmail(email)){
                  dialogs.information(context, "Yeah!", "Deu certo!");
                }
                else{
                  dialogs.information(context, "Ops...", "Deu errado!");
                }
              },
              child: FadeAnimation(2.0 , Container(
                child:
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: FadeAnimation(2.2 ,Text(
                          "Continuar",
                          style: TextStyle(
                            fontFamily: "Metropolis bold",
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            letterSpacing: 0.4,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),

                    //   new Spacer(),
                    //new Expanded(child: null),
                    Flexible(
                      fit: FlexFit.loose,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 15, top: 10, bottom: 10),


                      child: FadeAnimation(2.2 ,Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffffffff),
                        size: 13,
                      )),
                    ),
                  ],
                ),

                alignment: Alignment.topLeft,
                width: 400,
                height: 50,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff323643),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0 , 4),
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ) ),
            ) ,

          ),


        ],
      ),

    );

  }


  viewForTablet(altura, largura){
    return new
    Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              color: Colors.white,
              constraints: BoxConstraints(
                maxWidth: largura, maxHeight: altura,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xff00c6b9),
                    Color(0xff13da8c),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              height: 190 ,
            ),
            Positioned(
              top: 45,
              left: 20,
              child:  GestureDetector(
                onTap: (){
                  Navigator.of(context).pop(true);
                },
                child:  FadeAnimation(1.2,Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 18,
                )),
              ),
            ),
            Positioned(
              top: 80,
              left: 25,
              child: FadeAnimation(1.3,Text(
                "Esqueceu sua senha?",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: "Metropolis semi bold",
                    height: 1.2,
                    wordSpacing: 1,
                    letterSpacing: 0.8
                ),
              )),
            ),
            Positioned(
              top: 110,
              left: 25,
              right: 25,
              child: FadeAnimation(1.5, Text(
                "Insira o endereço de e-mail usado ao se registrar",
                style: TextStyle(
                  fontFamily: "Metropolis semi bold",
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12.5,
                ),
              )),
            ),
            Positioned(
              top: 160,
              left: 100,
              right: 100,
              child: FadeAnimation(1.7 , Container(
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        "Endereço de e-mail",
                        style: TextStyle(
                          fontFamily: "Metropolis medium",
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                          color: Color(0xff9e9e9e),
                        ),
                      ),
                    ),

                  ],
                ),
                alignment: Alignment.topLeft,
                width: 400,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0 , 4),
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ) ),
            ),
            Positioned(
              top: 160,
              left: 100,
              right: 100,
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 14),
                child: FadeAnimation(1.7 ,TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (String value){
                    print("valor digitado: $value");
                    email = value;

                    //verifyEmail(_emailController);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Inserir",
                    hintStyle: TextStyle(
                      color: Color(0xff323643),
                      fontFamily: "Metropolis medium",
                    ),
                  ),
                )),
              ),
            ),
            Positioned(
              top: 240,
              left: 160,
              right: 160,
              child: GestureDetector(
                onTap: (){
                  if( isEmail(email)){
                    dialogs.information(context, "Yeah!", "Deu certo!");
                  }
                  else{
                    dialogs.information(context, "Ops...", "Deu errado!");
                  }
                },
                child: FadeAnimation(2.0 , Container(
                  child:
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 16, top: 10, bottom: 10),
                        child: Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: FadeAnimation(2.2 ,Text(
                            "Continuar",
                            style: TextStyle(
                              fontFamily: "Metropolis bold",
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              letterSpacing: 0.4,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),

                      //   new Spacer(),
                      //new Expanded(child: null),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: 15, top: 10, bottom: 10),


                        child: FadeAnimation(2.2 ,Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xffffffff),
                          size: 13,
                        )),
                      ),
                    ],
                  ),

                  alignment: Alignment.topLeft,
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff323643),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: Offset(0 , 4),
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ) ),
              ) ,

            ),


          ],
        ),
      ),

    );
  }


  @override
  Widget build(BuildContext context) {

    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600.0;
    final Orientation orientation = MediaQuery.of(context).orientation;

    if(orientation == Orientation.portrait){
      return viewForPhone(altura, largura);
    }
    else if(orientation == Orientation.landscape){
      return viewForTablet(altura, largura);
    }


  }
}