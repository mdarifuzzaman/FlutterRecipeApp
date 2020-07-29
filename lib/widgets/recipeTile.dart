import 'package:flutter/material.dart';

class RecipeTile extends StatefulWidget {
  final dynamic item;
  final Function onRecipeTapped;
  final Function onLoadMore;
  final bool lastIndex;

  RecipeTile(
      {@required this.item,
      this.onRecipeTapped,
      this.lastIndex,
      this.onLoadMore});

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  var loading = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.item["recipe"]["label"]),
      subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.item["recipe"]["ingredientLines"][0]),
            this.widget.lastIndex
                ? FlatButton(
                    onPressed: () {
                      loading = true;
                      widget.onLoadMore();
                      loading = false;
                    },
                    child: Text("Tap to Load More.."))
                : SizedBox(
                    height: 1,
                  ),
          ],),
      leading: Container(
        height: 80,
        width: 80,
        child: Card(
          elevation: 30,
          color: Colors.black12,
          child: Hero(
            tag: widget.item["recipe"]["label"],
            child: Image.network(
              widget.item["recipe"]["image"],
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
      onTap: () => widget.onRecipeTapped(),
    );
  }
}
