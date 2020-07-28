
import 'package:flutter/material.dart';

class RecipeButton extends StatelessWidget{

  final GestureTapCallback callback;
  final String buttonText;

  RecipeButton({@required this.callback, @required this.buttonText});

  @override
  Widget build(BuildContext context) {
    
    return RawMaterialButton(
      onPressed: callback,
      shape: const StadiumBorder(),
      fillColor: Colors.green,
      splashColor: Colors.greenAccent,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              this.buttonText,
              maxLines: 1,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            )
          ],
        ),
      ),
    );
  }
}