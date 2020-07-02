import 'package:flutter/material.dart';

class Dialogs{

  information(BuildContext context, String title, String description){
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context)=>
        AlertDialog(
          title: Text(title,
          style: TextStyle(
              fontFamily: "Metropolis bold",
              fontWeight: FontWeight.normal,
             // fontSize: 15,
              letterSpacing: 0.4,
              color: Colors.black
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(description,
                style: TextStyle(
                  fontFamily: "Metropolis bold",
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  letterSpacing: 0.4,
                  color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                   "Ok",
                    style: TextStyle(
                    fontFamily: "Metropolis bold",
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    letterSpacing: 0.4,
                    color: Colors.black,
                 ),
              ),
            )
          ],
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius:  BorderRadius.circular((15)),
          ),
      )
    );
  } //information

  waiting(BuildContext context, String title, String description){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context)=>
          AlertDialog(
            title: Text(title,
                style: TextStyle(
                    fontFamily: "Metropolis bold",
                    fontWeight: FontWeight.normal,
                    // fontSize: 15,
                    letterSpacing: 0.4,
                    color: Colors.black
                )),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(description,
                    style: TextStyle(
                      fontFamily: "Metropolis bold",
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.4,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            elevation: 15,
            shape: RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular((15)),
            ),
          )

    );
  }//waiting

  _confirmResult(bool isYes, BuildContext context){
    if(isYes){
      print("yes action");
      Navigator.pop(context);
    }
    else{
      print("cancel action");
      Navigator.pop(context);
    }
  }

  confirmation(BuildContext context, String title, String description){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)=>
            AlertDialog(
              title: Text(title,
                  style: TextStyle(
                      fontFamily: "Metropolis bold",
                      fontWeight: FontWeight.normal,
                      // fontSize: 15,
                      letterSpacing: 0.4,
                      color: Colors.black
                  )),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(description,
                      style: TextStyle(
                        fontFamily: "Metropolis bold",
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        letterSpacing: 0.4,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  onPressed: () => _confirmResult(false, context),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      fontFamily: "Metropolis bold",
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.4,
                      color: Colors.black,
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () => _confirmResult(true, context),
                  child: Text(
                    "Sim",
                    style: TextStyle(
                      fontFamily: "Metropolis bold",
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      letterSpacing: 0.4,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius:  BorderRadius.circular((15)),
              ),
            )
    );
  }//confirmation

}