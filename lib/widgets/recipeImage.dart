
import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final title;
  final imageUrl;
  final height;
  final width;

  const RecipeImage(
      {Key key, this.title, this.imageUrl, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.title, maxLines: 1, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Hero(
          tag: title, 
          child: Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(seconds: 1),
          child: Container(
            width: MediaQuery.of(context).size.width,
          ),
        )
      ],
    );
  }
}
