import 'package:RecipeApp/pages/search.dart';
import 'package:RecipeApp/services/recipeApi.dart';
import 'package:RecipeApp/widgets/alertWiggle.dart';
import 'package:RecipeApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MainPage(),
      title: "Recipe app2",
      theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          appBarTheme: AppBarTheme(color: Colors.lightBlueAccent)),
      debugShowCheckedModeBanner: false,
    ));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _loadingRecipe = false;
  void searchTapped() {
    print("seached tapped..");
    setState(() {
      _loadingRecipe = !_loadingRecipe;
      RecipeApi api = new RecipeApi();
      api.loadRecipe("keto").then((value) => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Search(
                          items: value,
                        )))
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Keto Recipe"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.adjust), onPressed: null),
          IconButton(icon: Icon(Icons.arrow_downward), onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/images/recipe.jpg"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height / 2 - 90,
              ),
              _loadingRecipe == true
                  ? CircularProgressIndicator()
                  : Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "Enter something to search",
                            hintStyle: TextStyle(
                              color: Colors.black12,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent))),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              RecipeButton(
                buttonText: "Search",
                callback: () => this.searchTapped(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
