import 'package:flutter/material.dart';
import 'package:podboi/models/add_podcasts_page_model.dart';
import 'package:podboi/service_locator.dart';
import 'package:podboi/state_enums.dart';
import 'package:scoped_model/scoped_model.dart';

class AddPodcasts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<AddPodcastsPageModel>(
      model: locator<AddPodcastsPageModel>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: ScopedModelDescendant<AddPodcastsPageModel>(
                  builder: (context, child, model) {
                    TextEditingController _searchTextController =
                        TextEditingController();

                    return TextField(
                      controller: _searchTextController,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                        hintText: 'Search for a podcast...',
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              model.textSubmitted(_searchTextController.text);
                              _searchTextController.clear();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: ScopedModelDescendant<AddPodcastsPageModel>(
                  builder: (child, context, model) {
                    ppState _state = model.getState();

                    return ListView.builder(
                      itemCount: model.getItemsLength(),
                      itemBuilder: (BuildContext context, int index) {
                        if (_state == ppState.initial) {
                          if (index == 1) {
                            return Container(
                              height: 130.0,
                              child: Center(
                                child: Text(
                                    "Search for some podcasts to subscribe.."),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        } else if (_state == ppState.loading) {
                          return Container(
                            height: 130.0,
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Image.asset(
                                              'assets/placeholder.png'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text("Loading....."),
                                      subtitle: Text(
                                        "loading.......",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else if (_state == ppState.loaded) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 4)
                            ),
                            height: 130.0,
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Image.network(
                                            model.searchPodcastCover(index),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Episodes: ${model.searchEpisodesCount(index)}",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              model.searchPodcastTitle(index),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: Center(
                                          child: Text(
                                              model.searchPodcastAuthor(index)),
                                        ))
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Center(
                                        child: IconButton(
                                          icon: Icon(Icons.add_circle),
                                          onPressed: () {
                                            print(
                                                "Add search Item at  $index  to library");
                                                model.storeAsSubscription(index);
                                          },
                                        ),
                                      ),
                                      Text("Subscribe"),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          );
                        } else if (_state == ppState.error) {
                          if (index == 1) {
                            return Container(
                              height: 130.0,
                              child: Center(
                                child: Text(
                                    "Need an active Internet connection to search !"),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        } else if (_state == ppState.noresults) {
                          if (index == 1) {
                            return Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 60.0),
                                height: 130.0,
                                child: Center(
                                  child: Text(
                                      "Could not find anything matching your search, check again!"),
                                ),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }

                        return Container(
                          child: Text(_state.toString()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
