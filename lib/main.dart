import 'dart:ui';

import 'package:RecipeApp/pages/search.dart';
import 'package:RecipeApp/services/recipeApi.dart';
import 'package:RecipeApp/widgets/recipeCard.dart';
import 'package:RecipeApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MainPage(),
      title: "My Awesome Recipes",
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          appBarTheme: AppBarTheme(color: Colors.redAccent)),
      debugShowCheckedModeBanner: false,
    ));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _searchController = new TextEditingController();

  var _loadingRecipe = false;
  void searchTapped() {
    print("seached tapped..");
    setState(() {
      _loadingRecipe = true;
      RecipeApi api = new RecipeApi();
      api.loadRecipe(_searchController.text).then((value) {
        setState(() {
          _loadingRecipe = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Search(
                      items: value,
                    )));
      });
    });
  }

  void searchInCategory(String categoryName){
    setState(() {
      _loadingRecipe = true;
      RecipeApi api = new RecipeApi();
      api.loadRecipe(categoryName).then((value) {
        setState(() {
          _loadingRecipe = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Search(
                      items: value,
                    )));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/app_bar.png",
          fit: BoxFit.cover,
          alignment: Alignment.topLeft,
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.adjust), onPressed: null),
          IconButton(icon: Icon(Icons.arrow_downward), onPressed: null),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 30, 10, 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/images/recipe_image.jpg"),
                  fit: BoxFit.fitHeight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  RecipeCard(
                    assetPath: "assets/images/western.jpg",
                    subTitle: "Western recipes",
                    title: "Western",
                    callback: () => this.searchInCategory("western"),
                  ),
                  RecipeCard(
                    assetPath: "assets/images/curry.jpg",
                    subTitle: "all curries",
                    title: "Curry",
                    callback: () => this.searchInCategory("curry"),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  RecipeCard(
                    assetPath: "assets/images/fries.jpg",
                    subTitle: "Fries recipes",
                    title: "Fries",
                    callback: () => this.searchInCategory("fry"),
                  ),
                  RecipeCard(
                    assetPath: "assets/images/keto.png",
                    subTitle: "keto recipes",
                    title: "Keto",
                    callback: () => this.searchInCategory("keto"),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _loadingRecipe == true
                  ? CircularProgressIndicator()
                  : Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextField(
                        controller: _searchController,
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

              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 2 - 90,
              // ),
              // _loadingRecipe == true
              //     ? CircularProgressIndicator()
              //     : Container(
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(20)),
              //         child: TextField(
              //           textAlign: TextAlign.center,
              //           decoration: InputDecoration(
              //               hintText: "Enter something to search",
              //               hintStyle: TextStyle(
              //                 color: Colors.black12,
              //                 fontSize: 30,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //               enabledBorder: UnderlineInputBorder(
              //                   borderSide:
              //                       BorderSide(color: Colors.transparent)),
              //               focusedBorder: UnderlineInputBorder(
              //                   borderSide:
              //                       BorderSide(color: Colors.transparent))),
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 30,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              // SizedBox(
              //   height: 10,
              // ),
              // RecipeButton(
              //   buttonText: "Search",
              //   callback: () => this.searchTapped(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
