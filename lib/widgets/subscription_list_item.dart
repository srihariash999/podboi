import 'package:flutter/material.dart';

class SubscriptionListItem extends StatelessWidget {
  final String coverArtURL;
  final String podcastTitle;
  final String podcastAuthor;
  SubscriptionListItem(
      {@required this.coverArtURL,
      @required this.podcastAuthor,
      @required this.podcastTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.all(6.0),
            padding: EdgeInsets.all(6.0),
            child: Image.network(
              coverArtURL,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text(podcastTitle), Text(podcastAuthor)],
          )
        ],
      ),
    );
  }
}
