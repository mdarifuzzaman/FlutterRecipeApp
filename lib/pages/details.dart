import 'package:RecipeApp/widgets/recipeImage.dart';
import 'package:flutter/material.dart';

class RecipeDetails extends StatefulWidget {
  final dynamic recipe;
  RecipeDetails({@required this.recipe});
  @override
  _RecipeDetailsState createState() => _RecipeDetailsState(recipe: this.recipe);
}

class _RecipeDetailsState extends State<RecipeDetails>
    with TickerProviderStateMixin {
  double _height = 300.0;
  double _width = 300.0;
  var _color = Colors.blue;
  bool _resized = false;

  final dynamic recipe;
  _RecipeDetailsState({@required this.recipe});

  List<Widget> getList() {
    List<Widget> data = new List<Widget>();
    for (var i = 0; i < recipe["ingredientLines"].toList().length; i++) {
      data.add(Container(
        margin: EdgeInsets.fromLTRB(5, 2, 2, 2),
        child: Text(
          recipe["ingredientLines"][i],
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ));
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 8,
              child: SingleChildScrollView(
                child: Column(children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_resized) {
                            _resized = false;
                            _color = Colors.blue;
                            _height = 300;
                            _width = 300;
                          } else {
                            _resized = true;
                            _color = Colors.blue;
                            _height = MediaQuery.of(context).size.height - 10;
                            _width = MediaQuery.of(context).size.width;
                          }
                        });
                      },
                      child: AnimatedSize(
                          curve: Curves.slowMiddle,
                          vsync: this,
                          duration: Duration(milliseconds: 500),
                          child: RecipeImage(
                            title: recipe["label"],
                            imageUrl: recipe["image"],
                            height: _height,
                            width: _width,
                          ))),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(10, 10, 2, 10),
                        child: Card(
                          elevation: 10,
                          child: Column(children: <Widget>[
                            Text("Ingredients", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                            ),),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: getList(),
                            ),
                          ]),
                        ),
                      )),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
