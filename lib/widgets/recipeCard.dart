import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String assetPath;
  Function callback;

  RecipeCard({@required this.title, @required this.subTitle, @required this.assetPath, @required this.callback});

  @override
  _RecipeCardState createState() => _RecipeCardState(
    title: title,
    subTitle: subTitle,
    assetPath: assetPath,
    categoryTapped: callback
  );
}

class _RecipeCardState extends State<RecipeCard> with TickerProviderStateMixin {
  final String title;
  final String subTitle;
  final String assetPath;
  Function categoryTapped;

  _RecipeCardState({@required this.title, @required this.subTitle, @required this.assetPath, @required this.categoryTapped});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        this.categoryTapped();
      },
      child: Container(
        width: 180,
        height: 200,
        margin: EdgeInsets.all(1),
        child: Card(
          elevation: 20,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.album,
                  size: 50,
                ),
                title: Text(this.title, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),),
                subtitle: Text(this.subTitle),
              ),
              Container(
                width: 100,
                height: 100,
                child: Image(
                    image: ExactAssetImage(assetPath),
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
