import 'package:flutter/material.dart';
import 'package:podboi/models/player_page_model.dart';
import 'package:podboi/service_locator.dart';

import 'package:scoped_model/scoped_model.dart';

class EpisodesPage extends StatelessWidget {
  final int trackNumber;
  EpisodesPage({this.trackNumber});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<PlayerPageModel>(
      model: locator<PlayerPageModel>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: EpisodesListHeaderItem(
                  podcastAuthor: "Srihari Ayapilla",
                  podcastCoverArt:
                      'http://static.libsyn.com/p/assets/e/5/6/1/e56169e9fd5e2571/wolf-final700.jpg',
                  podcastDescription:
                      "Yu hu hu hu, I am the baddest nerd there is. I make super awesome apps and they look really awesome. Also, they're really fun to use",
                  podcastTitle: "Pulihora Culture",
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Container(
                height: 800,
                // TODO: Remove the listview builder and create a dynamic column from a list of fetched episdoes.
                // TODO: Make the whole thing scrollable. Not just the episodes.
                child: ListView.builder(
                  itemBuilder: (_, i) => Container(
                    height: 100.0,
                    child: Center(
                      child: Text(i.toString()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EpisodesListHeaderItem extends StatelessWidget {
  final podcastTitle;
  final podcastAuthor;
  final podcastCoverArt;
  final podcastDescription;
  const EpisodesListHeaderItem(
      {Key key,
      @required this.podcastTitle,
      @required this.podcastAuthor,
      @required this.podcastCoverArt,
      @required this.podcastDescription})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100.0,
                  width: 180.0,
                  child: Center(
                    child: ListTile(
                      title: Text(
                        podcastTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      subtitle: Text(
                        podcastAuthor,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      podcastCoverArt,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Description:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(podcastDescription),
          )
        ],
      ),
    );
  }
}
