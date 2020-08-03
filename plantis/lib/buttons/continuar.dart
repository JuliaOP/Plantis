import 'package:flutter/material.dart';
import 'package:plantis/animations/fade_animation.dart';
import 'package:plantis/models/dialogs.dart';
import 'package:plantis/screens/authenticate/by_email/sign_in/sign_in_password.dart';
import 'package:string_validator/string_validator.dart';

class ContinuarButton extends StatelessWidget {
  Dialogs dialogs = new Dialogs();
  String email ='';

  @override
  Widget build(BuildContext context) {
    return
      Positioned(
        top: 240,
        left: 10,
        right: 10,
        child: GestureDetector(
          onTap: () async {
            if(isEmail(email))  {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInPassword(
                        email: email,
                      )
                  )
              );
              print("botao continuar acionado");
            }
            else{
              dialogs.information(context, "Ops...", "Insira um email válido.");
              //dialogs.confirmation(context, "Yeah", "Confirma?");
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
      );
  }
}
