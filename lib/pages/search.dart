import 'package:RecipeApp/widgets/recipeTile.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class Search extends StatefulWidget {

  dynamic items;

  Search({this.items});

  @override
  _SearchState createState() => _SearchState(
    items: items
  );
}

class _SearchState extends State<Search> {

  dynamic items;
  _SearchState({this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return RecipeTile(item: items[index], onRecipeTapped: (){
              final value = items[index]["recipe"];
              Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeDetails(recipe: value)));
            });
          },
        ),
      ),
    );
  }
}