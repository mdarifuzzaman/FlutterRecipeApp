import 'package:RecipeApp/widgets/alertWiggle.dart';
import 'package:RecipeApp/widgets/animatedElevationButton.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final String assetPath;
  Function callback;

  RecipeCard(
      {@required this.title,
      @required this.subTitle,
      @required this.assetPath,
      @required this.callback});

  @override
  _RecipeCardState createState() => _RecipeCardState(
      title: title,
      subTitle: subTitle,
      assetPath: assetPath,
      categoryTapped: callback);
}

class _RecipeCardState extends State<RecipeCard>
    with TickerProviderStateMixin {
  final String title;
  final String subTitle;
  final String assetPath;
  Function categoryTapped;

  AnimationController _animationController;
  Animation<double> _animationTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 100),
      vsync: this,
    );
    _animationTween =
        Tween(begin: 0.5, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  _RecipeCardState(
      {@required this.title,
      @required this.subTitle,
      @required this.assetPath,
      @required this.categoryTapped});

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
    this.categoryTapped();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,

      child: Container(
        width: 165,
        height: 200,
        margin: EdgeInsets.all(1),
        child: Card(
          elevation: 20,
          color: _animationTween.value == 0.5 ? Colors.blueAccent: Colors.grey,
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
                title: Text(
                  this.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
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
