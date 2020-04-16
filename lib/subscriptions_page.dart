import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:podboi/player-page.dart';

// void main() async {
//   var search = Search();

//   /// Search for the "It's a Widget" podcast.
//   var results = await search.search('widgets',
//       country: Country.UNITED_KINGDOM, limit: 10);

//   /// List the name of each podcast found.
//   results.items?.forEach((result) {
//     print('Found podcast: ${result.trackName}');
//   });

//   /// Parse the first podcast.
//   var podcast = await Podcast.loadFeed(url: results.items[0].feedUrl);

//   /// Display episode titles.
//   podcast.episodes?.forEach((episode) {
//     print('Episode title: ${episode.title}');
//   });

//   /// Find the top 10 podcasts in the UK.
//   var charts = await search.charts(limit: 10, country: Country.UNITED_KINGDOM);

//   /// List the name of each podcast found.
//   charts.items?.forEach((result) {
//     print('Episode title: ${result.trackName}');
//   });
// }

class SubscriptionsPage extends StatefulWidget {
  SubscriptionsPage({Key key}) : super(key: key);

  @override
  _SubscriptionsPageState createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your subscriptions"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Player(),
                  ),
                );
              })
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, i) => CustomItem(
          index: i,
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  final int index;
  const CustomItem({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(" Some text $index"),
    );
  }
}
