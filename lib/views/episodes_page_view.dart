import 'package:flutter/material.dart';
import 'package:podboi/models/episodes_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/state_enums.dart';
import 'package:scoped_model/scoped_model.dart';

class EpisodesPage extends StatelessWidget {
  final int podcastIndex;
  EpisodesPage({@required this.podcastIndex});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<EpisodesPageModel>(
      model: locator<EpisodesPageModel>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: ScopedModelDescendant<EpisodesPageModel>(
          builder: (context, child, model) {
            var _state = model.getState();

            if (_state == epState.initial) {
              model.pageBuildRequest(podcastIndex);
            } else if (_state == epState.loading) {
              return Container();
            } else if (_state == epState.loaded) {
              int cou = model.requestEpisodesCount() + 1;
              print('cou is: $cou');
              return ListView.builder(
                itemCount: cou,
                itemBuilder: (_, i) {
                  if (i == 0) {
                    print('this is: $i');
                    return Column(
                      children: [
                        Container(
                          child: EpisodesListHeaderItem(
                            podcastAuthor:
                                model.requestPodcastAuthor().toString(),
                            podcastCoverArt: model
                                .requestPodcastCoverArt()
                                .toString(),
                            podcastDescription:
                                "Yu hu hu hu, As a total genius I am, I totally forgot to get the podcast description into the database when I was storing the podcasts as subscriptions. So You need to make do with this now: 'This is an awesome podcast Dawg'",
                            podcastTitle:
                                model.requestPodcastTitle().toString(),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }

                  else 
                  {print('this is: $i');
                  // TODO: Make the UI for the Episode tile. Add play button which will start the player.
                    return Container(
                    height: 100.0,
                    child: Center(
                      child: Text(
                        model.requestEpisodeName(i -1),
                      ),
                    ),
                  );
                  }
                },
              );
            }
            return Container(
              child: Center(
                child:
                    Text("ERROR DAWG!! Tell the dev to check the states again"),
              ),
            );
          },
        ),
      ),
    );
  }
}

class EpisodesListHeaderItem extends StatelessWidget {
  final String podcastTitle;
  final String podcastAuthor;
  final String podcastCoverArt;
  final String podcastDescription;
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
