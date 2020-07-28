import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
  final dynamic item;
  final Function onRecipeTapped;
  RecipeTile({@required this.item, this.onRecipeTapped});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item["recipe"]["label"]),
      subtitle: Text(item["recipe"]["ingredientLines"][0]),
      leading: Container(
        height: 80,
        width: 80,
        child: Card(
          elevation: 30,
          color: Colors.black12,
          child: Hero(
            tag: item["recipe"]["label"],
            child: Image.network(
              item["recipe"]["image"],
              fit: BoxFit.cover,
              loadingBuilder:
                  (BuildContext context, Widget child, ImageChunkEvent event) {
                if (event == null) return child;
                return CircularProgressIndicator(
                  value: event.expectedTotalBytes != null
                      ? event.cumulativeBytesLoaded / event.expectedTotalBytes
                      : null,
                );
              },
            ),
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(2),
      onTap: () => onRecipeTapped(),
    );
  }
}
