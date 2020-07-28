import 'package:RecipeApp/widgets/alertWiggle.dart';
import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  final dynamic item;
  final Function onRecipeTapped;
  RecipeTile({@required this.item, this.onRecipeTapped});
  @override
  Widget build(BuildContext context) {
    return AlertWiggle(
        child: ListTile(
          title: Text(item["recipe"]["label"]),
          subtitle: Text(item["recipe"]["ingredientLines"][0]),
          leading: Hero(
            tag: item["recipe"]["label"],
            child: Image.network(
              item["recipe"]["image"],
              loadingBuilder: (BuildContext context,Widget child, ImageChunkEvent event){
                if (event == null) return child;
                return CircularProgressIndicator(
                  value: event.expectedTotalBytes != null ? event.cumulativeBytesLoaded / event.expectedTotalBytes: null,
                );
              },
            ),
          ), 
          contentPadding: EdgeInsets.all(2),
          isThreeLine: true,
          onTap: () => onRecipeTapped(),
    ));
  }
}
