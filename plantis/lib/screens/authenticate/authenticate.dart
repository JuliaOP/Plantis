import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plantis/models/dialogs.dart';
import 'package:plantis/screens/authenticate/by_email/sign_in/sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:plantis/services/auth.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  Dialogs dialogs = new Dialogs();

  FacebookLogin facebookLogin = new FacebookLogin();
  FirebaseUser fbUser;
  FirebaseUser googleUser;
  GoogleSignIn ggleSignIn = new GoogleSignIn();


  //views for phone and tablet
  //view for phone - DONE
  viewForPhone(double altura, double largura)  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: BoxConstraints(maxWidth: largura,maxHeight: altura),
        child:
        Center(
          heightFactor: MediaQuery.of(context).size.height,
          widthFactor: MediaQuery.of(context).size.width,
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 12, right: 25, left: 25),
                      child: Image.asset("images/Agrupar 733.png",
                        width: 70,
                        height: 70,
                      ),

                    ),
                  ],

                ),


                Padding(
                  padding: EdgeInsets.only( bottom: 10, right: 25, left: 25),
                  child: Text(
                    "Cultive as plantas que quiser e compartilhe-as",
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Metropolis extra bold',
                      color: Colors.black.withOpacity(0.75),
                      wordSpacing: 1,
                      letterSpacing: 1,
                      height: 1.2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15,right: 25, left: 25, top: 10),
                  child: Text(
                    "Não importa se você cultiva ou quer cultivar em sua casa, escritório ou empresa, o Plantis vai te ajudar",
                    style: TextStyle(
                      fontSize: 12.5,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Metropolis medium',
                      color: Colors.black.withOpacity(0.75),
                      wordSpacing: 1,
                      letterSpacing: 1,
                      height: 1.7,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: SizedBox(
                    height: double.infinity,
                  ),
                ),

                Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[



                      //FACEBOOK BUTTON
                      Padding(
                        padding: EdgeInsets.only( top: 15, bottom: 2, left: 25, right: 25),
                        child:
                        Padding(
                          padding: EdgeInsets.symmetric( vertical: 4),

                          child: GestureDetector(
                            onTap: ()async{

                              final FacebookLoginResult facebookLoginResult = await facebookLogin.logIn(['email', 'public_profile']);
                              FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
                              AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);

                              fbUser = (await FirebaseAuth.instance.signInWithCredential(authCredential)
                              ).user;

                              print("botao facebook acionado");

                            },
                            child:  Container(
                              child: ButtonBar(
                                mainAxisSize: MainAxisSize.min,

                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(

                                        padding: EdgeInsets.only(left: 3, right: 3,top: 5, bottom: 5),
                                        child: Image.asset("images/facebook.png",
                                          height: 20,
                                          width: 20,
                                        ),

                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(left: 10),

                                        child: Text(
                                          "Continuar com o Facebook",
                                          //textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Metropolis medium',
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(left: 30 ),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Colors.black87,
                                            size: 11 ),

                                      ),


                                    ],
                                  ),

                                ],

                              ),


                              alignment: Alignment.bottomCenter,
                              width: 400,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xfff2f2f2),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0 , 4),
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: -1,
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ),
                      ),



                      //GOOGLE BUTTON
                      Padding(
                        padding: EdgeInsets.only( bottom: 5, left: 25, right: 25),
                        child:
                        Padding(
                          padding: EdgeInsets.symmetric( vertical: 4),

                          child: GestureDetector(
                            onTap: ()async{
                              GoogleSignInAccount googleSignInAccount = await ggleSignIn.signIn();
                              GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

                              AuthCredential credential = GoogleAuthProvider.getCredential(
                                  idToken: googleSignInAuthentication.idToken,
                                  accessToken: googleSignInAuthentication.accessToken);
                              AuthResult result = (await FirebaseAuth.instance.signInWithCredential(credential));
                              googleUser = result.user;

                              print("botao google acionado");
                            },
                            child:  Container(
                              child: ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(

                                        padding: EdgeInsets.only(left: 3, right: 3, bottom: 5, top: 5),
                                        child: Image.asset("images/search.png",
                                          height: 20,
                                          width: 20,
                                        ),

                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(left: 10),

                                        child: Text(
                                          "Continuar com o Google",
                                          //textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Metropolis medium',
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(left: 48 ),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Colors.black87,
                                            size: 11 ),

                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              alignment: Alignment.bottomCenter,
                              width: 400,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xfff2f2f2),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0 , 4),
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: -1,
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ),
                      ),


                      //EMAIL BUTTON
                      Padding(
                        padding: EdgeInsets.only(top: 5,  left: 25, right: 25, bottom: 40),
                        child:
                        Padding(
                          padding: EdgeInsets.symmetric( vertical: 4),

                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn() ));

                            },

                            behavior: HitTestBehavior.translucent,
                            child:  Container(

                              child: ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(left: 3, right: 3, bottom: 7, top: 4),

                                        child: Text(
                                          "Continuar com o e-mail",
                                          textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Metropolis bold',
                                            color: Colors.white,
                                          ),
                                        ),

                                      ),

                                      Padding(
                                        padding: EdgeInsets.only( left: 85, right: 3, bottom: 7, top: 4),
                                        child: Icon(Icons.arrow_forward_ios,
                                            color: Colors.white70,
                                            size: 11 ),

                                      ),
                                    ],

                                  ),

                                ],
                              ),


                              alignment: Alignment.bottomCenter,
                              width: 400,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xff00c6b9),
                                    Color(0xff13da8c),

                                  ],

                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,


                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 8,
                                    offset: Offset(0 , 4),

                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: -1,
                                  ),
                                ],

                              ),
                            ),
                          ),
                        ),
                      ),
                    ],

                  ),
                ),

              ],
            ),


          ),

        ),

      ),


    );
  }

  //view for tablet - DONE
  viewForTablet(double altura, double largura) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child:GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget> [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 5),
                            child: Image.asset("images/Agrupar 733.png",
                              width: 70,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only( top: 5, left: 15, right: 15),
                        child: Text(
                          "Cultive as plantas que quiser e compartilhe-as",
                          style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Metropolis extra bold',
                            color: Colors.black.withOpacity(0.75),
                            wordSpacing: 1,
                            letterSpacing: 1,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: SizedBox(
                          height: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 8),
                        child: Text(
                          "Não importa se você cultiva ou quer cultivar em sua casa, escritório ou empresa, o Plantis vai te ajudar",
                          style: TextStyle(
                            fontSize: 12.5,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Metropolis medium',
                            color: Colors.black.withOpacity(0.75),
                            wordSpacing: 1,
                            letterSpacing: 1,
                            height: 1.7,
                          ),
                        ),
                      ),

                    ]
                ),
                ),
                    Container(
                      child: Column(
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.loose,
                              child: SizedBox(
                                height: double.infinity,
                              ),
                            ),
                            //FACEBOOK BUTTON
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 25.0, right: 10.0,bottom: 8.0),
                                child:
                                GestureDetector(
                                  onTap: ()async{

                                    final FacebookLoginResult facebookLoginResult = await facebookLogin.logIn(['email', 'public_profile']);
                                    FacebookAccessToken facebookAccessToken = facebookLoginResult.accessToken;
                                    AuthCredential authCredential = FacebookAuthProvider.getCredential(accessToken: facebookAccessToken.token);

                                    fbUser = (await FirebaseAuth.instance.signInWithCredential(authCredential)
                                    ).user;
                                    print("signed in " + fbUser.displayName);


                                    print("botao facebook acionado");
                                    /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (SignInFacebook()) ));*/
                                  },
                                  child:  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              top: 5.0,
                                              right: 5.0,
                                              bottom: 5.0),
                                          child: Image.asset("images/facebook.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 15),
                                          child: Container(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: Text(
                                              "Continuar com o Facebook",
                                              //textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 12.5,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Metropolis medium',
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: SizedBox(
                                            height: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              right: 10.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.black87,
                                              size: 11 ),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.bottomCenter,

                                    width: 300,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xfff2f2f2),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          offset: Offset(0 , 4),
                                          color: Colors.black.withOpacity(0.15),
                                          spreadRadius: -1,
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),
                            //GOOGLE BUTTON
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 25.0, right: 10.0,bottom: 11.0),
                                child:
                                GestureDetector(
                                  onTap: ()async{
                                    GoogleSignInAccount googleSignInAccount = await ggleSignIn.signIn();
                                    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

                                    AuthCredential credential = GoogleAuthProvider.getCredential(
                                        idToken: googleSignInAuthentication.idToken,
                                        accessToken: googleSignInAuthentication.accessToken);
                                    AuthResult result = (await FirebaseAuth.instance.signInWithCredential(credential));
                                    googleUser = result.user;
                                    print("botao google acionado");
                                  
                                  },
                                  child:  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 15.0,
                                              top: 5.0,
                                              right: 5.0,
                                              bottom: 5.0),
                                          child: Image.asset("images/search.png",
                                            height: 20,
                                            width: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 15),
                                          child: Container(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: Text(
                                              "Continuar com o Google",
                                              //textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 12.5,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Metropolis medium',
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: SizedBox(
                                            height: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              right: 10.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.black87,
                                              size: 11 ),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.bottomCenter,

                                    width: 300,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xfff2f2f2),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          offset: Offset(0 , 4),
                                          color: Colors.black.withOpacity(0.15),
                                          spreadRadius: -1,
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),

                            //EMAIL BUTTON
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(left: 25.0, right: 10.0,bottom: 8.0),
                                child:
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignIn() ));
                                  },
                                  child:  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[

                                        Padding(
                                          padding: EdgeInsets.only(left:15.0,right: 15),
                                          child: Container(
                                            alignment: AlignmentDirectional.centerStart,
                                            child: Text(
                                              "Continuar com o email",
                                              //textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 12.5,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Metropolis medium',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          fit: FlexFit.loose,
                                          child: SizedBox(
                                            height: double.infinity,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.0,
                                              bottom: 5.0,
                                              right: 10.0),
                                          child: Icon(Icons.arrow_forward_ios,
                                              color: Colors.white70,
                                              size: 11 ),
                                        ),
                                      ],
                                    ),
                                    alignment: Alignment.bottomCenter,

                                    width: 300,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color(0xff00c6b9),
                                          Color(0xff13da8c),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8,
                                          offset: Offset(0 , 4),
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: -1,
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                              ),
                            ),

                          ],
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


    if(orientation == Orientation.portrait){
      return viewForPhone(altura, largura);
    }
    else if(orientation == Orientation.landscape){
      return viewForTablet(altura, largura);
    }

  }
}
