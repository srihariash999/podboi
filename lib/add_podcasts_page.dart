import 'package:podcast_search/podcast_search.dart';
import 'package:flutter/material.dart';

class AddPodcasts extends StatefulWidget {
  @override
  _AddPodcastsState createState() => _AddPodcastsState();
}

class _AddPodcastsState extends State<AddPodcasts> {
  
var _searchResults =  List();
  @override
  void initState() {
    super.initState();
    getPodcasts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (_, i) {
            return Container(
              child: Text( "$_searchResults[i]"  ),
            );
          }),
    );
  }

  getPodcasts() async {
    var search = Search();
    var results =
        await search.search('fish', country: Country.INDIA, limit: 10);
    results.items?.forEach((result) {
      _searchResults.add(result.trackName.toString());
    });
    print(_searchResults);
  }
}
