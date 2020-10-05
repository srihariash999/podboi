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
            height: 79,          //changed it to 79, wapis kr lena 80 baad mein
            width: 79,
            margin: EdgeInsets.all(5.0), //changed it to 5, wapis kr lena baad mein
            padding: EdgeInsets.all(5.0),
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
