import 'package:RecipeApp/widgets/recipeTile.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class Search extends StatefulWidget {

  final dynamic items;
  final String searchTerm;

  Search({this.items, this.searchTerm});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  _SearchState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchTerm),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index){
            return RecipeTile(item: widget.items[index], onRecipeTapped: (){
              final value = widget.items[index]["recipe"];
              Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeDetails(recipe: value)));
            });
          },
        ),
      ),
    );
  }
}