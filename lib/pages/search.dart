import 'package:RecipeApp/services/recipeApi.dart';
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

  var start = 11;
  var end = 20;
  bool downloadingPrgoress = false;
  _SearchState();

  loadMoreData() async{
    setState(() {
      downloadingPrgoress = true;
    });
    
    RecipeApi api = new RecipeApi();
    final value = await api.loadRecipe(this.widget.searchTerm, start: start.toString(), end: end.toString());
    setState(() {
        this.widget.items.addAll(value);
        start += 10;
        end += 10;
        downloadingPrgoress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[Text(widget.searchTerm),
            SizedBox(
              width: 40,
            ),
            //CircularProgressIndicator()
            this.downloadingPrgoress ? CircularProgressIndicator(): SizedBox(
              width: 1,
            )
          ]
          ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index){
            return RecipeTile(item: widget.items[index], onRecipeTapped: (){
              final value = widget.items[index]["recipe"];
              Navigator.push(context, MaterialPageRoute(builder: (_) => RecipeDetails(recipe: value)));
            }, lastIndex: (index == widget.items.length - 1), onLoadMore: (){
              this.loadMoreData();
            },);
          },
        ),
      ),
    );
  }
}